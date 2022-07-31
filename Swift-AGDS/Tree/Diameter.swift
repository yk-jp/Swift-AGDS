//
//  Diameter.swift
//  Swift-AGDS
//
//  Created by Yusuke K on 2022-07-30.
//

import Foundation


func diameter() {
    func adjacencyListWeightedRepresentation() {
      // adjacency list
      
      for _ in 1...n {
        let currLine = readLine()!.split(separator: " ")
        
        let v = Int(currLine[0])!
          
          for idx in 1..<Int(currLine.count/2) {
             let connectedV = Int(currLine[2 * idx - 1])!
             let distance = Int(currLine[2 * idx])!
             adjList[v].append((connectedV, distance))
          }
      }
      
      for (u, row) in adjList.enumerated() {
        print("\(u) : \(row)")
      }
    }
    
    func calcDistance(_ start: Int, _ currTotalDis: Int,_ visited: [Bool]) -> Int {
        var visited = visited
        var currTotalDis = currTotalDis
        
        visited[start] = true
        var disList:[Int] = []
        var prevDis = 0
        
        for v in adjList[start] {
            if !visited[v.0] {
               currTotalDis = calcDistance(v.0, currTotalDis + v.1, visited)
                disList.append(currTotalDis)
                currTotalDis -= prevDis == 0 ? v.1 : prevDis
            } else {
                disList.append(currTotalDis)
                prevDis = v.1
            }
        }
        
        return disList.count == 0 ? 0 : disList.max()!
    }
    
    let n = Int(readLine()!)!
    var adjList = [[(Int, Int)]](repeating: [], count: n + 1)
    let visited:[Bool] = [Bool](repeating: false, count: n + 1)
    
    var result = 0
    adjacencyListWeightedRepresentation()

    for idx in 1..<adjList.count {
        let totalDis = calcDistance(idx, 0,visited)
        result = totalDis > result ? totalDis : result
    }
    
    print("result " , result)
}
//5
//1 3 2 -1
//2 4 4 -1
//3 1 2 4 3 -1
//4 2 4 3 3 5 6 -1
//5 4 6 -1

//8
//1 3 2 -1
//2 4 4 -1
//3 1 2 4 3 6 2 -1
//4 2 4 3 3 5 6 -1
//5 4 6 -1
//6 3 2 7 4 -1
//7 6 4 8 5 -1
//8 7 5 -1
