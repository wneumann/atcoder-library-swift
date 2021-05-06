//
//  String.swift
//  
//
//  Created by sanjeev on 06/05/21.
//

extension String {
	
	subscript(i: Int) -> String {
		return String(self[index(startIndex, offsetBy: i)])
	}
	
	func zAlgorithm() -> [Int] {
		let n = self.count
		if (n == 0) {
			return []
		}
		var z = Array(repeating: 0, count: n)
		z[0] = 0
		var i = 1, j = 0
		while (i < n) {
			z[i] = (j + z[j] <= i ? 0 : min(j + z[j] - i, z[i - j]))
			while (i + z[i] < n && self[z[i]] == self[i + z[i]]) {
				z[i] += 1
			}
			if (j + z[j] < i + z[i]) {
				j = i
			}
			i += 1
		}
		z[0] = n
		return z
	}
	
}
