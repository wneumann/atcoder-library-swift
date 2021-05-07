//
//  stringTests.swift
//  
//
//  Created by sanjeev on 06/05/21.
//

import XCTest
import Foundation

@testable import atcoder_library_swift

final class stringTests : XCTestCase {
	
	private func zAlgorithmNaive(_ s: String) -> [Int] {
    var slice = s[...]
    var z: [Int] = []
    while !slice.isEmpty {
      z.append(s.commonPrefix(with: slice).count)
      slice = slice.dropFirst()
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
