//
//  TimeMachine.swift
//  Swift-AGDS
//
//  Created by Yusuke K on 2022-08-24.
//

import Foundation

func timeMachine() {
    let firstLine = readLine()!.split(separator: " ")
    
    let n = Int(firstLine[0])!
    let m = Int(firstLine[1])!
    
    var dist = [Int](repeating: 10000, count: n + 1)
    var routes = [(src: Int, dst: Int, time: Int)]()
    
    for _ in 1...m {
        let line = readLine()!.split(separator: " ")
        let src = Int(line[0])!
        let dst = Int(line[1])!
        let time = Int(line[2])!
        routes.append((src:src, dst:dst, time:time))
    }
    
    dist[1] = 0
    
    for _ in 0..<n-1 {
        for route in routes {
            if dist[route.dst] > dist[route.src] + route.time {
                dist[route.dst] = dist[route.src] + route.time
            }
        }
    }
    
    
    print("1st ",dist)
    
    var hasNegativeCycle = false
    
    for _ in 0..<n-1 {
        for route in routes {
            if dist[route.dst] > dist[route.src] + route.time {
               hasNegativeCycle = true
            }
        }
    }
    
    print("2nd ",dist)
    
    if hasNegativeCycle {
        print(-1)
        return
    }
    
    for i in 2..<n + 1 {
        if dist[i] > 10000 {
            print(-1)
            continue
        }
        
        print(dist[i])
    }
}

//3 4
//1 2 4
//1 3 3
//2 3 -1
//3 1 -2

//Output
//4
//3

//3 4
//1 2 4
//1 3 3
//2 3 -4
//3 1 -2
//Output
//-1

//3 2
//1 2 4
//1 2 3
//
//Output
//3
//-1
