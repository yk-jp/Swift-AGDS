//
//  WhosMyParent.swift
//  Swift-AGDS
//
//  Created by Yusuke K on 2022-07-30.
//

import Foundation


func whosMyParent(){
    let n = Int(readLine()!)!
    
    var tree = [Int](repeating: -1, count: n + 1)
    
    // store index of parent
    for idx in 1..<n {
        let line = readLine()!.split(separator: " ")
        let n1 = Int(line[0])!
        let n2 = Int(line[1])!
        
        if idx == 1 {
            tree[1] = 0
        }
        
        if tree[n1] != -1 {
            tree[n2] = n1
        } else {
            tree[n1] = n2
        }
    }
    
    print("array of tree " , tree)
    
    print("output")
    
    for idx in 2...n {
        print(tree[idx])
    }
}
