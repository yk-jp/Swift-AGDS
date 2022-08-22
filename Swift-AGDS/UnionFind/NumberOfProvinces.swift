////
////  NumberOfProvinces.swift
////  Swift-AGDS
////
////  Created by Yusuke K on 2022-08-17.
////
//
//import Foundation
//
//func findCircleNum(_ isConnected: [[Int]]) -> Int {
//       var uf = UF(isConnected.count)
//
//       for p in 0..<isConnected.count {
//        for q in 0..<isConnected.count {
//            if isConnected[p][q] == 1 {
//               uf.union(p,q)
//            }
//        }
//       }
//
//       var parentSet = Set<Int>()
////       let parent = uf.getParent()
//
//       for p in parent {
//         parentSet.insert(uf.find(p))
//       }
//
//       return parentSet.count
//}
