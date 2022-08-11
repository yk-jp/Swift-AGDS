//
//  Bridges.swift
//  Swift-AGDS
//
//  Created by Yusuke K on 2022-08-09.
//

import Foundation

func bridge() {
    let islandMap: [[Int]] = island()
    
    
    
    
}

func island() -> [[Int]] {
  struct Square {
    let x: Int
    let y: Int
  }
  let dx = [0, 0, 1, -1]
  let dy = [1, -1, 0, 0]
 
  var townMap = [[Int]]()
  
  let n = Int(readLine()!)!
  var groupMap = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
  
  for _ in 0..<n {
    let line = readLine()!.split(separator: " ")
    let row = line.map{ Int($0)!}
    townMap.append(row)
  }
  
  func bfs(x: Int, y: Int, id: Int) {
    let q = Queue<Square>()
    q.enqueue(item: Square(x: x, y: y))
    groupMap[x][y] = id
    
    while !q.isEmpty() {
      let sq = q.dequeue()!
      let x = sq.x
      let y = sq.y
      for i in 0..<4 { // 4 directions
        let nx = x + dx[i]
        let ny = y + dy[i]
        if nx >= 0 && nx < n && ny >= 0 && ny < n {
          if townMap[nx][ny] == 1 && groupMap[nx][ny] == 0 {
            q.enqueue(item: Square(x: nx, y: ny))
            groupMap[nx][ny] = id
          }
        }
      }
    }
  }
  
  var id = 0
  for x in 0..<n {
    for y in 0..<n {
      if townMap[x][y] == 1 && groupMap[x][y] == 0 {
        id += 1
        bfs(x: x, y: y, id: id)
      }
    }
  }
  
  print("islands")
  for row in groupMap {
    print(row)
  }

  return groupMap
}


//Sample Input1
//10
//1 1 1 0 0 0 0 1 1 1
//1 1 1 1 0 0 0 0 1 1
//1 0 1 1 0 0 0 0 1 1
//0 0 1 1 1 0 0 0 0 1
//0 0 0 1 0 0 0 0 0 1
//0 0 0 0 0 0 0 0 0 1
//0 0 0 0 0 0 0 0 0 0
//0 0 0 0 1 1 0 0 0 0
//0 0 0 0 1 1 1 0 0 0
//0 0 0 0 0 0 0 0 0 0
//Sample Output1
//3
//
//Sample Input2
//10
//1 1 1 0 0 0 0 1 1 1
//1 1 1 1 0 0 0 0 1 1
//1 0 1 1 0 0 0 0 1 1
//0 0 1 1 1 0 0 0 0 1
//0 0 0 1 0 0 0 0 0 1
//0 0 0 0 0 0 1 0 0 1
//0 0 0 0 0 0 1 0 0 0
//0 0 0 0 1 1 1 0 0 0
//0 0 0 0 1 1 1 0 0 0
//0 0 0 0 0 0 0 0 0 0
//Sample Output2
//2

