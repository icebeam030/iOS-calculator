//
//  Operators.swift
//  calc
//
//  Created by Zheyang Zheng on 27/3/18.
//  Copyright © 2018年 UTS. All rights reserved.
//

import Foundation

class Operators {
    var index: Int
    var op: String
    
    init (index: Int) {
        self.index = index
        self.op = operatorArray[index]
    }
    
    func next() -> Operators {
        return Operators(index: index + 1)
    }
    
    func precedence() -> Int {
        switch op {
        case "+", "-":
            return 1
        case "x", "/", "%":
            return 2
        default:
            return 0
        }
    }
         
    func performOperation(a: Int, b: Int) throws -> Int {
        switch op {
        case "+":
            if a + b > Int.max || a + b < Int.max * -1 {
                throw ProgramError.outOfBounds
            }
            return a + b
        case "-":
            if a - b > Int.max || a - b < Int.max * -1 {
                throw ProgramError.outOfBounds
            }
            return a - b
        case "x":
            if a * b > Int.max || a * b < Int.max * -1 {
                throw ProgramError.outOfBounds
            }
            return a * b
        case "/":
            if b == 0 {
                throw ProgramError.divisionByZero
            }
            return a / b
        case "%":
            return a % b
        default:
            throw ProgramError.invalidInput
        }
    }
    
}
