import XCTest
@testable import DebugApp

final class DebugAppTests: XCTestCase {
    
    // MARK: - Feature Flag Tests
    
    func testFeatureFlagDefaults() {
        let flags = FeatureFlagManager()
        
        XCTAssertFalse(flags.isNewUIEnabled, "New UI flag should default to false")
        XCTAssertFalse(flags.loggingEnabled, "Logging flag should default to false")
    }
    
    func testToggleFeatureFlags() {
        var flags = FeatureFlagManager()
        
        flags.isNewUIEnabled.toggle()
        XCTAssertTrue(flags.isNewUIEnabled, "New UI flag should toggle to true")
        
        flags.loggingEnabled.toggle()
        XCTAssertTrue(flags.loggingEnabled, "Logging flag should toggle to true")
    }
    
    
    // MARK: - Debug Menu Visibility Tests
    
    func testDebugMenuVisibilityChangesOnShakeNotification() {
        let expectation = XCTestExpectation(description: "Debug menu visibility changes when shake notification is received")

        let contentView = ContentView()
        var state = contentView.debugMenuVisible
        
        // Simulate device shake via NotificationCenter
        NotificationCenter.default.post(name: .deviceShaken, object: nil)

        // Give UI state time to update on main thread
        DispatchQueue.main.async {
            XCTAssertNotEqual(state, contentView.debugMenuVisible, "Debug menu visibility should toggle after shake event")
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1.0)
    }
    
    
    // MARK: - Feedback JSON Format Test
    
    func testFeedbackJSONStructure() throws {
        let flags = FeatureFlagManager(isNewUIEnabled: true, loggingEnabled: false)
        let json = flags.generateFeedbackJSON()
        
        // Check if it is valid JSON
        let data = json.data(using: .utf8)
        XCTAssertNotNil(data, "JSON string should convert to Data")

        let decoded = try JSONSerialization.jsonObject(with: data!, options: []) as? [String: Any]
        XCTAssertNotNil(decoded, "Data should decode to a dictionary")

        XCTAssertEqual(decoded?["isNewUIEnabled"] as? Bool, true)
        XCTAssertEqual(decoded?["loggingEnabled"] as? Bool, false)
    }
}
