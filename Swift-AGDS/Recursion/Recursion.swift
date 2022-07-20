//
//  Recursion.swift
//  Swift-AGDS
//
//  Created by Yusuke K on 2022-07-11.
//

import Foundation

// 1. power(base, exponent): base^exponent
// assume exponent >= 0
func power(base: Int, exponent: Int) -> Int {
  assert(exponent >= 0)
  // base case
  if exponent == 0 { return 1 }
  // recursive case
  return base * power(base: base, exponent: exponent - 1)
}

// 2. isPalindrome(word): checks if a word is palindrome
func isPalindrome(_ word: String) -> Bool {
  // base case
  if word.count <= 1 { return true }
  // recursive case
  if word[0] == word[word.count - 1] {
    return isPalindrome(word[1, word.count - 1])
  }
  return false
}


// Homework
//printBinary(2)    prints 10
//printBinary(7)    prints 111
//printBinary(42)   prints 101010
//printBinary(-500) prints -111110100

// 3. printBinary(n): prints binary form of given int
func printBinary(_ n: Int, padding: String) {
//  // print without newline
//  print("-", terminator: "")
    
    if n == 1 || n == -1 {
        print(String(n) + padding)
        return
    }
    
    let quotient: Int = n/2
    let remainder: Int = n%2
    
    return printBinary(quotient, padding: String(abs(remainder)) + padding)
}

//
// Homework
// 4. reverseLines
// - Print all lines in reverse order (recursively) from a text file
// - You can change the function header if you want
func reverseLines(_ line: Int) {
    
  let contents = try! String(contentsOfFile: "/Users/yusukek/code/Swift-AGDS/Swift-AGDS/Recursion/story.txt")
//    let contents = """
//                   hello
//                   world
//                   """
    
    func helper(_ printedWords: Int, _ currLineSentence: String) {
        //base case
        if printedWords >= contents.count {
            print(currLineSentence, terminator: "\n")
            return
        }
        
        let currStr = contents[contents.count - printedWords - 1]
        
        if Character(currStr).isNewline {
            print(currLineSentence)
            return helper(printedWords + 1, "")
        }
        
        return helper(printedWords + 1 , currStr + currLineSentence)
    }
    
    return helper(0, "")
}

// 5. evaluate
// Write a recursive function evaluate that accepts a string representing a math expression and computes its value.
// - The expression will be "fully parenthesized" and will consist of + and * on single-digit integers only.
// - You can use a helper function. (Do not change the original function header)
// - Use Recursion
// evaluate("7")                 -> 7
// evaluate("(2+2)")             -> 4
// evaluate("(1+(2*4))")         -> 9
// evaluate("((1+3)+((1+2)*5))") -> 19


func evaluate(_ expr: String) -> Int {
    return helper(expr)
}

func helper(_ expr: String) -> Int {
    var expr = expr
    var op = "+"
    var res = 0
    
    while  expr.count > 0 {
        let val = String(expr.removeFirst())
        
        if let num = Int(String(val)) {
            if op == "+" {
               res += num
            } else {
               res *= num
            }
        }

        else if val == "(" {
            let tmp = helper(expr)
            if op == "+" {
                res += tmp
            } else {
                res *= tmp
            }
            
            return res
        }

        else if val == ")" {
            return res
        }

        else if val == "*" || val == "+" {
            op = val
        }
    }

    return res
}


