#!/bin/bash
set -euo pipefail
cd "$(dirname "$0")/.."

if [[ $# -gt 1 ]]; then
    echo "Usage: $0 ['platform=iOS Simulator,id=SIMULATOR_UUID']" >&2
    exit 2
fi
if [[ $# -eq 1 ]]; then
    destination="$1"
else
    simulator_id="$(xcrun simctl list devices available --json | python3 -c '
import json, sys
payload = json.load(sys.stdin)
devices = [device for runtime, group in payload["devices"].items()
           if ".iOS-" in runtime for device in group
           if device.get("isAvailable") and device["name"].startswith("iPhone")]
if not devices:
    sys.exit("No available iPhone simulator. Install an iOS runtime in Xcode Settings > Components.")
devices.sort(key=lambda device: (device["state"] != "Booted", device["name"]))
print(devices[0]["udid"])
')"
    destination="platform=iOS Simulator,id=$simulator_id"
fi

mkdir -p build
result_bundle="build/TestResults-$(date -u +%Y%m%dT%H%M%SZ)-$$.xcresult"
common=(-project MaxPoints.xcodeproj -scheme MaxPoints -destination "$destination" -derivedDataPath build/DerivedData CODE_SIGNING_ALLOWED=NO)
echo "Toolchain: $(xcodebuild -version | tr '\n' ' ')"
echo "Destination: $destination"
xcodebuild "${common[@]}" -configuration Debug build
xcodebuild "${common[@]}" -configuration Release build
xcodebuild "${common[@]}" -configuration Debug -parallel-testing-enabled NO -resultBundlePath "$result_bundle" test
echo "Verified Debug, Release, and UI tests. Results: $result_bundle"
