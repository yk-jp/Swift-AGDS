//
//  RepeatingSequence.swift
//  Swift-AGDS
//
//  Created by Yusuke K on 2022-07-26.
//

import Foundation

func repeatingSequence() {
    let firstLine = readLine()!.split(separator: " ")
    
    
    var currNum = Int(firstLine[0])! //D[1]
    let p = Int(firstLine[1])! //power
    var visited:[Int:Int] = [currNum : 0] // key = sum, value = index
    
    var sequence: [Int] = [currNum] // just to keep track of sequence
    
    func outputSum (_ num: Int) -> Int {
        var num = num
        var sum = 0
        while num > 0 {
            let digit = num%10
            sum += Int(pow(Double(digit), Double(p)))
            num /= 10
        }
        return sum
    }
    
    while true {
        currNum = outputSum(currNum)
        
        if let idx = visited[currNum] {
            print(idx)
            break
        }
        
        sequence.append(currNum)
        visited[currNum] = visited.count
    }
    print("result of the sequence ",sequence)
}
