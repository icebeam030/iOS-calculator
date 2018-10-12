//
//  main.swift
//  calc
//
//  Created by Zheyang Zheng on 23/3/18.
//  Copyright © 2018 UTS. All rights reserved.
//

import Foundation

var args = ProcessInfo.processInfo.arguments
args.removeFirst()  // remove the name of the program

enum ProgramError: Error {
    case invalidInput
    case outOfBounds
    case divisionByZero
}

var operandArray: [Int] = []
var operatorArray: [String] = []

let errorHandling = ErrorHandling(string: args)
errorHandling.inputErrorHandling()

// main calculation using precedence climbing, starting with the (i + 1)th number and operator, and the lowest precedence
func Calc(i: Int, minPrec: Int = 1) throws -> Int {
    var lhs = operandArray[i]
    var rhs: Int
    
    if operatorArray.count == 0 {
        return lhs
    }
    
    var op = Operators(index: i)
    var nextOp: Operators
    
    while op.precedence() >= minPrec {
        if op.index == operatorArray.count - 1 {
            return try op.performOperation(a: lhs, b: operandArray[operandArray.count - 1])
        }  // if current operator is the last operator, compute lhs with the last number and return, else advance to next operator
        
        nextOp = op.next()
        rhs = try Calc(i: op.index + 1, minPrec: op.precedence() + 1)  // recursive call, start from next operator and climb precedence by 1
        lhs = try op.performOperation(a: lhs, b: rhs)
        
        //determine the starting operator in next while loop
        if nextOp.precedence() > op.precedence() && nextOp.index < operatorArray.count - 1 {
            while nextOp.precedence() > op.precedence() {
                if nextOp.index == operatorArray.count - 1 {
                    return lhs
                }
                nextOp = nextOp.next()
            }
            
            op = nextOp
        }  // if next operator's precedence is higher, iterate until finding an operator with the same precedence as the current one
        else if nextOp.precedence() > op.precedence() && nextOp.index == operatorArray.count - 1 {
            return lhs
        }
        else {
            op = op.next()
        }
    }
    
    return lhs
}

errorHandling.calculationErrorHandling()
