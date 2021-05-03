//
//  dsu.swift
//  
//
//  Created by sanjeev on 02/05/21.
//

/// Disjoint Set Union Data Structure
/// 	- Union by size
/// 	- Path compression
struct dsu {
	
	private var _n: Int
	private var _parent: [Int]
	
	init() {
		self.init(0)
	}
	
	init(_ n: Int) {
		_n = n
		_parent = Array(repeating: -1, count: n)
	}
	
	public mutating func leader(_ a: Int) -> Int {
		if (_parent[a] < 0) {
			return a
		} else {
			_parent[a] = leader(_parent[a])
			return _parent[a]
		}
	}
	
	public mutating func same(_ a: Int, _ b: Int) -> Bool {
		return leader(a) == leader(b)
	}
	
	public mutating func size(_ a: Int) -> Int {
		return -1 * _parent[leader(a)]
	}
	
	@discardableResult public mutating func merge(_ a: Int, _ b: Int) -> Int {
		var x = leader(a)
		var y = leader(b)
		if (x == y) {
			return x
		} else if (-1 * _parent[x] < -1 * _parent[y]) {
			swap(&x, &y)
		}
		_parent[x] += _parent[y]
		_parent[y] = x
		return x
	}
	
	public mutating func groups() -> [[Int]] {
		var leaderBuffer = Array<Int>(repeating: 0, count: _n)
		var groupSize = Array<Int>(repeating: 0, count: _n)
		for i in 0..<_n {
			leaderBuffer[i] = leader(i)
			groupSize[leaderBuffer[i]] += 1
		}
		var result = Array<Array<Int>>(repeating: [], count: _n)
		for i in 0..<_n {
			result[i].reserveCapacity(groupSize[i])
		}
		for i in 0..<_n {
			result[leaderBuffer[i]].append(i)
		}
		result.removeAll { v in return v.isEmpty }
		return result
	}
	
}
