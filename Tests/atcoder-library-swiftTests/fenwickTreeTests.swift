//
//  fenwickTreeTests.swift
//  
//
//  Created by sanjeev on 03/05/21.
//

import XCTest
@testable import atcoder_library_swift

final class fenwickTreeTests : XCTestCase {
	
	func testEmpty() {
		let fwt = FenwickTree()
		XCTAssertEqual(0, fwt.sum(0, 0))
	}
	
	func testNaive() {
		for n in stride(from: 0, to: 51, by: 1) {
			var fwt = FenwickTree(n)
			for i in stride(from: 0, to: n, by: 1) {
				fwt.add(i, i * i)
			}
			for l in stride(from: 0, to: n + 1, by: 1) {
				for r in stride(from: l, to: n + 1, by: 1) {
					var sum = 0
					for i in stride(from: l, to: r, by: 1) {
						sum += i * i
					}
					XCTAssertEqual(sum, fwt.sum(l, r))
				}
			}
		}
	}
	
	func testBounds() {
		var fwt = FenwickTree(10)
		fwt.add(3, Int.max)
		fwt.add(5, Int.min)
		XCTAssertEqual(-1, fwt.sum(0, 10))
		XCTAssertEqual(-1, fwt.sum(3, 6))
		XCTAssertEqual(Int.max, fwt.sum(3, 4))
		XCTAssertEqual(Int.min, fwt.sum(4, 10))
	}
	
	static var allTests = [
		("testEmpty", testEmpty),
		("testNaive", testNaive),
		("testBounds", testBounds),
	]
	
}
