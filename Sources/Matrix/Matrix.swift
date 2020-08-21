import Foundation

extension Array  where Element : BinaryInteger {
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

//struct Matrix<T>  where T : Numeric {
struct Matrix<T>  where T : BinaryInteger {
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
            return
        }

        let colCount = arryOfArray[0].count
        for rows in arryOfArray {
            guard rows.count == colCount else {
                self.rows = 0
                self.columns = 0
                self.Mat = [[T]]()
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
            return
        }
        self.rows = row
        self.columns = col
        self.Mat = array.reduceTo2d(row, col)
    }
}

extension  Matrix : Equatable {
    static func == (_ lhs:Matrix, _ rhs:Matrix) -> Bool {
        guard (lhs.rows == rhs.rows) && (lhs.columns == rhs.columns) else {
            return false
        }
        return lhs.Mat.flatMap { $0 } == rhs.Mat.flatMap { $0 }
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

extension Matrix {
    func average() -> Double {
        let flat = self.Mat.flatMap {$0}
        return Double(flat.reduce(0, +))/Double(flat.count)
    }
}

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

let A: Matrix<Int> = Matrix(3,4)
let B: Matrix<Int> = Matrix(3,4,5)
let C: Matrix<UInt> = Matrix(withRows: 3, withColumns: 4, withDefalutValue: 5)
let D: Matrix<UInt> = Matrix(withRows: 3, withColumns: 4, withDefalutValue: 5)

print(A)
print(A.shape)
print(A.size)
print(A==B)
print(D==C)

let m = Array.init(repeating: Array.init(repeating: 5, count: 3), count: Int(3))
print(m)
print(m[0].count)
print(m.count)

print(A.max())
print(B.max())
print(C.max())
print(D.max())
let v = Matrix([[-1,-3,-5], [-2,-100,-3]])
print(v.max())
print(v.min())
print(v[-1])
print(v[-1,-1])

print(v.average())
print(v.isSquare())

let t = Matrix([Int](1...8),2,4)
let t1 = Matrix([Int](1...8),2,4)
print(t)
print(t1)

//print(t.add(4))

print("Matrix add \(t.+t1)")
print("Matrix sub \(t.-t1)")