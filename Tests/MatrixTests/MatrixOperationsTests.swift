import XCTest
@testable import Matrix

final class MatrixOperationsTests: XCTestCase {

    private var twoByThreeDouble = Matrix<Double>(2, 3)
    private var threeByThreeDouble = Matrix<Double>(3, 3)
    private var twoByTwoDouble = Matrix<Double>(2, 2)
    private var twoByThreeInt = Matrix<Int>(2, 3)
    private var threeByThreeInt = Matrix<Int>(3, 3)
    private var twoByTwoInt = Matrix<Int>(2, 2)

    override func setUp() {
        twoByThreeDouble = Matrix<Double>([[1.1, 2.2, 3.3], [4.4, 5.5, 6.6]])
        threeByThreeDouble = Matrix<Double>([[1.1, 2.2, 3.3], [4.4, 5.5, 6.6], [7.7, 8.8, 9.9]])
        twoByThreeInt = Matrix<Int>([[1, 2, 3], [4, 5, 6]])
        threeByThreeInt = Matrix<Int>([[1, 2, 3], [4, 5, 6], [7, 8, 9]])
    }

    func testMatrixEquality() {
        XCTAssertEqual(true, twoByThreeDouble == twoByThreeDouble)
        XCTAssertEqual(false, twoByThreeDouble == threeByThreeDouble)
        XCTAssertEqual(true, twoByThreeInt == twoByThreeInt)
        XCTAssertEqual(false, twoByThreeInt == threeByThreeInt)
    }

    func testMatrixGreaterOrEqual() {
        XCTAssertEqual(true, twoByThreeDouble >= twoByThreeDouble)
        XCTAssertEqual(false, twoByThreeDouble >= threeByThreeDouble)
        XCTAssertEqual(true, twoByThreeInt >= twoByThreeInt)
        XCTAssertEqual(false, twoByThreeInt >= threeByThreeInt)

        XCTAssertEqual(true, twoByThreeInt >= twoByTwoInt)
        XCTAssertEqual(false, twoByTwoInt >= twoByThreeInt)
        XCTAssertEqual(true, twoByThreeDouble >= twoByTwoDouble)
        XCTAssertEqual(false, twoByTwoDouble >= twoByThreeDouble)
    }

    func testMatrixSmallerOrEqual() {
        XCTAssertEqual(true, twoByThreeDouble <= twoByThreeDouble)
        XCTAssertEqual(true, twoByThreeDouble <= threeByThreeDouble)
        XCTAssertEqual(true, twoByThreeInt <= twoByThreeInt)
        XCTAssertEqual(true, twoByThreeInt <= threeByThreeInt)

        XCTAssertEqual(false, twoByThreeInt <= twoByTwoInt)
        XCTAssertEqual(true, twoByTwoInt <= twoByThreeInt)
        XCTAssertEqual(false, twoByThreeDouble <= twoByTwoDouble)
        XCTAssertEqual(true, twoByTwoDouble <= twoByThreeDouble)
    }
}
