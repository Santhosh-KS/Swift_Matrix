import Foundation

extension Array  where Element : Numeric & Comparable {
    func reduceTo2d(_ row: UInt, _ col: UInt) -> [[Element]] {
        guard self.count == row*col else {
            print("Elements count does not match \(self.count) != \(row*col)")
            return [[Element]]()
        }
        var retArray = [[Element]]()
        var tmpArray = [Element]()
        for (index, item) in self.enumerated()  {
            tmpArray.append(item)
            if ((index+1) % Int(col) == 0) {
                retArray.append(tmpArray)
                tmpArray.removeAll()
            }
        }
        return retArray
    }
}

struct Matrix<T: Numeric & Comparable > {
    //private var Mat: Array<Array<T>>
    private var Mat: [[T]]
    let rows: UInt
    let columns: UInt
}

extension  Matrix {
    var size: UInt { return rows*columns }
    var shape: (UInt, UInt) { return (rows, columns)}

    init(withRows rows:UInt, withColumns columns:UInt, withDefalutValue val: T = 0) {
        self.init(rows,columns,val)
    }

    init(_ rows:UInt , _ columns:UInt, _ val:T = 0) {
        self.rows = rows
        self.columns = columns
        self.Mat = Array.init(repeating: Array.init(repeating: val, count: Int(columns)), count: Int(rows))
    }

    init(_ arryOfArray:[[T]]) {
        guard arryOfArray.count > 0 else {
            self.rows = 0
            self.columns = 0
            self.Mat = [[T]]()
            precondition(self.rows == 0, "Matrix is not initialized.")
            return
        }

        let colCount = arryOfArray[0].count
        for rows in arryOfArray {
            guard rows.count == colCount else {
                self.rows = 0
                self.columns = 0
                self.Mat = [[T]]()
                precondition(self.rows == 0, "Matrix is not initialized.")
                return
            }
        }
        self.Mat = arryOfArray
        self.rows = UInt(arryOfArray.count)
        self.columns = UInt(colCount)
    }

    init(_ array:[T], _ row: UInt, _ col: UInt) {
        guard array.count == row * col else {
            print("Elements count mismatch \(array.count) != \(row) * \(col)")
            self.rows = 0
            self.columns = 0
            self.Mat = [[T]]()
            precondition(self.rows == 0, "Matrix is not initialized.")
            return
        }
        self.rows = row
        self.columns = col
        self.Mat = array.reduceTo2d(row, col)
    }

    init(_ array:[T], withRows rows:UInt) {
        let columns: UInt = UInt(array.count) % rows
        self.init(array, rows, columns)
    }

    init(_ array:[T], withColumns columns:UInt) {
        let rows: UInt = UInt(array.count) % columns
        self.init(array, rows, columns)
    }
}

extension  Matrix {
    static func == (_ lhs:Matrix, _ rhs:Matrix) -> Bool {
        guard (lhs.rows == rhs.rows) && (lhs.columns == rhs.columns) else {
            return false
        }
        return lhs.Mat.flatMap { $0 } == rhs.Mat.flatMap { $0 }
    }

    static func > (_ lhs:Matrix, _ rhs:Matrix) -> Bool {
        guard (lhs.rows == rhs.rows) && (lhs.columns == rhs.columns) else {
            return false
        }
        let lhsFlat = lhs.Mat.flatMap { $0 }
        let rhsFlat = rhs.Mat.flatMap { $0 }

        for idx in 0 ..< lhsFlat.count {
            guard lhsFlat[idx] > rhsFlat[idx] else {
                return false
            }
        }
        return true
    }

    static func < (_ lhs:Matrix, _ rhs:Matrix) -> Bool {
        guard (lhs.rows == rhs.rows) && (lhs.columns == rhs.columns) else {
            return false
        }
        //let lhsFlatMap = Array(lhs.Mat.joined())
        //let rhsFlatMap = Array(rhs.Mat.joined())
        let lhsFlat = lhs.Mat.flatMap { $0 }
        let rhsFlat = rhs.Mat.flatMap { $0 }

        for idx in 0 ..< lhsFlat.count {
            guard lhsFlat[idx] < rhsFlat[idx] else {
                return false
            }
        }
        return true
    }
}

extension Matrix {
    func max() -> T {
        let flat = self.Mat.flatMap {$0}
        return flat.max() ?? 0
    }

    func min() -> T {
        let flat = self.Mat.flatMap {$0}
        return flat.min() ?? 0
    }
}

/*
extension Matrix {
    func average() -> Double {
        let flat = self.Mat.flatMap {$0}
        return Double(flat.reduce(0, +))/Double(flat.count)
    }
}
*/

extension Matrix {
    func isSquare() -> Bool {
        return self.rows == self.columns
    }
}

extension Matrix {
    // If the index is out of bounds, just return the last row.
    subscript(id: Int) -> [T] {
        if id < 0 || id >= self.rows {
            return self.Mat[Int(self.rows) - 1]

        } else {
            return self.Mat[id]
        }
    }

    // If the index is out of bounds, just return the last row last column element.
    subscript(idRow: Int, idCol:Int) -> T {
        let interestedRow: [T] = self[idRow]
        if idCol < 0 || idCol >= self.columns {
           return interestedRow[Int(self.columns) - 1]
        } else {
           return interestedRow[idCol]
        }
    }
}

// Adds a number to each element of the Matrix.
extension Matrix {
    func add(_ number:T) -> [[T]] {
        let flat = self.Mat.flatMap { $0}
        let addedMat = flat.map { $0 + number}
        return addedMat.reduceTo2d(self.rows, self.columns)
    }

    func sub(_ number:T) -> [[T]] {
        return add(number)
    }
}


precedencegroup MatrixOperationPrecedence {
    associativity: left
}

infix operator .+ : MatrixOperationPrecedence
infix operator .- : MatrixOperationPrecedence

// TODO: Optimize this piece of code .+ and .- has almost similar code.
// Need to come up with a logic to make it one function
extension Matrix {
    static func .+(_ lhs: Matrix, _ rhs: Matrix) -> [[T]] {
        guard (lhs.rows == rhs.rows) && (lhs.columns == rhs.columns)  else {
            print("Matrix dimentions doesn't match \(lhs.shape) != \(rhs.shape)\n")
            return [[T]]()
        }
        let flatLhs = lhs.Mat.flatMap {$0}
        let flatRhs = rhs.Mat.flatMap {$0}
        var result = [T]()
        for (index, item) in flatLhs.enumerated() {
            result.append(item + flatRhs[index])
        }
        return result.reduceTo2d(rhs.rows, rhs.columns)
    }

    static func .-(_ lhs: Matrix, _ rhs: Matrix) -> [[T]] {
        guard (lhs.rows == rhs.rows) && (lhs.columns == rhs.columns)  else {
            print("Matrix dimentions doesn't match \(lhs.shape) != \(rhs.shape)\n")
            return [[T]]()
        }
        let flatLhs = lhs.Mat.flatMap {$0}
        let flatRhs = rhs.Mat.flatMap {$0}
        var result = [T]()
        for (index, item) in flatLhs.enumerated() {
            result.append(item - flatRhs[index])
        }
        return result.reduceTo2d(rhs.rows, rhs.columns)
    }
}