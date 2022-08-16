//
//  GasStation.swift
//  Swift-AGDS
//
//  Created by Yusuke K on 2022-08-15.
//

import Foundation


func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
    if gas.reduce(0,+) - cost.reduce(0, +) < 0 {
        return -1
    }
    
    var total = 0
    var res = 0
    
    for i in 0..<gas.count {
        total += (gas[i] - cost[i])
        
        if total < 0 {
            total = 0
            res = i + 1
        }
    }
    
    return res
}

// brute force
func bruteForceCanCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
    var tank = 0

    for i in 0..<gas.count {
        if gas[i] - cost[i] < 0 { continue }
        tank = gas[i] - cost[i]
        var idx = i + 1

        while idx != i {
            if idx >= gas.count { idx = 0 }
            tank += gas[idx]
            if tank < cost[idx] { break }
            tank -= cost[idx]

            if (idx == i - 1 || (i == 0 && idx == gas.count - 1) ) && tank >= 0 {
                return i
            }

            idx += 1
        }
    }

    return -1
}
