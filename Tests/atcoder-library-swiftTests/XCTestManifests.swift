import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(atcoder_library_swiftTests.allTests),
		testCase(dsuTests.allTests),
		testCase(fenwickTreeTests.allTests),
		testCase(mathTests.allTests),
		testCase(stringTests.allTests),
    ]
}
#endif
