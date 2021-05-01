import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(atcoder_library_swiftTests.allTests),
    ]
}
#endif
