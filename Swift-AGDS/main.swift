//
//  main.swift
//  Swift-AGDS
//
//  Created by Yusuke K on 2022-07-11.
//

import Foundation


// 3. printBinary(n): prints binary form of given int
//
//printBinary(2, padding: "")   //prints 10
//printBinary(7, padding: "")    //prints 111
//printBinary(42, padding: "")   //prints 101010
//printBinary(-500, padding: "") //prints -111110100

// 4. reverseLines
//reverseLines(0)

// 5. evaluate
// Write a recursive function evaluate that accepts a string representing a math expression and computes its value.
// - The expression will be "fully parenthesized" and will consist of + and * on single-digit integers only.
// - You can use a helper function. (Do not change the original function header)
//print(evaluate("7"))                // -> 7
//print(evaluate("(2+2)"))             //-> 4
//print(evaluate("(1+(2*4))"))       //-> 9
//print(evaluate("((1+3)+((1+2)*5))")) //-> 19

//rollDiceSum(2,5)

// quick sort

//var a = [12,4,5,6,7,3,1,15]
//quickSort(&a, 0, a.count-1)
//print(a)

var nums = Bag<Int>()
nums.add(1)
nums.add(2)
nums.add(3)

for num in nums {
    print(num)
}

var numsStack = Stack<Int>()
numsStack.push(1)
numsStack.push(2)
numsStack.push(3)
print(numsStack.pop())
print(numsStack.peek())
print(numsStack.pop())
print(numsStack.pop())

for num in numsStack {
    print(num)
}

var numsQueue = Queue<Int>()
numsQueue.enqueue(1)
numsQueue.enqueue(2)
numsQueue.enqueue(3)
numsQueue.enqueue(3)
numsQueue.enqueue(3)
print(numsQueue.dequeue())

for num in nums {
    print(num)
}
