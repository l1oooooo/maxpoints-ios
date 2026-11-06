# Environment verification — 2026-11-06

- Xcode 26.3 (17C529), Swift 6 language mode, deployment target iOS 17.0.
- Debug and Release builds passed on iPhone 16e and iPhone 17 Pro Max simulators with the installed iOS 26.3 runtime.
- Both XCUITests passed on each device: native shell launch and accessibility XXXL text in portrait/landscape. The unit-test target builds but intentionally has no business tests yet.
- A fresh Git checkout built Debug and Release and passed both UI tests without package installation or private configuration; it also opened successfully in Xcode.
- The generated application plist contains the correct native launch-screen Canvas color, iPhone device family, portrait/landscape orientations, and iOS 17 minimum target.
- Initial GitHub Actions run passed: https://github.com/l1oooooo/maxpoints-ios/actions/runs/42294323726
- The working checkout was moved to `~/Developer/MaxPoints` with user approval. macOS file coordination rejected opening the original Documents location with “Too many open files”; the same project opened from a non-Documents checkout. No system/iCloud settings were changed.
- Screenshots: `evidence/iphone-16e.png`, `evidence/iphone-17-pro-max.png`, and `evidence/accessibility-landscape.png`. Landscape evidence uses the full screen capture because the app-only screenshot was cropped incorrectly by Simulator after rotation.
- Runtime testing on iOS 17, physical-device signing, TestFlight, business features, and external integrations are not part of this verification.
