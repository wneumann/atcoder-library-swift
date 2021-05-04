//
//  mathTests.swift
//  
//
//  Created by sanjeev on 04/05/21.
//

import XCTest
@testable import atcoder_library_swift

final class mathTests : XCTestCase {
	
	func testIsPrime() {
		let math = Math()
		XCTAssertFalse(math.isPrime(121))
		XCTAssertFalse(math.isPrime(11 * 13))
		XCTAssertTrue(math.isPrime(1000000007))
		XCTAssertFalse(math.isPrime(1000000008))
		XCTAssertTrue(math.isPrime(1000000009))
		for i in stride(from: 0, to: 10001, by: 1) {
			XCTAssertEqual(isPrimeNaive(Int64(i)), math.isPrime(Int64(i)))
		}
	}
	
	func testModPow() {
		let math = Math()
		for a in stride(from: -100, to: 101, by: 1) {
			for b in stride(from: 0, to: 101, by: 1) {
				for c in stride(from: 1, to: 100, by: 1) {
					XCTAssertEqual(math.modPow(x: Int64(a), y: Int64(b), m: Int64(c)), modPowNaive(Int64(a), Int64(b), Int64(c)))
				}
			}
		}
	}
	
	private func modPowNaive(_ x: Int64, _ n: Int64, _ mod: Int64) -> Int64 {
		let math = Math()
		let y = math.safeMod(x, mod)
		var z = Int64(1) % mod
		for _ in stride(from: 0, to: n, by: 1) {
			z = (z * y) % mod
		}
		return z
	}
	
	private func isPrimeNaive(_ x: Int64) -> Bool {
		if (x < 2) {
			return false
		}
		for i in stride(from: 2, to: x, by: 1) {
			if (x % i == 0) {
				return false
			}
		}
		return true
	}
	
	static var allTests = [
		("testIsPrime", testIsPrime),
		("testModPow", testModPow),
	]
	
}
