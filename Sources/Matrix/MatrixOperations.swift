precedencegroup MatrixOperationPrecedence {
    associativity: left
}

infix operator .+ : MatrixOperationPrecedence
infix operator .- : MatrixOperationPrecedence

/*
infix operator == : MatrixOperationPrecedence
func ==<T: Numeric, D: Numeric>(lhs:Matrix<T>, _ rhs:Matrix<D>) -> Bool {
    let tType = type(of: T)
    let dType = type(of: D)
    guard tType == dType else {
        return false
    }
    return lhs == rhs
}
*/

extension  Matrix {
    static func == (_ lhs:Matrix<Element>, _ rhs:Matrix<Element>) -> Bool {
        guard (lhs.rows == rhs.rows) && (lhs.columns == rhs.columns) else {
            return false
        }
        return lhs.mat.flatMap { $0 } == rhs.mat.flatMap { $0 }
    }

    static func >= (_ lhs:Matrix, _ rhs:Matrix) -> Bool {
        guard (lhs == rhs) else {
            return lhs > rhs
        }
        return true
    }

    static func <= (_ lhs:Matrix, _ rhs:Matrix) -> Bool {
        guard (lhs == rhs) else {
            return lhs < rhs
        }
        return true
    }

    static func > (_ lhs:Matrix, _ rhs:Matrix) -> Bool {
        guard (lhs.size == rhs.size) else {
            return lhs.size > rhs.size
        }
        let lhsFlat = lhs.mat.flatMap { $0 }
        let rhsFlat = rhs.mat.flatMap { $0 }

        for idx in 0 ..< lhsFlat.count {
            guard lhsFlat[idx] > rhsFlat[idx] else {
                return false
            }
        }
        return true
    }

    static func < (_ lhs:Matrix, _ rhs:Matrix) -> Bool {
        guard (lhs.size == rhs.size) else {
            return lhs.size < rhs.size
        }
        //let lhsFlatMap = Array(lhs.Mat.joined())
        //let rhsFlatMap = Array(rhs.Mat.joined())
        let lhsFlat = lhs.mat.flatMap { $0 }
        let rhsFlat = rhs.mat.flatMap { $0 }

        for idx in 0 ..< lhsFlat.count {
            guard lhsFlat[idx] < rhsFlat[idx] else {
                return false
            }
        }
        return true
    }
}

/*
// TODO: Optimize this piece of code .+ and .- has almost similar code.
// Need to come up with a logic to make it as one function
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
*/