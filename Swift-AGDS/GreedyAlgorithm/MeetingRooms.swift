//
//  meetingRooms.swift
//  Swift-AGDS
//
//  Created by Yusuke K on 2022-08-12.
//

import Foundation
//https://leetcode.com/problems/meeting-rooms/
func canAttendMeetings(_ intervals: [[Int]]) -> Bool {
    var start: [Int] = []
    var end: [Int] = []
    
    for vals in intervals {
        start.append(vals[0])
        end.append(vals[1])
    }
    
    start = start.sorted()
    end = end.sorted()
    
    print(start)
    print(end)
    
    // false pattern
    // s1
    //  ------e1
    //    s2
    //  ----------e2
    
    for i in 0..<intervals.count-1 {
        if end[i] > start[i + 1] {
           return false
        }
    }

    return true
}

//Input
//[[0, 30], [5, 10], [15, 20]]
//Output
// false

//Input
//[[7, 10], [2,4]]
//Output
// true
