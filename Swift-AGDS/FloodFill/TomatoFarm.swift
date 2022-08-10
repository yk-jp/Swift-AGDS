//
//  TomatoFarm.swift
//  Swift-AGDS
//
//  Created by Yusuke K on 2022-08-09.
//

import Foundation

func tomatoFarm() {
    
    struct Square {
        let row: Int
        let col: Int
    }
    
    var q = Queue<Square>()
    
    let size =  readLine()!.split(separator: " ").map { Int($0)! }
    var box = [[Int]]()
    var visited = [[Bool]](repeating: [Bool](repeating: false, count: size[0]), count: size[1])
    
    for i in 0..<size[1] {
        let line = readLine()!.split(separator: " ")
        let row = line.enumerated().map { (idx, data) -> Int in
            let val = Int(String(data))!
            if val == 1 {
                q.enqueue(item: Square(row: i, col: idx))
            }
            return val
        }
        box.append(row)
    }
    
    func bfs(_ days :inout Int) {
        let oneQ = Queue<Square>()
        while !q.isEmpty() {
            let currTomato = q.dequeue()
            if currTomato!.row < 0 || currTomato!.row >= size[1] || currTomato!.col < 0 || currTomato!.col >= size[0] {
                continue
            }
            
            if box[currTomato!.row][currTomato!.col] == -1 || visited[currTomato!.row][currTomato!.col] {
                continue
            }
            
            visited[currTomato!.row][currTomato!.col] = true
            box[currTomato!.row][currTomato!.col] = 1
            oneQ.enqueue(item: Square(row: currTomato!.row + 1, col: currTomato!.col))
            oneQ.enqueue(item: Square(row: currTomato!.row - 1, col: currTomato!.col))
            oneQ.enqueue(item: Square(row: currTomato!.row, col: currTomato!.col + 1))
            oneQ.enqueue(item: Square(row: currTomato!.row, col: currTomato!.col - 1))
        }
        
        if !oneQ.isEmpty() {
           q = oneQ
           print("day  \(days): \(q)" )
           days+=1
           bfs(&days)
        }
    }
    
    if q.isEmpty() {
        print(-1)
        return
    }
    var days = 0
    bfs(&days)
    
    print()
    print()
    print("box \(box)")
    print("visit \(visited)")
    
    for row in box {
        for sq in row {
            if sq == 0 {
                print(-1)
                return
            }
        }
    }
    
    print("days \(days - 1)")
}
//Sample Input1
//6 4
//0 0 0 0 0 0
//0 0 0 0 0 0
//0 0 0 0 0 0
//0 0 0 0 0 1
//
//Sample Output1
//8
//Sample Input2
//6 4
//0 -1 0 0 0 0
//-1 0 0 0 0 0
//0 0 0 0 0 0
//0 0 0 0 0 1
//Sample Output2
//-1
//Sample Input3
//6 4
//1 -1 0 0 0 0
//0 -1 0 0 0 0
//0 0 0 0 -1 0
//0 0 0 0 -1 1
//Sample Output3
//6
//Sample Input4
//5 5
//-1 1 0 0 0
//0 -1 -1 -1 0
//0 -1 -1 -1 0
//0 -1 -1 -1 0
//0 0 0 0 0
//Sample Output4
//14
//Sample Input5
//2 2
//1 -1
//-1 1
//Sample Output5
//0
//
