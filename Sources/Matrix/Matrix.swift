import Foundation

protocol MatrixContainer {
    associatedtype Element
    init(_ rows:UInt, _ columns:UInt, with defaultVal:Element)
    subscript(rowId:Int) -> [Element] { get }
    subscript(rowId:Int, colId:Int) -> Element { get }
}

public struct Matrix<Element: Numeric & Comparable > : MatrixContainer {
    var mat: Array<Array<Element>>
    var rows: UInt
    var columns: UInt
    var size: UInt { return rows*columns}
    var shape: (rows: UInt, columns: UInt) { return (rows, columns) }

    public init(_ rows:UInt, _ columns:UInt, with defaultVal:Element) {
        self.rows = rows
        self.columns = columns
        self.mat = Array.init(repeating: Array.init(repeating: defaultVal, count: Int(columns)), count: Int(rows))
    }

    public subscript(id: Int) -> [Element] {
        if id < 0 || id >= self.rows {
            return self.mat[Int(self.rows) - 1]

        } else {
            return self.mat[id]
        }
    }

    public subscript(idRow: Int, idCol:Int) -> Element {
        let interestedRow: [Element] = self[idRow]
        if idCol < 0 || idCol >= self.columns {
           return interestedRow[Int(self.columns) - 1]
        } else {
           return interestedRow[idCol]
        }
    }
}

extension Matrix where Element == Double {
    public init(_ rows:UInt, _ columns:UInt) {
        self.init(rows, columns, with: 0.0)
    }
}

extension Matrix where Element == Float {
    public init(_ rows:UInt, _ columns:UInt) {
        self.init(rows, columns, with: 0.0)
    }
}

extension Matrix where Element == Int {
    public init(_ rows:UInt, _ columns:UInt) {
        self.init(rows, columns, with: 0)
    }
}

extension Matrix where Element == UInt {
    public init(_ rows:UInt, _ columns:UInt) {
        self.init(rows, columns, with: 0)
    }
}

extension Matrix {
    public init(_ arryOfArray:[[Element]]) {
        guard arryOfArray.count > 0 else {
            self.rows = 0
            self.columns = 0
            self.mat = [[Element]]()
            precondition(self.rows == 0, "Matrix is not initialized.")
            return
        }

        let colCount = arryOfArray[0].count
        guard colCount > 0 else {
            self.rows = 0
            self.columns = 0
            self.mat = [[Element]]()
            precondition(self.rows == 0, "Matrix is not initialized.")
            return
        }

        for rows in arryOfArray {
            guard rows.count == colCount else {
                self.rows = 0
                self.columns = 0
                self.mat = [[Element]]()
                precondition(self.rows == 0, "Matrix is not initialized.")
                return
            }
        }
        self.mat = arryOfArray
        self.rows = UInt(arryOfArray.count)
        self.columns = UInt(colCount)
    }

    public init(_ array:[Element], _ row: UInt, _ col: UInt) {
        guard array.count == row * col else {
            print("Elements count mismatch \(array.count) != \(row) * \(col)")
            self.rows = 0
            self.columns = 0
            self.mat = [[Element]]()
            precondition(self.rows == 0, "Matrix is not initialized.")
            return
        }
        self.rows = row
        self.columns = col
        self.mat = array.reduceTo2d(row, col)
    }

    public init(_ array:[Element], withRows rows:UInt) {
        let columns: UInt = UInt(array.count) % rows
        self.init(array, rows, columns)
    }

    public init(_ array:[Element], withColumns columns:UInt) {
        let rows: UInt = UInt(array.count) % columns
        self.init(array, rows, columns)
    }
}

extension Array  where Element : Numeric & Comparable {
    internal func reduceTo2d(_ row: UInt, _ col: UInt) -> [[Element]] {
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

    internal func reduceTo2d(withRows row:UInt) -> [[Element]] {
        let col:UInt = UInt(self.count)/row
        return reduceTo2d(row, col)
    }

    internal func reduceTo2d(withColumns col:UInt) -> [[Element]] {
        let row:UInt = UInt(self.count)/col
        return reduceTo2d(row, col)
    }
}