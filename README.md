# MaxPoints for iPhone

Native SwiftUI environment for MaxPoints, a card-reward advisor. This initial milestone contains a launchable app shell, Xcode targets, UI smoke tests, and CI. Product features are not implemented yet.

## Open and run

The working checkout is `~/Developer/MaxPoints`, outside iCloud-synced Documents. See [verification evidence](docs/VERIFICATION.md).

1. Open `MaxPoints.xcodeproj` in Xcode 26.3.
2. Select the shared **MaxPoints** scheme and an available iPhone simulator.
3. Run with Command-R; run tests with Command-U.

No package installation, backend, API key, or Apple developer account is needed for Simulator. The development bundle identifier is `com.l1oooooo.maxpoints`. Device signing is intentionally unconfigured.

## Verify from Terminal

```sh
./scripts/verify.sh
# Optional specific simulator:
./scripts/verify.sh 'platform=iOS Simulator,id=YOUR_SIMULATOR_UUID'
```

The script builds Debug and Release, then runs tests. It chooses an available iPhone simulator (preferring one already booted) and writes DerivedData and timestamped `.xcresult` bundles under ignored `build/`. Install a simulator runtime from Xcode Settings > Components if none is available. Set `DEVELOPER_DIR` in your shell to select an alternate Xcode installation without changing global settings.

CI runs the same script on `macos-15`, explicitly using `/Applications/Xcode_26.3.app/Contents/Developer`. Failed test results are uploaded for seven days. Hosted images change; an unavailable pinned Xcode is a toolchain maintenance issue, not a reason to silently change compiler versions.

## Toolchain and scope

- Xcode 26.3 (17C529), Swift 6 language mode; deployment target iOS 17.0.
- Native SwiftUI, iPhone portrait and landscape, system fonts, no third-party dependencies.
- Local simulator runtime: iOS 26.3. Minimum-target compilation does not establish runtime testing on iOS 17.
- Light appearance follows the approved prototype. Dark-mode design is deferred.
- Unit-test target is prepared; domain tests will accompany actual business logic. Current tests cover app launch and accessibility-size text in portrait/landscape.
- No persistence, network requests, location permission, banking connection, Widget, or Live Activity in this milestone.

## Product reference and next milestones

The separate [HTML exploration repository](https://github.com/l1oooooo/maxpoints-location-exploration) is the design reference. Its approved direction is Steps onboarding → everyday Home, with three equally sized bottom navigation icons. Experimental variants and the external scenario panel are not production requirements. No HTML checkout or server is required by this app.

1. Name entry, local card-product search, and wallet review.
2. Local profile/wallet persistence and connected Home.
3. Merchant selection, correction, search, and the agreed location scenarios using labeled fixtures.
4. Recommendations using only cards the user added.
5. Native location, real merchant data, and verified reward rules.
6. Device signing and TestFlight; revisit Widget and Live Activity when requested.

These are later milestones, not implemented features. The prototype's reward rates and merchant placements are demo data, not production sources. See `AGENTS.md` for ongoing implementation rules.
