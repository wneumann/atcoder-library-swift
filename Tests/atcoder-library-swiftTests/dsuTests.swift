//
//  dsuTests.swift
//  
//
//  Created by sanjeev on 02/05/21.
//

import XCTest
@testable import atcoder_library_swift

final class dsuTests : XCTestCase {
	
	func testEmpty() {
		var uf = DSU()
		XCTAssertEqual(uf.groups(), [])
	}
	
	func testSimple() {
		var uf = DSU(2)
		XCTAssertFalse(uf.same(0, 1))
		let x = uf.merge(0, 1)
		XCTAssertEqual(x, uf.leader(0))
		XCTAssertEqual(x, uf.leader(1))
		XCTAssertTrue(uf.same(0, 1))
		XCTAssertEqual(2, uf.size(0))
	}
	
	func testLine() {
		let n = 500000
		var uf = DSU(n)
		for i in stride(from: 0, to: n - 1, by: 1) {
			uf.merge(i, i + 1)
		}
		XCTAssertEqual(n, uf.size(0))
		XCTAssertEqual(1, uf.groups().count)
	}
	
	func testLineReverse() {
		let n = 500000
		var uf = DSU(n)
		for i in stride(from: n - 2, to: -1, by: -1) {
			uf.merge(i, i + 1)
		}
		XCTAssertEqual(n, uf.size(0))
		XCTAssertEqual(1, uf.groups().count)
	}
	
	static var allTests = [
		("testEmpty", testEmpty),
		("testSimple", testSimple),
		("testLine", testLine),
		("testLineReverse", testLineReverse)
	]
	
}
