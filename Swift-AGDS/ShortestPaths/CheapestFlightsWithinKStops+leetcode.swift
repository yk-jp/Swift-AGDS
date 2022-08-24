//
//  CheapestFlightsWithinKStops+leetcode.swift
//  Swift-AGDS
//
//  Created by Yusuke K on 2022-08-23.
//

import Foundation

func findCheapestPrice(_ n: Int, _ flights: [[Int]], _ src: Int, _ dst: Int, _ k: Int) -> Int {
        var adjList = [[(u: Int, w: Int)]](repeating: [(Int, Int)](), count: n)
    
        for edge in flights {
            adjList[edge[0]].append((edge[1],edge[2]))
        }
    
        var d = [Int](repeating: 100000, count: n)
        d[src] = 0
    
        var queue = Queue<(Int,Int)>()
        queue.enqueue(item:(src,-1))
        
        while queue.count != 0 {
            var (start, currStop) = queue.dequeue()!

            for edge in adjList[start] {
                let v = start
                let u = edge.u
                let w = edge.w

                if currStop >= k || (currStop == k-1 && u != dst)  {
                    continue
                }

                queue.enqueue(item:(u,currStop + 1))

                if d[v] + w < d[u] {
                   d[u] = d[v] + w
                }
         }
        }
                
        return d[dst] != 100000 ? d[dst] : -1
}

