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
            isFinishedTypingNumber == true
    
    }

    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        //What should happen when a number is entered into the keypad
        // currentTitle is a get only, and can't be set, it also is a String? which means it's an optional String, and it "may be nil" which can crash the app. We need to handle it in an if statement.
        if let numValue = sender.currentTitle {
            if isFinishedTypingNumber == true {
                displayLabel.text = numValue
                isFinishedTypingNumber == false
            } else { // isFinishedTypingNumber == false
                displayLabel.text = displayLabel.text! + numValue // appending addl values into the display label
            }
            
        }
        
    }

}

