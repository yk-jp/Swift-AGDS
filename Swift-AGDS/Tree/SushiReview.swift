//
//  SushiReview.swift
//  Swift-AGDS
//
//  Created by Yusuke K on 2022-08-04.
//

import Foundation

func sushiSolution() -> Int {
    let firstLine = readLine()!.split(separator: " ").map{Int($0)!}
    let n = firstLine[0]
    let m = firstLine[1]
    
    let realSushiP:[Int] = readLine()!.split(separator: " ").map{Int($0)!}
//    print("readSushiP: ",realSushiP)
    let adjList: [[Int]] = sushiAdjacencyList(n)
        
    func trackPath(_ start: Int, _ adjList: [[Int]], _ visited: inout [Bool], _ dis: Int, _ count : Int) -> Int {
        var count = count
        var dis = dis
        visited[start] = true
        
        if realSushiP.contains(start) { count+=1 }
        if m == count { return dis }

        for v in adjList[start] {
            if !visited[v] {
                if adjList[v].count != 1 {
                   dis = trackPath(v, adjList, &visited, dis + 1, count)
                }
                else if adjList[v].count == 1 && realSushiP.contains(v) {
                    if m == count + 1 {
                       dis = trackPath(v, adjList, &visited, dis + 1, count)
                    } else {
                       dis += 2
                       count+=1
                       continue
                    }
                }
                else {
                    return dis
                }
            }
        }
        
        return dis
    }
    
    var min = 0
    for sushiP in realSushiP {
        var visited:[Bool] = [Bool](repeating: false, count: n)
        let totalD = trackPath(sushiP, adjList, &visited, 0, 0)
        if min == 0 { min = totalD }
//        print("\(sushiP) ", totalD)
        min = totalD < min ? totalD : min
    }
    
    print(min)
    return min
}

func sushiAdjacencyList(_ n: Int) -> [[Int]] {
    var adjList = [[Int]](repeating: [], count: n)
    
     for _ in 1..<n {
         let line = readLine()!.split(separator: " ")
         let n1 = Int(line[0])!
         let n2 = Int(line[1])!
         
         adjList[n1].append(n2)
         adjList[n2].append(n1)
     }
    
    for (u, row) in adjList.enumerated() {
        print("\(u) : \(row)")
    }
    
    return adjList
}
//8 2
//5 2
//0 1
//0 2
//2 3
//4 3
//6 1
//1 5
//7 3

//8 5
//0 6 4 3 7
//0 1
//0 2
//2 3
//4 3
//6 1
//1 5
//7 3

