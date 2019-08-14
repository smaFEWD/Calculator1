//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2018.
//  Copyright © 2018 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    private var isFinishedTypingNumber : Bool = true
    
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        //What should happen when a non-number button is pressed
            isFinishedTypingNumber = true
        // need to turn it into a Double from a String, but it will produce an optional Double, which means it "may be nil" which can crash the app.
        // can use a force unwrap (!), an if/let (optional binding), or a guard/let
        // using a guard/let allows us to have a fatalerror with a descriptive message
        
        guard let number = Double(displayLabel.text!) else {
            fatalError("Cannot convert a display label text to a Double")
        }
        
        if let calcMethod = sender.currentTitle {
            if calcMethod == "+/-" {
                displayLabel.text = String(number * -1)
            } else if calcMethod == "AC" {
                displayLabel.text = "0"
            } else if calcMethod == "%" {
                displayLabel.text = String(number * 0.01)
            }
        }
    
    }

    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        //What should happen when a number is entered into the keypad
        // currentTitle is a get only, and can't be set, it also is a String? which means it's an optional String, and it "may be nil" which can crash the app. We need to handle it in an if statement.
        if let numValue = sender.currentTitle {
            if isFinishedTypingNumber == true {
                displayLabel.text = numValue
                isFinishedTypingNumber = false
            } else { // isFinishedTypingNumber == false
                if numValue == "." {
                    guard let currentDisplayValue = Double(displayLabel.text!) else {
                        fatalError("Cannot convert display label text to a double")
                    }
                    // floor will round down. So floor(8.1) is 8 and compared to 8, it will be false
                    // but if you floor(8) and compare that to 8, then it's true
                    let isInt = floor(currentDisplayValue) == Double(displayLabel.text!)
                    // so if we dont' have an integer (which is !isInt)--which means it's "false" then we want to return, and not append numValue to the display
                    if !isInt {
                        return
                    }
                }
                displayLabel.text = displayLabel.text! + numValue // appending addl values into the display label
            }
            
        }
        
    }

}

