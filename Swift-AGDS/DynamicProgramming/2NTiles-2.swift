//
//  2NTiles-2.swift
//  Swift-AGDS
//
//  Created by Yusuke K on 2022-08-24.
//

import Foundation

func twoByNTiles2(_ n: Int) -> Int {
    var d = [Int](repeating: 0, count: n + 1)
    d[1] = 1
    d[2] = 3
    for i in 3...n {
        d[i] = Int(pow(Double(2), Double(i))) - d[i-1]
    }
    print(d)
    print(d[n])
    return d[n]
}
