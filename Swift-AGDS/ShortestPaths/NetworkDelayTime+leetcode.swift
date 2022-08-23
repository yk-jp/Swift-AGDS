//
//  TimeMachine.swift
//  Swift-AGDS
//
//  Created by Yusuke K on 2022-08-22.
//

import Foundation


func networkDelayTime(_ times: [[Int]], _ n: Int, _ k: Int) -> Int {
        var adjList = [[(v: Int, w: Int)]](repeating: [(Int, Int)](), count: n + 1)
    
        for edges in times {
         adjList[edges[0]].append((edges[1],edges[2]))
        }
        
        print(adjList)
        
        var d = [Int](repeating: Int.max, count : n + 1)
        var visited = [Bool](repeating: false, count : n + 1)
    
        d[k] = 0
    
        // repeat 1, 2, 3 until you visit all the vertices (n-1 times)
        for _ in 0..<n-1 {
              var minWeight = Int.max
              var minVertex = 1

              // look for the smallest edge of which vertex is not visited yet.
              for v in 1...n {
                if !visited[v] && d[v] < minWeight {
                  minWeight = d[v]
                  minVertex = v
                }
              }

              visited[minVertex] = true
              for edge in adjList[minVertex] {
                if d[edge.v] > d[minVertex] + edge.w {
                  d[edge.v] = d[minVertex] + edge.w
                }
              }
        }
        
        
        var max_time = 0
        
        for i in 1...d.count-1 {
            if d[i] == Int.max {
                return -1
            }
            
            max_time = max(d[i], max_time)
        }

        print(d)

        return max_time
}
