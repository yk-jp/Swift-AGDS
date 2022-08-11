//
//  CourseSchedule2+leetcode.swift
//  Swift-AGDS
//
//  Created by Yusuke K on 2022-08-10.
//

import Foundation

//http://leetcode.com/problems/course-schedule-ii/#.YvSPC0DGo-k.twitter

func findOrder(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
    if prerequisites == [] {
        return Array(0..<numCourses)
    }
    
    var adj = [[Int]](repeating: [Int](), count: numCourses + 1)
    var indegree = [Int](repeating: 0, count: numCourses)
    
    for v in prerequisites {
        adj[v[1]].append(v[0])
        indegree[v[0]] += 1
    }
    
    var q:[Int] = [Int]()
    var order: [Int] = [Int]()
    for i in 0..<indegree.count {
        if indegree[i] == 0 {
            q.append(i)
        }
    }
    
    while q.count > 0 {
        var u = q.remove(at: 0)
        order.append(u)
        for v in adj[u] {
            indegree[v] -= 1
            if indegree[v] == 0 {
                q.append(v)
            }
        }
    }
    
    return !indegree.contains(1) ? order : []
}
