//
//  BackTracking.swift
//  Swift-AGDS
//
//  Created by Yusuke K on 2022-07-13.
//

import Foundation


func rollDiceSum(_ n: Int, _ sum: Int) {
    var choices = [Int]()
    rollDiceSumHelper(n, sum, choices: &choices)
}


func rollDiceSumHelper(_ n: Int, _ sum: Int, choices: inout [Int]){
    if n == 0 {
        if choices.reduce(0, +) == sum {
            print(choices)
        }
    } else {
        for i in 1...6 {
            choices.append(i)
            rollDiceSumHelper(n-1,sum, choices: &choices)
            choices.removeLast()
        }
    }
}
