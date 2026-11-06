# MaxPoints iOS project instructions

## Current milestone

This repository is a native SwiftUI iPhone app targeting iOS 17+. Environment setup only: native shell, Xcode project, tests, documentation, and CI. Do not expand into product features without a request. The separate HTML exploration remains the design reference and must not be modified as a side effect of work here.

## Product decisions for future work

- Implement the selected Steps onboarding → Home flow. Do not port rejected comparison directions or the browser control panel.
- Onboarding asks for a name and searches card products. Never collect full card numbers, bank credentials, or connect bank accounts.
- App navigation uses three equal-size icons in one row: Home, Find a store, Your cards. Keep accessible names; no visible labels or elevated middle button.
- Approximate location supplies candidates, never silently confirms a merchant. Always offer merchant search and correction; distinguish duplicate branches. Manual areas must not claim live positioning.
- Recommendations must use only cards the user added. Empty wallets offer card entry; never silently add demo cards. Real reward rules require verified sources; prototype rates are fixtures.
- Cover everyday Home, Plaza, street-side multiple stores, one candidate, no listed stores, unavailable location, and planning from home. A planned destination is not an arrival.
- Widget and Live Activity are deferred. An activity may eventually start only after explicit merchant selection and an active user request.
- Persistence and data-provider selection belong to later milestones. The HTML session-only rule does not settle native persistence requirements.

## Implementation

- Use Swift 6 and SwiftUI with system frameworks. No third-party packages or project generators are required.
- Maintain the checked-in `MaxPoints.xcodeproj` and shared scheme. Use system fonts and original MaxPoints assets; retain pale gray, white, black, and blue design tokens from the reference.
- English app copy; preserve Dynamic Type, VoiceOver names, reduced-motion behavior, and compact/large iPhone layouts.
- Keep feature UI under `MaxPoints/Features`, shared components/tokens under `MaxPoints/Shared`, and assets under `MaxPoints/Resources`.
- No backend, network calls, permission prompts, or hidden sample wallet data in the environment shell.
- Do not commit credentials, signing files, personal paths, user data, DerivedData, `.xcresult` bundles, or Xcode user settings. Device signing team is unset until explicitly configured.

## Validation and delivery

- Open `MaxPoints.xcodeproj`, choose MaxPoints and an iPhone simulator. Command-R runs; Command-U tests.
- Run `./scripts/verify.sh` for Debug + Release builds and tests; optional first argument is an xcodebuild destination string.
- Add meaningful unit tests alongside business logic. Do not add placeholder assertions just to populate the unit-test target.
- Inspect changed UI on small and large iPhone simulators and with accessibility text. Save relevant evidence under `docs/evidence` and document exactly what was tested.
- CI uses macos-15 and Xcode 26.3. Do not silently change the toolchain if a hosted image changes.
- Simulator validation is not physical-device or TestFlight validation. iOS 17 deployment configuration is not an iOS 17 runtime test.
- Before committing run `git diff --check`, review staged files, and exclude generated/private files. After pushing, verify local and remote SHAs match and inspect CI.
