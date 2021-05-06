//
//  stringTests.swift
//  
//
//  Created by sanjeev on 06/05/21.
//

import XCTest
@testable import atcoder_library_swift

final class stringTests : XCTestCase {
	
	private func zAlgorithmNaive(_ s: String) -> [Int] {
		let n = s.count
		var z = Array(repeating: 0, count: n)
		for i in 0..<n {
			while (i + z[i] < n && s[z[i]] == s[i + z[i]]) {
				z[i] += 1
			}
		}
		return z
	}
	
	func testzAlgorithm() {
		let s = "abab"
		XCTAssertEqual(s.zAlgorithm(), zAlgorithmNaive(s))
		for n in 1...6 {
			var m = 1
			for _ in 0..<n {
				m *= 4
			}
			for f in 0..<m {
				var S = ""
				var g = f
				for _ in 0..<n {
					S += String(g % 4)
					g /= 4
				}
				XCTAssertEqual(S.zAlgorithm(), zAlgorithmNaive(S))
			}
		}
		for n in 1...10 {
			var m = 1
			for _ in 0..<n {
				m *= 2
			}
			for f in 0..<m {
				var S = ""
				var g = f
				for _ in 0..<n {
					S += String(g % 2)
					g /= 2
				}
				XCTAssertEqual(S.zAlgorithm(), zAlgorithmNaive(S))
			}
		}
	}
	
	static var allTests = [
		("testzAlgorithm", testzAlgorithm),
	]
	
}
