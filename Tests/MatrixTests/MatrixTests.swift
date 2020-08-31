import XCTest
@testable import Matrix

final class MatrixIntAndUintInitTests: XCTestCase {

    func testMatrixCreationIntWithDefaultValue() {
        let m = Matrix<Int>(3,3)
        XCTAssertEqual(m.rows, 3)
        XCTAssertEqual(m.columns, 3)
        XCTAssertEqual(m.size, 3*3)
        XCTAssertEqual(m.shape.rows, 3)
        XCTAssertEqual(m.shape.columns, 3)
        XCTAssertEqual(m[1], [0,0,0])
        XCTAssertEqual(m[1,1], 0)
    }

    func testMatrixCreationIntWithGivenValue() {
        let m = Matrix<Int>(3, 3, with: 6)
        XCTAssertEqual(m.rows, 3)
        XCTAssertEqual(m.columns, 3)
        XCTAssertEqual(m.size, 3*3)
        XCTAssertEqual(m.shape.rows, 3)
        XCTAssertEqual(m.shape.columns, 3)
        XCTAssertEqual(m[1], [6,6,6])
        XCTAssertEqual(m[1,1], 6)
    }

    func testMatrixCreationUintWithDefaultValue() {
        let m = Matrix<UInt>(3,3)
        XCTAssertEqual(m.rows, 3)
        XCTAssertEqual(m.columns, 3)
        XCTAssertEqual(m.size, 3*3)
        XCTAssertEqual(m.shape.rows, 3)
        XCTAssertEqual(m.shape.columns, 3)
        XCTAssertEqual(m[1], [0,0,0])
        XCTAssertEqual(m[1,1], 0)
    }

    func testMatrixCreationUintWithGivenValue() {
        let m = Matrix<Int>(3, 3, with: 6)
        XCTAssertEqual(m.rows, 3)
        XCTAssertEqual(m.columns, 3)
        XCTAssertEqual(m.size, 3*3)
        XCTAssertEqual(m.shape.rows, 3)
        XCTAssertEqual(m.shape.columns, 3)
        XCTAssertEqual(m[1], [6,6,6])
        XCTAssertEqual(m[1,1], 6)
    }

    func testMatrixCreationWithIntArrayOfArray() {
        let m = Matrix<Int>([[1,1,1],[2,2,2], [3,3,3]])
        XCTAssertEqual(m.rows, 3)
        XCTAssertEqual(m.columns, 3)
        XCTAssertEqual(m.size, 3*3)
        XCTAssertEqual(m.shape.rows, 3)
        XCTAssertEqual(m.shape.columns, 3)
        XCTAssertEqual(m[1], [2,2,2])
        XCTAssertEqual(m[1,1], 2)
    }

    func testMatrixCreationWithUintArrayOfArray() {
        let m = Matrix<UInt>([[1,1,1],[2,2,2], [3,3,3]])
        XCTAssertEqual(m.rows, 3)
        XCTAssertEqual(m.columns, 3)
        XCTAssertEqual(m.size, 3*3)
        XCTAssertEqual(m.shape.rows, 3)
        XCTAssertEqual(m.shape.columns, 3)
        XCTAssertEqual(m[1], [2,2,2])
        XCTAssertEqual(m[1,1], 2)
    }

    func testMatrixCreationWithInvalidUintArrayOfArray() {
        var m = Matrix<UInt>([[1,1,1],[2], [3,3,3]])
        XCTAssertEqual(m.rows, 0)
        XCTAssertEqual(m.columns, 0)
        XCTAssertEqual(m.size, 0)
        XCTAssertEqual(m.shape.rows, 0)
        XCTAssertEqual(m.shape.columns, 0)

        m = Matrix<UInt>([[], [], []])
        XCTAssertEqual(m.rows, 0)
        XCTAssertEqual(m.columns, 0)
        XCTAssertEqual(m.size, 0)
        XCTAssertEqual(m.shape.rows, 0)
        XCTAssertEqual(m.shape.columns, 0)

        m = Matrix<UInt>([[],[2], [3,3,3]])
        XCTAssertEqual(m.rows, 0)
        XCTAssertEqual(m.columns, 0)
        XCTAssertEqual(m.size, 0)
        XCTAssertEqual(m.shape.rows, 0)
        XCTAssertEqual(m.shape.columns, 0)

        m = Matrix<UInt>([[2], [], [3,3,3]])
        XCTAssertEqual(m.rows, 0)
        XCTAssertEqual(m.columns, 0)
        XCTAssertEqual(m.size, 0)
        XCTAssertEqual(m.shape.rows, 0)
        XCTAssertEqual(m.shape.columns, 0)

        m = Matrix<UInt>([[2], [3,3,3], []])
        XCTAssertEqual(m.rows, 0)
        XCTAssertEqual(m.columns, 0)
        XCTAssertEqual(m.size, 0)
        XCTAssertEqual(m.shape.rows, 0)
        XCTAssertEqual(m.shape.columns, 0)

        m = Matrix<UInt>([[]])
        XCTAssertEqual(m.rows, 0)
        XCTAssertEqual(m.columns, 0)
        XCTAssertEqual(m.size, 0)
        XCTAssertEqual(m.shape.rows, 0)
        XCTAssertEqual(m.shape.columns, 0)
    }

    func testMatrixCreationWithInvalidIntArrayOfArray() {
        var m = Matrix<Int>([[1,1,1],[2], [3,3,3]])
        XCTAssertEqual(m.rows, 0)
        XCTAssertEqual(m.columns, 0)
        XCTAssertEqual(m.size, 0)
        XCTAssertEqual(m.shape.rows, 0)
        XCTAssertEqual(m.shape.columns, 0)

        m = Matrix<Int>([[], [], []])
        XCTAssertEqual(m.rows, 0)
        XCTAssertEqual(m.columns, 0)
        XCTAssertEqual(m.size, 0)
        XCTAssertEqual(m.shape.rows, 0)
        XCTAssertEqual(m.shape.columns, 0)

        m = Matrix<Int>([[],[2], [3,3,3]])
        XCTAssertEqual(m.rows, 0)
        XCTAssertEqual(m.columns, 0)
        XCTAssertEqual(m.size, 0)
        XCTAssertEqual(m.shape.rows, 0)
        XCTAssertEqual(m.shape.columns, 0)

        m = Matrix<Int>([[2], [], [3,3,3]])
        XCTAssertEqual(m.rows, 0)
        XCTAssertEqual(m.columns, 0)
        XCTAssertEqual(m.size, 0)
        XCTAssertEqual(m.shape.rows, 0)
        XCTAssertEqual(m.shape.columns, 0)

        m = Matrix<Int>([[2], [3,3,3], []])
        XCTAssertEqual(m.rows, 0)
        XCTAssertEqual(m.columns, 0)
        XCTAssertEqual(m.size, 0)
        XCTAssertEqual(m.shape.rows, 0)
        XCTAssertEqual(m.shape.columns, 0)

        m = Matrix<Int>([[]])
        XCTAssertEqual(m.rows, 0)
        XCTAssertEqual(m.columns, 0)
        XCTAssertEqual(m.size, 0)
        XCTAssertEqual(m.shape.rows, 0)
        XCTAssertEqual(m.shape.columns, 0)
    }

    func testMatrixCreationWithValidIntArray() {
        var m = Matrix<Int>([1,2,3,4,5,6], 2, 3)
        XCTAssertEqual(m.rows, 2)
        XCTAssertEqual(m.columns, 3)
        XCTAssertEqual(m.size, m.rows*m.columns)
        XCTAssertEqual(m.shape.rows, 2)
        XCTAssertEqual(m.shape.columns, 3)
        XCTAssertEqual(m[1], [4,5,6])
        XCTAssertEqual(m[1,1], 5)

        m = Matrix<Int>([1], 1, 1)
        XCTAssertEqual(m.rows, 1)
        XCTAssertEqual(m.columns, 1)
        XCTAssertEqual(m.size, m.rows*m.columns)
        XCTAssertEqual(m.shape.rows, 1)
        XCTAssertEqual(m.shape.columns, 1)
        XCTAssertEqual(m[0], [1])
        XCTAssertEqual(m[0,0], 1)
    }

    func testMatrixCreationWithInvalidIntArray() {
        var m = Matrix<Int>([1,2,3,4,5,6,7], 2, 3)
        XCTAssertEqual(m.rows, 0)
        XCTAssertEqual(m.columns, 0)
        XCTAssertEqual(m.size, m.rows*m.columns)
        XCTAssertEqual(m.shape.rows, 0)
        XCTAssertEqual(m.shape.columns, 0)

        m = Matrix<Int>([], 0, 0)
        XCTAssertEqual(m.rows, 0)
        XCTAssertEqual(m.columns, 0)
        XCTAssertEqual(m.size, m.rows*m.columns)
        XCTAssertEqual(m.shape.rows, 0)
        XCTAssertEqual(m.shape.columns, 0)

        m = Matrix<Int>([], 1, 1)
        XCTAssertEqual(m.rows, 0)
        XCTAssertEqual(m.columns, 0)
        XCTAssertEqual(m.size, m.rows*m.columns)
        XCTAssertEqual(m.shape.rows, 0)
        XCTAssertEqual(m.shape.columns, 0)
    }

    func testMatrixCreationWithValidUintArray() {
        var m = Matrix<UInt>([1,2,3,4,5,6], 2, 3)
        XCTAssertEqual(m.rows, 2)
        XCTAssertEqual(m.columns, 3)
        XCTAssertEqual(m.size, m.rows*m.columns)
        XCTAssertEqual(m.shape.rows, 2)
        XCTAssertEqual(m.shape.columns, 3)
        XCTAssertEqual(m[1], [4,5,6])
        XCTAssertEqual(m[1,1], 5)

        m = Matrix<UInt>([10], 1, 1)
        XCTAssertEqual(m.rows, 1)
        XCTAssertEqual(m.columns, 1)
        XCTAssertEqual(m.size, m.rows*m.columns)
        XCTAssertEqual(m.shape.rows, 1)
        XCTAssertEqual(m.shape.columns, 1)
        XCTAssertEqual(m[0], [10])
        XCTAssertEqual(m[0,0], 10)
    }

    func testMatrixCreationWithInvalidUintArray() {
        var m = Matrix<UInt>([1,2,3,4,5,6,7], 2, 3)
        XCTAssertEqual(m.rows, 0)
        XCTAssertEqual(m.columns, 0)
        XCTAssertEqual(m.size, m.rows*m.columns)
        XCTAssertEqual(m.shape.rows, 0)
        XCTAssertEqual(m.shape.columns, 0)

        m = Matrix<UInt>([], 0, 0)
        XCTAssertEqual(m.rows, 0)
        XCTAssertEqual(m.columns, 0)
        XCTAssertEqual(m.size, m.rows*m.columns)
        XCTAssertEqual(m.shape.rows, 0)
        XCTAssertEqual(m.shape.columns, 0)

        m = Matrix<UInt>([], 1, 1)
        XCTAssertEqual(m.rows, 0)
        XCTAssertEqual(m.columns, 0)
        XCTAssertEqual(m.size, m.rows*m.columns)
        XCTAssertEqual(m.shape.rows, 0)
        XCTAssertEqual(m.shape.columns, 0)
    }
}

final class MatrixFloatAndDoubleInitTests: XCTestCase {

    func testMatrixCreationWithDefaultValue() {
        let m = Matrix<Float>(3,3)
        XCTAssertEqual(m.rows, 3)
        XCTAssertEqual(m.columns, 3)
        XCTAssertEqual(m.size, 3*3)
        XCTAssertEqual(m.shape.rows, 3)
        XCTAssertEqual(m.shape.columns, 3)
        XCTAssertEqual(m[1], [0.0,0.0,0.0])
        XCTAssertEqual(m[1,1], 0.0)
    }

    func testMatrixCreationWithFloatGivenValue() {
        let m = Matrix<Float>(3, 3, with: 6.1)
        XCTAssertEqual(m.rows, 3)
        XCTAssertEqual(m.columns, 3)
        XCTAssertEqual(m.size, 3*3)
        XCTAssertEqual(m.shape.rows, 3)
        XCTAssertEqual(m.shape.columns, 3)
        XCTAssertEqual(m[1], [6.1,6.1,6.1])
        XCTAssertEqual(m[1,1], 6.1)
    }

    func testMatrixCreationWithDoubleDefaultValue() {
        let m = Matrix<Double>(3,3)
        XCTAssertEqual(m.rows, 3)
        XCTAssertEqual(m.columns, 3)
        XCTAssertEqual(m.size, 3*3)
        XCTAssertEqual(m.shape.rows, 3)
        XCTAssertEqual(m.shape.columns, 3)
        XCTAssertEqual(m[1], [0.0,0.0,0.0])
        XCTAssertEqual(m[1,1], 0.0)
    }

    func testMatrixCreationWithDoubleGivenValue() {
        let m = Matrix<Double>(3, 3, with: 6.1)
        XCTAssertEqual(m.rows, 3)
        XCTAssertEqual(m.columns, 3)
        XCTAssertEqual(m.size, 3*3)
        XCTAssertEqual(m.shape.rows, 3)
        XCTAssertEqual(m.shape.columns, 3)
        XCTAssertEqual(m[1], [6.1,6.1,6.1])
        XCTAssertEqual(m[1,1], 6.1)
    }

    func testMatrixCreationWithDoubleArrayOfArray() {
        let m = Matrix<Double>([[1.1,1.1, 1.1],[2.2,2.2,2.2], [3.3,3.3,3.3]])
        XCTAssertEqual(m.rows, 3)
        XCTAssertEqual(m.columns, 3)
        XCTAssertEqual(m.size, 3*3)
        XCTAssertEqual(m.shape.rows, 3)
        XCTAssertEqual(m.shape.columns, 3)
        XCTAssertEqual(m[1], [2.2,2.2,2.2])
        XCTAssertEqual(m[1,1], 2.2)
    }

    func testMatrixCreationWithFloatArrayOfArray() {
        let m = Matrix<Float>([[1.1,1.1, 1.1],[2.2,2.2,2.2], [3.3,3.3,3.3]])
        XCTAssertEqual(m.rows, 3)
        XCTAssertEqual(m.columns, 3)
        XCTAssertEqual(m.size, 3*3)
        XCTAssertEqual(m.shape.rows, 3)
        XCTAssertEqual(m.shape.columns, 3)
        XCTAssertEqual(m[1], [2.2,2.2,2.2])
        XCTAssertEqual(m[1,1], 2.2)
    }

    func testMatrixCreationWithInvalidFloatArrayOfArray() {
        var m = Matrix<Float>([[1.1,1.1,1.1],[2.2], [3,3,3]])
        XCTAssertEqual(m.rows, 0)
        XCTAssertEqual(m.columns, 0)
        XCTAssertEqual(m.size, 0)
        XCTAssertEqual(m.shape.rows, 0)
        XCTAssertEqual(m.shape.columns, 0)

        m = Matrix<Float>([[], [], []])
        XCTAssertEqual(m.rows, 0)
        XCTAssertEqual(m.columns, 0)
        XCTAssertEqual(m.size, 0)
        XCTAssertEqual(m.shape.rows, 0)
        XCTAssertEqual(m.shape.columns, 0)

        m = Matrix<Float>([[],[2], [3,3,3]])
        XCTAssertEqual(m.rows, 0)
        XCTAssertEqual(m.columns, 0)
        XCTAssertEqual(m.size, 0)
        XCTAssertEqual(m.shape.rows, 0)
        XCTAssertEqual(m.shape.columns, 0)

        m = Matrix<Float>([[2], [], [3,3,3]])
        XCTAssertEqual(m.rows, 0)
        XCTAssertEqual(m.columns, 0)
        XCTAssertEqual(m.size, 0)
        XCTAssertEqual(m.shape.rows, 0)
        XCTAssertEqual(m.shape.columns, 0)

        m = Matrix<Float>([[2], [3,3,3], []])
        XCTAssertEqual(m.rows, 0)
        XCTAssertEqual(m.columns, 0)
        XCTAssertEqual(m.size, 0)
        XCTAssertEqual(m.shape.rows, 0)
        XCTAssertEqual(m.shape.columns, 0)

        m = Matrix<Float>([[]])
        XCTAssertEqual(m.rows, 0)
        XCTAssertEqual(m.columns, 0)
        XCTAssertEqual(m.size, 0)
        XCTAssertEqual(m.shape.rows, 0)
        XCTAssertEqual(m.shape.columns, 0)
    }

    func testMatrixCreationWithInvalidDoubleArrayOfArray() {
        var m = Matrix<Double>([[1.1,1.1,1.1],[2.2], [3,3,3]])
        XCTAssertEqual(m.rows, 0)
        XCTAssertEqual(m.columns, 0)
        XCTAssertEqual(m.size, 0)
        XCTAssertEqual(m.shape.rows, 0)
        XCTAssertEqual(m.shape.columns, 0)

        m = Matrix<Double>([[], [], []])
        XCTAssertEqual(m.rows, 0)
        XCTAssertEqual(m.columns, 0)
        XCTAssertEqual(m.size, 0)
        XCTAssertEqual(m.shape.rows, 0)
        XCTAssertEqual(m.shape.columns, 0)

        m = Matrix<Double>([[],[2], [3,3,3]])
        XCTAssertEqual(m.rows, 0)
        XCTAssertEqual(m.columns, 0)
        XCTAssertEqual(m.size, 0)
        XCTAssertEqual(m.shape.rows, 0)
        XCTAssertEqual(m.shape.columns, 0)

        m = Matrix<Double>([[2], [], [3,3,3]])
        XCTAssertEqual(m.rows, 0)
        XCTAssertEqual(m.columns, 0)
        XCTAssertEqual(m.size, 0)
        XCTAssertEqual(m.shape.rows, 0)
        XCTAssertEqual(m.shape.columns, 0)

        m = Matrix<Double>([[2], [3,3,3], []])
        XCTAssertEqual(m.rows, 0)
        XCTAssertEqual(m.columns, 0)
        XCTAssertEqual(m.size, 0)
        XCTAssertEqual(m.shape.rows, 0)
        XCTAssertEqual(m.shape.columns, 0)

        m = Matrix<Double>([[]])
        XCTAssertEqual(m.rows, 0)
        XCTAssertEqual(m.columns, 0)
        XCTAssertEqual(m.size, 0)
        XCTAssertEqual(m.shape.rows, 0)
        XCTAssertEqual(m.shape.columns, 0)
    }

    func testMatrixCreationWithValidFloatArray() {
        var m = Matrix<Float>([1.0,2.0,3.0,4.0,5.0,6.0], 2, 3)
        XCTAssertEqual(m.rows, 2)
        XCTAssertEqual(m.columns, 3)
        XCTAssertEqual(m.size, m.rows*m.columns)
        XCTAssertEqual(m.shape.rows, 2)
        XCTAssertEqual(m.shape.columns, 3)
        XCTAssertEqual(m[1], [4.0,5.0,6.0])
        XCTAssertEqual(m[1,1], 5.0)

        m = Matrix<Float>([10.001], 1, 1)
        XCTAssertEqual(m.rows, 1)
        XCTAssertEqual(m.columns, 1)
        XCTAssertEqual(m.size, m.rows*m.columns)
        XCTAssertEqual(m.shape.rows, 1)
        XCTAssertEqual(m.shape.columns, 1)
        XCTAssertEqual(m[0], [10.001])
        XCTAssertEqual(m[0,0], 10.001)
    }

    func testMatrixCreationWithInvalidFloatArray() {
        var m = Matrix<Float>([1.0,2.0,3.0,4.0,5.0,6.0, 7.0], 2, 3)
        XCTAssertEqual(m.rows, 0)
        XCTAssertEqual(m.columns, 0)
        XCTAssertEqual(m.size, m.rows*m.columns)
        XCTAssertEqual(m.shape.rows, 0)
        XCTAssertEqual(m.shape.columns, 0)

        m = Matrix<Float>([], 0, 0)
        XCTAssertEqual(m.rows, 0)
        XCTAssertEqual(m.columns, 0)
        XCTAssertEqual(m.size, m.rows*m.columns)
        XCTAssertEqual(m.shape.rows, 0)
        XCTAssertEqual(m.shape.columns, 0)

        m = Matrix<Float>([], 1, 1)
        XCTAssertEqual(m.rows, 0)
        XCTAssertEqual(m.columns, 0)
        XCTAssertEqual(m.size, m.rows*m.columns)
        XCTAssertEqual(m.shape.rows, 0)
        XCTAssertEqual(m.shape.columns, 0)
    }

    func testMatrixCreationWithValidDoubleArray() {
        var m = Matrix<Double>([1.0,2.0,3.0,4.0,5.0,6.0], 2, 3)
        XCTAssertEqual(m.rows, 2)
        XCTAssertEqual(m.columns, 3)
        XCTAssertEqual(m.size, m.rows*m.columns)
        XCTAssertEqual(m.shape.rows, 2)
        XCTAssertEqual(m.shape.columns, 3)
        XCTAssertEqual(m[1], [4.0,5.0,6.0])
        XCTAssertEqual(m[1,1], 5.0)

        m = Matrix<Double>([10.001], 1, 1)
        XCTAssertEqual(m.rows, 1)
        XCTAssertEqual(m.columns, 1)
        XCTAssertEqual(m.size, m.rows*m.columns)
        XCTAssertEqual(m.shape.rows, 1)
        XCTAssertEqual(m.shape.columns, 1)
        XCTAssertEqual(m[0], [10.001])
        XCTAssertEqual(m[0,0], 10.001)
    }

    func testMatrixCreationWithInvalidDoubleArray() {
        var m = Matrix<Double>([1.0,2.0,3.0,4.0,5.0,6.0, 7.0], 2, 3)
        XCTAssertEqual(m.rows, 0)
        XCTAssertEqual(m.columns, 0)
        XCTAssertEqual(m.size, m.rows*m.columns)
        XCTAssertEqual(m.shape.rows, 0)
        XCTAssertEqual(m.shape.columns, 0)

        m = Matrix<Double>([], 0, 0)
        XCTAssertEqual(m.rows, 0)
        XCTAssertEqual(m.columns, 0)
        XCTAssertEqual(m.size, m.rows*m.columns)
        XCTAssertEqual(m.shape.rows, 0)
        XCTAssertEqual(m.shape.columns, 0)

        m = Matrix<Double>([], 1, 1)
        XCTAssertEqual(m.rows, 0)
        XCTAssertEqual(m.columns, 0)
        XCTAssertEqual(m.size, m.rows*m.columns)
        XCTAssertEqual(m.shape.rows, 0)
        XCTAssertEqual(m.shape.columns, 0)
    }
}

final class MatrixIndexingOperations: XCTestCase {

    private var m = Matrix<Double>(2, 3)

    override func setUp() {
        super.setUp()
        m = Matrix<Double>([1.0, 2.0, 3.0, 4.0, 5.0, 6.0], 2, 3)
        XCTAssertEqual(m.rows, 2)
        XCTAssertEqual(m.columns, 3)
        XCTAssertEqual(m.size, m.rows*m.columns)
        XCTAssertEqual(m.shape.rows, 2)
        XCTAssertEqual(m.shape.columns, 3)
    }

    func testValidIndex() {
        var v:Double = 1.0
        for rowId in 0..<m.rows {
            for colId in 0..<m.columns {
                XCTAssertEqual(m[Int(rowId), Int(colId)], v)
                v += 1.0
            }
        }
        XCTAssertEqual(m[0, 5], 3.0)
        XCTAssertEqual(m[1, 5], 6.0)
    }

    func testNegetiveIndexes() {
        XCTAssertEqual(m[-1], [4.0, 5.0, 6.0])
        XCTAssertEqual(m[-2], [4.0, 5.0, 6.0])
        XCTAssertEqual(m[-3], [4.0, 5.0, 6.0])
    }

    func testOutOfBoundIndexes() {
        XCTAssertEqual(m[1], [4.0, 5.0, 6.0])
        XCTAssertEqual(m[2], [4.0, 5.0, 6.0])
        XCTAssertEqual(m[3], [4.0, 5.0, 6.0])
    }
}
