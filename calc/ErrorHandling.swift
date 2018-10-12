//
//  ErrorHandling.swift
//  calc
//
//  Created by Zheyang Zheng on 2018/4/3.
//  Copyright © 2018年 UTS. All rights reserved.
//

import Foundation

class ErrorHandling {
    var string: [String]
    
    init (string: [String]){
        self.string = string
    }
    
    func isOperand(index: Int) -> Bool {
        if Int(string[index]) != nil {
            return true
        }
        else {
            return false
        }
    }
    
    func isOperator(index: Int) -> Bool {
        switch string[index] {
        case "+", "-", "x", "/", "%":
            return true
        default:
            return false
        }
    }
    
    //check if input is valid
    func checkInput() throws {
        var i = 1
        guard isOperand(index: 0) && string.count % 2 != 0 else {
            throw ProgramError.invalidInput
        }
        
        while i < string.count - 1 {
            guard isOperator(index: i) && isOperand(index: i + 1) else {
                throw ProgramError.invalidInput
            }
            i += 2
        }
    }
    
    //append numbers and operators to separate arrays if input is valid
    func inputErrorHandling() {
        do {
            try checkInput()
            for i in 0..<string.count {
                if isOperand(index: i) {
                    operandArray.append(Int(string[i])!)
                }
                if isOperator(index: i) {
                    operatorArray.append(string[i])
                }
            }
        } catch ProgramError.invalidInput {
            print("Invalid input! Format should be \"[number] [operator number ...]\". Operators include no other than +,-,x,/,%.")
            exit(1)
        } catch {
            print("Unexpected error!")
            exit(3)
        }
    }
    
    //check for calculation errors
    func calculationErrorHandling() {
        do {
            try print(Calc(i: 0))
        } catch ProgramError.divisionByZero {
            print("Error: Division by 0!")
            exit(2)
        } catch ProgramError.outOfBounds {
            print("Error: Numeric out of bounds!")
            exit(2)
        } catch {
            print("Unexpected error!")
            exit(3)
        }
    }

}
