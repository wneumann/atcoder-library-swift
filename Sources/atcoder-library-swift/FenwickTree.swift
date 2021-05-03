//
//  FenwickTree.swift
//  
//
//  Created by sanjeev on 03/05/21.
//

struct FenwickTree {
	
	private var _n: Int
	private var _data: [Int]
	
	init() {
		self.init(0)
	}
	
	init(_ n: Int) {
		_n = n
		_data = Array(repeating: 0, count: n)
	}
	
	private func sum(_ t: Int) -> Int {
		var s = 0
		var r = t
		while (r > 0) {
			s += _data[r - 1]
			r -= r & -r
		}
		return s
	}
	
	public func sum(_ l: Int, _ r: Int) -> Int {
		return sum(r) - sum(l)
	}
	
	public mutating func add(_ t: Int, _ x: Int) {
		var p = t + 1
		while (p <= _n) {
			_data[p - 1] += x
			p += p & -p
		}
	}
	
}
