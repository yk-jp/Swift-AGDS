//
//  PartitionLabels.swift
//  Swift-AGDS
//
//  Created by Yusuke K on 2022-08-15.
//

import Foundation
//https://leetcode.com/submissions/detail/774947630/
func partitionLabels(_ s: String) -> [Int] {
    var lastIndexMap:[Character:Int] = [:]
    
    for i in 0..<s.count {
        let char = s[s.index(s.startIndex, offsetBy: i)]
        lastIndexMap[char] = i
    }
   
    var res:[Int] = []
    var start = 0
    var end = 0
    
    for i in 0..<s.count {
        var i = i
        let char = s[s.index(s.startIndex, offsetBy: i)]
        end = max(end, lastIndexMap[char]!)
        
        if end == i {
            res.append(end - start + 1)
            start = i + 1
            end = start
            i = start
        }
    }
    
    return res
}

