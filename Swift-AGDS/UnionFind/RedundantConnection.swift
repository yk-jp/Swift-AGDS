//
//  RedundantConnection.swift
//  Swift-AGDS
//
//  Created by Yusuke K on 2022-08-17.
//

import Foundation

func findRedundantConnection(_ edges: [[Int]]) -> [Int] {
    var uf = UF(edges.count)
    
    var res:[Int] = []
    
    for edge in edges {
        let a = edge[0]
        let b = edge[1]
        
        if uf.find(a - 1) == uf.find(b - 1) {
            res = edge
        }
        
        uf.union(a - 1, b - 1)
    }
    
    print(uf)
    
    return res
}
