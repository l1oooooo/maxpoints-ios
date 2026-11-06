import XCTest

final class LaunchTests: XCTestCase {
    @MainActor
    func testAppLaunchesIntoNativeShell() {
        let app = XCUIApplication()
        app.launch()
        XCTAssertTrue(app.scrollViews["maxpoints.root"].waitForExistence(timeout: 10))
        XCTAssertTrue(app.staticTexts["maxpoints.title"].isHittable)
        XCTAssertTrue(app.staticTexts["maxpoints.tagline"].isHittable)
    }

    @MainActor
    func testShellWithAccessibilityTextInBothOrientations() {
        let app = XCUIApplication()
        app.launchArguments = ["-UIPreferredContentSizeCategoryName", "UICTContentSizeCategoryAccessibilityXXXL"]
        XCUIDevice.shared.orientation = .portrait
        defer { XCUIDevice.shared.orientation = .portrait }
        app.launch()
        XCTAssertTrue(app.staticTexts["maxpoints.title"].waitForExistence(timeout: 10))
        XCTAssertTrue(app.staticTexts["maxpoints.title"].isHittable)
        XCTAssertTrue(app.staticTexts["maxpoints.tagline"].isHittable)
        XCUIDevice.shared.orientation = .landscapeLeft
        let root = app.scrollViews["maxpoints.root"]
        root.swipeUp()
        XCTAssertTrue(app.staticTexts["maxpoints.tagline"].isHittable)
        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Accessibility text - landscape"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
