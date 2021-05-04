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
	* fast primality testing for integers of size upto 64 bytes
	*/
	public func isPrime(_ n: Int64) -> Bool {
		if (n <= 1) {
			return false
		}
		if (n == 2 || n == 7 || n == 61) {
			return true
		}
		if (n % 2 == 0) {
			return false
		}
		var d = n - 1
		while (d % 2 == 0) {
			d /= 2
		}
		let bases: [Int64] = [2, 7, 61]
		var prime = true
		bases.forEach { a in
			var t = d
			var y = modPow(x: a, y: t, m: n)
			while (t != n - 1 && y != 1 && y != n - 1) {
				y = (y * y) % n
				t <<= 1
			}
			if (y != n - 1 && t % 2 == 0) {
				prime = false
			}
		}
		return prime
	}
	
	/**
	* returns pair(g, z) such that g = gcd(x, y), zx = g (mod y), 0 <= z < y / g
	*/
	public func inverseGcd(_ x: Int64, _ y: Int64) -> (Int64, Int64) {
		var a = x
		let b = y
		a = safeMod(a, b)
		if (a == 0) {
			return (b, 0)
		}
		var s = b
		var t = a
		var m0: Int64 = 0
		var m1: Int64 = 1
		while (t > 0) {
			let u: Int64 = s / t
			s -= t * u
			m0 -= m1 * u
			var temp = s
			s = t
			t = temp
			temp = m0
			m0 = m1
			m1 = temp
		}
		if (m0 < 0) {
			m0 += b / s
		}
		return (s, m0)
	}
	
	/**
	* calculates a % m safely even for -ve 'a'
	* using formula a % m = (a + m) % m
	*/
	public func safeMod(_ a: Int64, _ m: Int64) -> Int64 {
		if (a < 0) {
			return (a + m) % m
		} else {
			return a % m
		}
	}
	
}
