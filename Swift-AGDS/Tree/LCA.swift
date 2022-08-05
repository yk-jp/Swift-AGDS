import Foundation

// copy-paste all your classes/structs used in the program.
//class Queue {}
//struct Edge {}
//class Graph {}
// ...

func LCASolution() {
    // your main logic (input processing, algorithm, etc.)
    var tree = LCAAdjacencyList()
    print()
    
    let m = Int(readLine()!)!
    
    for _ in 0..<m {
        let input = readLine()!.split(separator: " ").map{Int($0)!}
        findCommonVal(input, &tree)
    }
    
    // remove all your debugging print statements
    // print the result (make sure you follow the output specification)
}

func findCommonVal(_ input: [Int], _ tree: inout [Int] ){
    let d1 = input[0]
    let d2 = input[1]
    var pathD1:[Int] = []
    var pathD2:[Int] = []
    
    trackPath(&pathD1, d1, &tree)
    trackPath(&pathD2, d2, &tree)
    
    var idx1 = pathD1.count - 1
    var idx2 = pathD2.count - 1
    
    while (idx1 != -1 && idx2 != -1) && pathD1[idx1] == pathD2[idx2] {
        idx1 -= 1
        idx2 -= 1
    }
    
   print(pathD1[idx1+1])
}

func trackPath(_ path: inout [Int], _ d: Int, _ tree: inout [Int])  {
    var d = d
    while true {
        path.append(d)
        if d == 1 { break }
        d = tree[d]
    }
}

// you can include as many helper functions as you want.
func LCAAdjacencyList() -> [Int] {
    let n = Int(readLine()!)!
    var tree = [Int](repeating: -1, count: n + 1)
    
     for idx in 1..<n {
        let line = readLine()!.split(separator: " ")
        let n1 = Int(line[0])!
        let n2 = Int(line[1])!
        
        if idx == 1 {
            tree[1] = 0
        }
        
        if tree[n1] != -1 {
            tree[n2] = n1
        } else {
            tree[n1] = n2
        }
    }
    
    return tree
}

//15
//1 2
//1 3
//2 4
//3 7
//6 2
//3 8
//4 9
//2 5
//5 11
//7 13
//10 4
//11 15
//12 5
//14 7
//6
//6 11
//10 9
//2 6
//7 6
//8 13
//8 15
