//
//  PathWithMaximumProbability+leetcode.swift
//  Swift-AGDS
//
//  Created by Yusuke K on 2022-08-23.
//

import Foundation

func maxProbability(_ n: Int, _ edges: [[Int]], _ succProb: [Double], _ start: Int, _ end: Int) -> Double {
        var adjList = [[(v: Int, w: Double)]](repeating: [(Int, Double)](), count: n)
    
        for i in 0..<edges.count {
            adjList[edges[i][0]].append((edges[i][1], -succProb[i]))
            adjList[edges[i][1]].append((edges[i][0], -succProb[i]))
        }

        // print(adjList)
        
        var d = [Double](repeating: 0, count : n)
        var visited = [Bool](repeating: false, count : n)
        var q = IndexPriorityQueue<Edge>(<)
           
        d[start] = -1
           
        for edge in adjList[start] {
           q.enqueue(Edge(u: start, v: edge.v, w: edge.w))
        }
        
        while let edge = q.dequeue() {
            if edge.w < d[edge.v] {
            d[edge.v] = edge.w
            for e in adjList[edge.v] {
                 q.enqueue(Edge(u: edge.v, v: e.v, w: -(e.w * edge.w)))
             }
            }
         }
      
//         while let edge = q.dequeue() {
//             print("Edge ", edge)
//             // if visited[edge.v] { continue }
//             visited[edge.v] = true
        
//             for nextEdge in adjList[edge.v] {
//                 // print(nextEdge)
//                 let nextWeight = -(d[edge.u] * nextEdge.w)
//                 print("nextWeight ", nextWeight)
//                 if  nextWeight < d[nextEdge.v] {
//                     d[nextEdge.v] = nextWeight
//                     q.enqueue(Edge(u: edge.v, v: nextEdge.v, w: nextWeight))
//                 }
//                 print(d)
//             }
//             print(d)
//             print(q)
//         }
        print(d)
        return abs(d[end])
}

struct Edge : Comparable, Hashable {
    var u: Int
    var v: Int
    var w: Double

    static func <(a: Edge, b: Edge) -> Bool {
            return a.w < b.w
   }
}
