import XCTest
@testable import SwiftUtils

final class SwiftUtilsTests: XCTestCase {
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        let half: Double = 0.5
        let range: ClosedRange<Double> = 1...10
        XCTAssertEqual(half.denormalized(to: range).normalized(from: range), half)
    }
}
