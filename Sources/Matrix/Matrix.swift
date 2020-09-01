import Foundation

protocol MatrixContainer {
    associatedtype Element
    init(rows row:Int, columns column:Int, with defaultVal:Element)
    subscript(rowId:Int) -> [Element] { get }
    subscript(rowId:Int, colId:Int) -> Element { get }
}

public struct Matrix<Element: Numeric & Comparable > : MatrixContainer {
    var mat: Array<Array<Element>>
    var rows: Int
    var columns: Int
    var size: Int { return rows*columns}
    var shape: (rows: Int, columns: Int) { return (rows, columns) }

    public init(rows r:Int, columns c:Int, with defaultVal:Element) {
        self.rows = r
        self.columns = c
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
           return interestedRow[self.columns - 1]
        } else {
           return interestedRow[idCol]
        }
    }
}

extension Matrix {
    public init(_ r:Int, _ c:Int) {
        self.init(rows: r, columns: c, with: .zero)
    }

    public init(_ r:Int, _ c:Int, with defaultVal:Element) {
        self.init(rows: r, columns: c, with: defaultVal)
    }

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
        self.rows = arryOfArray.count
        self.columns = colCount
    }

    public init(_ array:[Element], _ row: Int, _ col: Int) {
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

    public init(_ array:[Element], withRows rows:Int) {
        let columns: Int = array.count % rows
        self.init(array, rows, columns)
    }

    public init(_ array:[Element], withColumns columns:Int) {
        let rows: Int = array.count % columns
        self.init(array, rows, columns)
    }
}

extension Array  where Element : Numeric & Comparable {
    internal func reduceTo2d(_ row: Int, _ col: Int) -> [[Element]] {
        guard self.count == row*col else {
            print("Elements count does not match \(self.count) != \(row*col)")
            return [[Element]]()
        }
        var retArray = [[Element]]()
        var tmpArray = [Element]()
        for (index, item) in self.enumerated()  {
            tmpArray.append(item)
            if ((index+1) % col == 0) {
                retArray.append(tmpArray)
                tmpArray.removeAll()
            }
        }
        return retArray
    }

    internal func reduceTo2d(withRows row:Int) -> [[Element]] {
        let col:Int = self.count/row
        return reduceTo2d(row, col)
    }

    internal func reduceTo2d(withColumns col:Int) -> [[Element]] {
        let row:Int = self.count/col
        return reduceTo2d(row, col)
    }
}