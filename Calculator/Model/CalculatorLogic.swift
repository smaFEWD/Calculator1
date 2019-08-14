//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Sandi Ma on 8/13/19.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import Foundation

class CalculatorLogic {
    var number: Double
    
    init(number: Double){
        //self.number -- this "current class"
        self.number = number
    }
    
    func calculate(symbol: String) -> Double? {
        if symbol == "+/-" {
            // global variable "displayValue" is refactoring the below line
            return number * -1
        } else if symbol == "AC" {
            return 0
        } else if symbol == "%" {
            return number * 0.01
        }
        return nil 
    }
}
