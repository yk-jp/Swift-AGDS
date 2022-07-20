//
//  ExaustiveSearch.swift
//  Swift-AGDS
//
//  Created by Yusuke K on 2022-07-13.
//

import Foundation

//func printBinaryExhaustive(_ n: Int) {
//    printBinaryExhaustiveHelper(n, "")
//}
//
//func printBinaryExhaustiveHelper(_ n: Int, _ soFar: String) {
//    if soFar.count == 0 {
//
//    }
//}

func printDecimal(_ n: Int, _ soFar: String = "") {
    if n == 0 {
        print(soFar)
    }
    else {
        for i in 0...9 {
            printDecimal(n - 1, soFar + "\(i)")
        }
    }
}

//Example:
//permutation(“park”)
//park pakr prak prka pkar pkra aprk apkr arpk arkp akpr akrp
//rpak rpka rapk rakp rkpa rkap kpar kpra kapr karp krpa krap

func permutation(_ word : String) {
   permutationHelper(word, "")
}

func permutationHelper(_ word : String, _ soFar: String) {
    if word.count == 0 {
        print(soFar)
    } else {
        for i in 0 ..< word.count {
            let c = word[i] // chosen letter
            permutationHelper(word[0,i] + word[i+1, word.count], soFar + c)
        }
    }
}

func rollDice(_ n: Int) {
    var choices = [Int]()
    rollDiceHelper(n, choices: &choices)
}

func rollDiceHelper(_ n: Int, choices: inout [Int]){
    if n == 0 {
        print(choices)
    } else {
        for i in 1...6 {
            choices.append(i)
            rollDiceHelper(n-1, choices: &choices)
            choices.removeLast()
        }
    }
}
