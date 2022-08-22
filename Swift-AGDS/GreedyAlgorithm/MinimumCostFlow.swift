//
//  MinimumCostFlow.swift
//  Swift-AGDS
//
//  Created by Yusuke K on 2022-08-19.
//

import Foundation

func minimumCostFlow () -> Int {
    let firstLine = readLine()!.split(separator: " ").map{Int($0)!}
    let N = firstLine[0]
    let M = firstLine[1]
    var D = firstLine[2] // enhancer
   
    var allEdges = [(u: Int, v: Int, w: Int)]()
    var alternativeEdges = [(u: Int, v: Int, w: Int)]()
    var tmpValidPlanEdges = [(u: Int, v: Int, w: Int)]()
    var tmpValidPlanCost = 0
    
    for i in 1...M {
        let line = readLine()!.split(separator: " ").map{Int($0)!}
        let u = line[0]
        let v = line[1]
        let w = line[2]
       
        allEdges.append((u: u, v: v, w: w))
        if i <= N - 1 {
            tmpValidPlanEdges.append((u: u, v: v, w: w))
            tmpValidPlanCost += w
        } else {
            alternativeEdges.append((u: u, v: v, w: w))
        }
    }
    
    allEdges.sort { $0.w < $1.w } // asc
    alternativeEdges.sort { $0.w > $1.w } // desc
    tmpValidPlanEdges.sort { $0.w < $1.w } // asc
    let (minCost, mstEdges) = kruskalMST(M + 1, allEdges)

    print("all edges = \(allEdges)")
    print()
    print("alternative edges = \(alternativeEdges)")
    print()
    print("temporary valid plan = \(tmpValidPlanEdges)")
    print()
    print("MST = \(mstEdges)")
    print()
    print("temporary valid cost = \(tmpValidPlanCost)" )
    print()
    print("minCost = \(minCost)")
    
    if tmpValidPlanCost == minCost {
        print(0)
        return 0
    }
    
    var days = 0
    
    while tmpValidPlanCost > minCost  {
        if D != 0 {
           tmpValidPlanCost -= D
           tmpValidPlanEdges[tmpValidPlanEdges.count - 1].w = max(0, tmpValidPlanEdges[tmpValidPlanEdges.count - 1].w - D)
           tmpValidPlanEdges.sort { $0.w < $1.w }
           D = 0
           continue
        }

        if  alternativeEdges.count == 0 || alternativeEdges[alternativeEdges.count - 1].w > tmpValidPlanEdges[tmpValidPlanEdges.count - 1].w {
            break
        }

        let alternativeEdge = alternativeEdges.popLast()!

        tmpValidPlanCost -= (tmpValidPlanEdges[tmpValidPlanEdges.count - 1].w - alternativeEdge.w)
        tmpValidPlanEdges[tmpValidPlanEdges.count - 1].w = alternativeEdge.w
        tmpValidPlanEdges.sort { $0.w < $1.w }

        days += 1
    }
    
    print("arranged pipes \(tmpValidPlanEdges)")
    print("arranged cost \(tmpValidPlanCost)")
    print(days)
    return days
}

func kruskalMST(_ M :Int, _ allEdges: [(u: Int, v: Int, w: Int)]) -> (Int, [(Int, Int, Int)]) {
    var mstEdges = [(u: Int, v: Int, w: Int)]()
    
    var uf = UF(M + 1)
    
    for edge in allEdges {
        if uf.connected(edge.u, edge.v) { continue }
        mstEdges.append(edge)
        uf.union(edge.u, edge.v)
    }
    
    let cost = mstEdges.map { $0.w }.reduce(0, +)
    return (cost, mstEdges)
}

public struct CompEdge {
  public var u: Int
  public var v: Int
  public var w: Int
}

extension CompEdge: Comparable {
  public static func <(lhs: CompEdge, rhs: CompEdge) -> Bool {
    return lhs.w < rhs.w
  }
}

//minimumCostFlow()
//
//public struct UF {
//    /// parent[i] = parent of i
//    private var parent: [Int]
//    /// size[i] = number of nodes in tree rooted at i
//    private var size: [Int]
//    /// number of components
//    private(set) var count: Int
//
//    /// Initializes an empty union-find data structure with **n** elements
//    /// **0** through **n-1**.
//    /// Initially, each elements is in its own set.
//    /// - Parameter n: the number of elements
//    public init(_ n: Int) {
//        self.count = n
//        self.size = [Int](repeating: 1, count: n)
//        self.parent = [Int](repeating: 0, count: n)
//        for i in 0..<n {
//            self.parent[i] = i
//        }
//    }
//
//    /// Returns the canonical element(root) of the set containing element `p`.
//    /// - Parameter p: an element
//    /// - Returns: the canonical element of the set containing `p`
//    public mutating func find(_ p: Int) -> Int {
//        // TODO
//        var p = p
//        while p != self.parent[p] {
//            self.parent[p] = self.parent[self.parent[p]]
//            p = self.parent[p]
//        }
//
//        return p
//    }
//
//    /// Returns `true` if the two elements are in the same set.
//    /// - Parameters:
//    ///   - p: one elememt
//    ///   - q: the other element
//    /// - Returns: `true` if `p` and `q` are in the same set; `false` otherwise
//    public mutating func connected(_ p: Int, _ q: Int) -> Bool {
//        // TODO
//        return find(p) == find(q)
//    }
//
//    /// Merges the set containing element `p` with the set containing
//    /// element `q`
//    /// - Parameters:
//    ///   - p: one element
//    ///   - q: the other element
//    public mutating func union(_ p: Int, _ q: Int) {
//        // TODO
//        let i = find(p)
//        let j = find(q)
//        if i == j { return }
//
//        if self.size[i] < self.size[j] {
//            self.parent[i] = j
//            self.size[j] += self.size[i]
//            return
//        }
//
//        self.parent[j] = i
//        self.size[i] += self.size[j]
//    }
//}
