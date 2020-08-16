public struct Matrix {
    var Mat = [[Int]]()
    let Rows: Int
    let Columns: Int
    var Size: Int { return Rows * Columns }
    var Shape: (Int, Int) { return (Rows, Columns) }

    public init(_ rows: Int, _ columns: Int, _ val: Int = 0) {
        Rows = rows
        Columns = columns
        Mat = Array(repeating: Array(repeating: val, count: columns), count: rows)
    }
}

extension Matrix {
    var Describe: String { return "Rows  = \(Rows) \nColumns = \(Columns) \nTotalEmenents = \(Rows * Columns)" }
}

extension Matrix {
    public init(_ rows: Int, _ columns: Int, _ val: [Int]) throws {
        guard rows * columns == val.count else {
            throw MatrixOperationErrors.elementsCountMismatch(rows: rows, columns: columns, totalElements: val.count)
        }
        self.init(rows, columns)
        var arrayIndex = 0
        print("vals = \(val)")
        for (rowIdx, elements) in Mat.enumerated() {
            let tmpArray = Array(val[arrayIndex ..< (arrayIndex + columns)])
            print("rowidx = \(rowIdx), arrayIndex = \(arrayIndex) val = \(tmpArray) elements count = \(elements.count)")
            Mat[rowIdx] = Array(tmpArray)
            arrayIndex += tmpArray.count
        }
    }
}

extension Matrix {
    public func Display() {
        for item in Mat {
            var pv: String = ""
            for i in item {
                pv += "\(i) "
            }
            print("\(pv)")
        }
    }
}

extension Matrix {
    subscript(_ index: Int) -> [Int] {
        guard -Rows ..< Rows ~= index else {
            return []
        }
        let convertedIdx = index > 0 ? index : Rows - abs(index)
        return Mat[convertedIdx]
    }
}

enum MatrixOperationErrors: Error {
    case invalidIndex
    case indexOutOfRange(index: Int)
    case elementsCountMismatch(rows: Int, columns: Int, totalElements: Int)
}
/*
do {
    var m: Matrix = Matrix(3, 5, 3)
    m.Display()
    print("\(m.Size)")
    print("\(m.Shape)")
    print("\(m[2])")
    print("\(m[-1])")
} catch let MatrixOperationErrors.elementsCountMismatch(rows, columns, totalElements) {
    print("Matrix elements mismatch, \(rows * columns) != \(totalElements)")
}

do {
    var m1: Matrix = try Matrix(3, 3, Array(1 ... 9))
    m1.Display()
    print("\(m1[-1])")
    print("\(m1[-2])")
    print("\(m1[-3])")
    print("\(m1.Describe)")
} catch let MatrixOperationErrors.elementsCountMismatch(rows, columns, totalElements) {
    print("Matrix elements mismatch, \(rows * columns) != \(totalElements)")
}

var b: [Int] = [2, 4, 1, 10]
print("\(b.index(of: b.max()!)!)")
print("\(b.max()!)")
*/