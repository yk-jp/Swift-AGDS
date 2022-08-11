//
//  CourseSchedule+leetcode.swift
//  Swift-AGDS
//
//  Created by Yusuke K on 2022-08-10.
//

import Foundation

//http://leetcode.com/problems/course-schedule/#.YvSM5Q7cl58.twitter

func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
    if prerequisites == [] { return true }
    
    var adj = [[Int]](repeating: [Int](), count: numCourses + 1)
    var indegree = [Int](repeating: 0, count: numCourses)
    
    for v in prerequisites {
        adj[v[1]].append(v[0])
        indegree[v[0]] += 1
    }
    
    var q:[Int] = [Int]()
    
    for i in 0..<indegree.count {
        if indegree[i] == 0 {
            q.append(i)
        }
    }
    
    while q.count > 0 {
        var u = q.remove(at: 0)
        
        for v in adj[u] {
            indegree[v] -= 1
            if indegree[v] == 0 {
                q.append(v)
            }
        }
    }
    
    return !indegree.contains(1)
}
