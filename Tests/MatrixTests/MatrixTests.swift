@testable import Matrix
import XCTest

final class MatrixTests: XCTestCase {

    func IntRowColumnDefalutValue() {
        let m = Matrix<Int>(3, 3)
        XCTAssertEqual(m.rows, 3)
        XCTAssertEqual(m.columns, 3)
        XCTAssertEqual(m.shape.0, 3)
        XCTAssertEqual(m.shape.1, 3)
        XCTAssertEqual(m.size, 3*3)
        XCTAssertEqual(m[1], [0,0,0])
        XCTAssertEqual(m[1,1], 0)
        XCTAssertEqual(m[-1], [0,0,0])
        XCTAssertEqual(m[-10], [0,0,0])
        XCTAssertEqual(m[-1, -1], 0)
    }

    func UIntRowColumnDefalutValue() {
        let m = Matrix<UInt>(3, 3)
        XCTAssertEqual(m.rows, 3)
        XCTAssertEqual(m.columns, 3)
        XCTAssertEqual(m.shape.0, 3)
        XCTAssertEqual(m.shape.1, 3)
        XCTAssertEqual(m.size, 3*3)
        XCTAssertEqual(m[1], [0,0,0])
        XCTAssertEqual(m[1,1], 0)
        XCTAssertEqual(m[-1], [0,0,0])
        XCTAssertEqual(m[-20], [0,0,0])
        XCTAssertEqual(m[-1, -1], 0)
    }

    func IntRowColumnWithGivenValue() {
        let m = Matrix<Int>(3, 3, 5)
        XCTAssertEqual(m.rows, 3)
        XCTAssertEqual(m.columns, 3)
        XCTAssertEqual(m.shape.0, 3)
        XCTAssertEqual(m.shape.1, 3)
        XCTAssertEqual(m.size, 3*3)
        XCTAssertEqual(m[1], [5,5,5])
        XCTAssertEqual(m[1,1], 5)
        XCTAssertEqual(m[-1], [5,5,5])
        XCTAssertEqual(m[-2], [5,5,5])
        XCTAssertEqual(m[-1, -1], 5)
    }

    func UIntRowColumnWithGivenValue() {
        let m = Matrix<UInt>(3, 3, 5)
        XCTAssertEqual(m.rows, 3)
        XCTAssertEqual(m.columns, 3)
        XCTAssertEqual(m.shape.0, 3)
        XCTAssertEqual(m.shape.1, 3)
        XCTAssertEqual(m.size, 3*3)
        XCTAssertEqual(m[1], [5,5,5])
        XCTAssertEqual(m[-1], [5,5,5])
        XCTAssertEqual(m[-2], [5,5,5])
        XCTAssertEqual(m[-1, -1], 5)
        XCTAssertEqual(m[1,1], 5)
    }

    func TestWithValid2dArrayInput() {
        let array = [[1,1,1],[2,2,2]]
        let m = Matrix(array)

        XCTAssertEqual(m.rows, 2)
        XCTAssertEqual(m.columns, 3)
        XCTAssertEqual(m.shape.0, 2)
        XCTAssertEqual(m.shape.1, 3)
        XCTAssertEqual(m.size, 2*3)
        XCTAssertEqual(m[0], [1,1,1])
        XCTAssertEqual(m[1], [2,2,2])
        XCTAssertEqual(m[-1], [2,2,2])
        XCTAssertEqual(m[-1,-1], 2 )
    }

    func TestWithEmpty2dArrayInput() {
        let array = [[Int]]()
        let m = Matrix(array)

        XCTAssertEqual(m.rows, 0)
        XCTAssertEqual(m.columns, 0)
        XCTAssertEqual(m.shape.0, 0)
        XCTAssertEqual(m.shape.1, 0)
        XCTAssertEqual(m.size, 0)
    }

    func TestWithMismatchedRowsAndColumns2dArrayInput() {
        // rows != columns
        let array = [[1,1,1],[2,2]]
        let m = Matrix(array)

        XCTAssertEqual(m.rows, 0)
        XCTAssertEqual(m.columns, 0)
        XCTAssertEqual(m.shape.0, 0)
        XCTAssertEqual(m.shape.1, 0)
        XCTAssertEqual(m.size, 0)
    }

    static var allTests = [
        ("IntRowColumnDefalutValue", IntRowColumnDefalutValue),
        ("UIntRowColumnDefalutValue", UIntRowColumnDefalutValue),
        ("IntRowColumnWithGivenValue", IntRowColumnWithGivenValue),
        ("UIntRowColumnWithGivenValue", UIntRowColumnWithGivenValue),
        ("TestWithValid2dArrayInput", TestWithValid2dArrayInput),
        ("TestWithEmpty2dArrayInput", TestWithEmpty2dArrayInput),
        ("TestWithMismatchedRowsAndColumns2dArrayInput", TestWithMismatchedRowsAndColumns2dArrayInput),
    ]
}
