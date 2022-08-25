//
//  OneTwoThree.swift
//  Swift-AGDS
//
//  Created by Yusuke K on 2022-08-24.
//

import Foundation

func oneTwoThree(_ n: Int) -> Int {
    var d = [Int](repeating: 0, count: n + 1)
    d[1] = 1
    d[2] = 2
    d[3] = 4
    for i in 4...n {
       d[i] = d[i-1] + d[i-2] + d[i-3]
    }
    print(d)
    print(d[n])
    return d[n]
}
