//
//  Cyclic Permutation.swift
//  Swift-AGDS
//
//  Created by Yusuke K on 2022-07-26.
//

import Foundation

func cyclicPermutation() {
    let testCase = Int(readLine()!)!
    var caseNum = 0
    
    while caseNum < testCase {
        
        let n = Int(readLine()!)!
        
        let permutation = readLine()!.split(separator: " ")
        
        // adjacency list
        var adjList = [[Int]](repeating: [], count: n + 1)
        
        for i in 0..<n {
            let u = i + 1
            let v = Int(permutation[u-1])!
            adjList[u].append(v)
        }
        print("adjacency list ", adjList)
        
        func dfs(start: Int, adjList: inout [[Int]], visited: inout [Bool]) {
            visited[start] = true
            for v in adjList[start] {
                if !visited[v] {
                    dfs(start: v, adjList: &adjList, visited: &visited)
                }
            }
        }
        
        var count = 0
        var visited = [Bool](repeating: false, count: n + 1)
        
        for v in 1..<n {
            if !visited[v] {
                dfs(start: v, adjList: &adjList, visited: &visited)
                count+=1
            }
        }
        print(count)
        
        caseNum+=1
    }
}

