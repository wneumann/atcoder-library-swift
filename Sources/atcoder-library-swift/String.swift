//
//  String.swift
//  
//
//  Created by sanjeev on 06/05/21.
//

extension String {
	func zAlgorithm() -> [Int] {
    let chArr = Array(self)
    let n = chArr.count
    var z = Array(repeating: 0, count: n)

    var j = 0
    for i in 1..<n {
      z[i] = (j + z[j] <= i ? 0 : min(j + z[j] - i, z[i - j]))
      while (i + z[i] < n && chArr[z[i]] == chArr[i + z[i]]) {
        z[i] += 1
      }
      if (j + z[j] < i + z[i]) {
        j = i
      }
    }
    z[0] = n
    return z
	}
	
}
