@testable import Matrix
import XCTest

final class MatrixTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        let m = Matrix(3, 3, 5)
        XCTAssertEqual(m.Rows, 3)
        XCTAssertEqual(m.Columns, 3)
        XCTAssertEqual(m.Shape.0, 3)
        XCTAssertEqual(m.Shape.1, 3)
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
