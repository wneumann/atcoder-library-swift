//
//  Math.swift
//  
//
//  Created by sanjeev on 04/05/21.
//

struct Math {
	
	/**
	* calculates (x ^ y) % m using fast exponentiation
	*/
	public func modPow(x: Int64, y: Int64, m: Int64) -> Int64 {
		if (m == 1) {
			return 0
		}
		if (y == 0) {
			return 1
		}
		var result: Int64 = 1
		var a = safeMod(x, m)
		var b = y
		while (b > 0) {
			if ((b & 1) == 1) {
				result = (result * a) % m
			}
			a = (a * a) % m
			b >>= 1
		}
		return result
	}
	
	/**
	* calculates inverse mod for x i.e. (1 / x) % m
	* using formula (1 / x) % m = (x ^ (m - 2)) % m
	*/
	public func inverseMod(x: Int64, m: Int64) -> Int64 {
		return modPow(x: x, y: m - 2, m: m)
	}
	
	/**
	* calculates a % m safely even for -ve 'a'
	* using formula a % m = (a + m) % m
	*/
	private func safeMod(_ a: Int64, _ m: Int64) -> Int64 {
		if (a < 0) {
			return (a + m) % m
		} else {
			return a % m
		}
	}
	
}
