//
//  TwoCityScheduling.swift
//  Swift-AGDS
//
//  Created by Yusuke K on 2022-08-12.
//

import Foundation

//https://leetcode.com/submissions/detail/772345032/

func twoCitySchedCost(_ costs: [[Int]]) -> Int {
    var diffArr :[[Int]] = [] // [idx, diff ]
    
    for (idx, cost) in costs.enumerated() {
        let costA:Int = cost[0]
        let costB:Int = cost[1]
        
        diffArr.append([idx, costA - costB])
    }
    
    
    diffArr = diffArr.sorted(by:{ $0[1] < $1[1] })
    
    var sum = 0
    
    for (idx, val) in diffArr.enumerated() {
        let accessAt = val[0]
        if idx < diffArr.count/2 {
            sum += costs[accessAt][0]
            continue
        }
        
        sum += costs[accessAt][1]
    }
    
    return sum
}
