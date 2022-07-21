//
//  Stack.swift
//  Swift-AGDS
//
//  Created by Yusuke K on 2022-07-20.
//

import Foundation

/// The Stack class represents a last-in-first-out (LIFO) stack of generic items.
/// It supports the usual *push* and *pop* operations, along with methods for peeking at the top item, testing if the stack is empty, and iterating through the items in LIFO order.
/// This implementation uses a singly linked list with an inner class for linked list nodes.
public final class Stack<E> : Sequence {
    
    private var first: Node<E>? = nil
    
    private(set) var count: Int = 0
    
    fileprivate class Node<E> {
        fileprivate var item: E
        fileprivate var next: Node<E>?
        fileprivate init(item: E, next: Node<E>?) {
            self.item = item
            self.next = next
        }
    }
    
    public init() {}
    
    public func isEmpty() -> Bool {
        return first == nil
    }
    
    public func push(_ item: E) {
        let oldFirst = first
        first = Node<E>(item: item, next: oldFirst)
        count += 1
    }
    
    public func pop() -> E? {
        if isEmpty() { return nil }
        
        let oldFirst = first
        first = oldFirst?.next
        
        count-=1
        
        return oldFirst?.item
    }
    
    public func peek() -> E? {
        if isEmpty() { return nil }
        
        if let item = first?.item {
            return item
        }
        
        return nil
    }
    
    public struct StackIterator<E> : IteratorProtocol {
        private var current: Node<E>?
        
        fileprivate init(_ first: Node<E>?) {
            self.current = first
        }
        
        public mutating func next() -> E? {
            if let item = current?.item {
                current = current?.next
                return item
            }
            return nil
        }
    }
    
    /// Returns an iterator that iterates over the items in this bag in reverse order.
    public func makeIterator() -> StackIterator<E> {
        return StackIterator(first)
    }
    
}
