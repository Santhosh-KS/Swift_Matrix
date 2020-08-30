#if !canImport(ObjectiveC)
import XCTest

public func __allTests() -> [XCTestCaseEntry] {
    return [
        //testCase(MatrixIntAndUintInitTests.__allTests__MatrixInitTests),
        //testCase(MatrixFloatAndDoubleInitTests.__allTests__MatrixInitTests),
        //testCase(MatrixIndexingOperations.__allTests__MatrixIndexTests),
        testCase(MatrixOperationsTests.__allTests__MatrixOperationsTests),
    ]
}
#endif
