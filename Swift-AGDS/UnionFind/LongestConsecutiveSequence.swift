////
////  LongestConsecutiveSequence.swift
////  Swift-AGDS
////
////  Created by Yusuke K on 2022-08-17.
////
//
//import Foundation
//
//func longestConsecutive(_ nums: [Int]) -> Int {
//    if nums.count <= 0 {
//        return 0
//    }
//    
//    var nums = nums
//    var uf = UF(nums.count)
//    var numMap: [Int: Int] = [:]
//    
//    for (i, num) in nums.enumerated() {
//        numMap[num] = i
//    }
//    
//    print(numMap)
//    
//    for (key, val) in numMap {
//        if numMap[key - 1] != nil && uf.find(numMap[key]!) != uf.find(numMap[key - 1]!) {
//            uf.union(numMap[key]!, numMap[key - 1]!)
//        }
//        
//        if numMap[key + 1] != nil && uf.find(numMap[key]!) != uf.find(numMap[key + 1]!) {
//            uf.union(numMap[key]!, numMap[key + 1]!)
//        }
//    }
//    
//    var parentArr = uf.getParent()
//    var countArr = [Int](repeating: 0, count : nums.count)
//    
//    for parent in parentArr {
//        countArr[uf.find(parent)] += 1
//    }
//    
//    print(uf)
//    return countArr.max()!
//}
