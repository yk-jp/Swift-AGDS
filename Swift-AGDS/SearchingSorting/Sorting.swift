//
//  Sorting.swift
//  Swift-AGDS
//
//  Created by Yusuke K on 2022-07-18.
//

import Foundation

// * Quick Sort (Does not sort in-place)
// Space Complexity: O(n) -> Your implementation should be O(1) (which means you're not supposed to create new arrays)
func quickSortSlow<T: Comparable>(_ arr: [T]) -> [T] {
    if arr.count <= 1 { return arr }
    var elements = arr
    let pivot = elements.removeLast()
    let lessOrEqual = elements.filter { $0 <= pivot }
    let greater = elements.filter { $0 > pivot }
    return quickSortSlow(lessOrEqual) + [pivot] + quickSortSlow(greater)
}

// * Quick Sort (sorts in-place)
// Time Complexity: O(N lgN) -> technically O(N^2) in the worst case
// Space Complexity: O(1)
func quickSort<T: Comparable>(_ arr: inout [T], _ start: Int, _ end: Int) {
    // TODO
    if start < end {
        let pivot = partition(&arr,start,end)
        quickSort(&arr, start, pivot-1)
        quickSort(&arr, pivot + 1, end)
    }
    
}

/// Returns the index of the pivot
/// - Parameters:
///   - arr: the array
///   - start: the start index
///   - end: the end index
/// - Returns: the index of the pivot after partitioning
func partition<T: Comparable>(_ arr: inout [T], _ start: Int, _ end: Int) -> Int {
    // TODO
    let pivot = arr[end]
    var lp = start
    var rp = end
    
    while lp < rp {
       
        while arr[lp] <= pivot && lp < rp { lp += 1 }
        while arr[rp] >= pivot && lp < rp { rp -= 1 }
        
        swap(&arr, lp, rp)
    }
    
    swap(&arr, lp, end)
    
    return lp
}

func swap<T: Comparable>(_ arr: inout [T], _ idx1: Int, _ idx2: Int) {
    let tmp = arr[idx2]
    arr[idx2] = arr[idx1]
    arr[idx1] = tmp
}
