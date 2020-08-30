import Foundation

protocol MatrixContainer {
    associatedtype Element
    init(_ rows:UInt, _ columns:UInt, with defaultVal:Element)
    subscript(rowId:Int) -> [Element] { get }
    subscript(rowId:Int, colId:Int) -> Element { get }
}

struct Matrix<Element: Numeric & Comparable > : MatrixContainer {
    internal var mat: Array<Array<Element>>
    var rows: UInt = 0
    var columns: UInt = 0
    var size: UInt { return rows*columns}
    var shape: (rows: UInt, columns: UInt) { return (rows, columns) }

    init(_ rows:UInt, _ columns:UInt, with defaultVal:Element) {
        self.rows = rows
        self.columns = columns
        self.mat = Array.init(repeating: Array.init(repeating: defaultVal, count: Int(columns)), count: Int(rows))
    }

    subscript(id: Int) -> [Element] {
        if id < 0 || id >= self.rows {
            return self.mat[Int(self.rows) - 1]

        } else {
            return self.mat[id]
        }
    }

    subscript(idRow: Int, idCol:Int) -> Element {
        let interestedRow: [Element] = self[idRow]
        if idCol < 0 || idCol >= self.columns {
           return interestedRow[Int(self.columns) - 1]
        } else {
           return interestedRow[idCol]
        }
    }
}

extension Matrix where Element == Double {
    init(_ rows:UInt, _ columns:UInt) {
        self.init(rows, columns, with: 0.0)
    }
}

extension Matrix where Element == Float {
    init(_ rows:UInt, _ columns:UInt) {
        self.init(rows, columns, with: 0.0)
    }
}

extension Matrix where Element == Int {
    init(_ rows:UInt, _ columns:UInt) {
        self.init(rows, columns, with: 0)
    }
}

extension Matrix where Element == UInt {
    init(_ rows:UInt, _ columns:UInt) {
        self.init(rows, columns, with: 0)
    }
}

extension Matrix {
    init(_ arryOfArray:[[Element]]) {
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

    init(_ array:[Element], _ row: UInt, _ col: UInt) {
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

    init(_ array:[Element], withRows rows:UInt) {
        let columns: UInt = UInt(array.count) % rows
        self.init(array, rows, columns)
    }

    init(_ array:[Element], withColumns columns:UInt) {
        let rows: UInt = UInt(array.count) % columns
        self.init(array, rows, columns)
    }
}

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

    func reduceTo2d(withRows row:UInt) -> [[Element]] {
        let col:UInt = UInt(self.count)/row
        return reduceTo2d(row, col)
    }

    func reduceTo2d(withColumns col:UInt) -> [[Element]] {
        let row:UInt = UInt(self.count)/col
        return reduceTo2d(row, col)
    }
}