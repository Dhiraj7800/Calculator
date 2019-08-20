//
//  ViewController.swift
//  Calculator
//
//  Created by Dhiraj on 18/08/19.
//  Copyright © 2019 Dhiraj. All rights reserved.
//

import UIKit
import Expression

class ViewController: UIViewController {
    
    @IBOutlet weak var enteredNumber: UILabel!
    var inputString: String = ""
    var i = 0
    @IBAction func buttonPress(_ sender: UIButton) {
        let tag = sender.tag
        if tag != 11 && tag != 12 && tag != 13 && tag != 14 && tag != 15 && tag != 16 && tag != 17 &&
            tag != 18 && tag != 19 && tag != 20{
            let firstword = self.enteredNumber.text
            if tag == 1 && firstword?.first == "0" && firstword?.count == 1{
                self.enteredNumber.text = String("0")
                inputString.append("0")
            }
                
            else {
                if firstword == "0"{
                    self.enteredNumber.text = String(tag-1)
                    inputString.append(String(tag-1))
                }
                else {
                    self.enteredNumber.text = firstword! + String(tag-1)
                    inputString.append(firstword! + String(tag-1))
                }
            }
        }
        if tag == 11 { // CE
            let number = self.enteredNumber.text!
            if number.dropLast().isEmpty {
                
                self.enteredNumber.text = "0"
               inputString.append("0")
                //self.setText(text: "0")

            }
            else {
                self.enteredNumber.text = String(number.dropLast())
                inputString.append(String(number.dropLast()))
            }
        }
        
        if tag == 12 { // CL
            self.enteredNumber.text = String(0)
            inputString.append(String(0))

        }
        if tag == 13 { // % modulus
            
            if  self.removePreviousOperator(){
                self.setText(text: "%")
            }
            else {
                self.setText(text: "%")
            }
            
        }
        if tag == 14 { // / division
            
            if  self.removePreviousOperator(){
                self.setText(text: "/")
            }
            else {
                self.setText(text: "/")
            }
            
        }
        if tag == 15 { // ^ power
            
            if  self.removePreviousOperator(){
                self.setText(text: "^")
            }
            else {
                self.setText(text: "^")
            }
            
        }
        if tag == 16 { // * multiply
            
            if  self.removePreviousOperator(){
                self.setText(text: "*")

            }
            else {
                self.setText(text: "*")
            }
            
            
        }
        if tag == 17 { // - minus
            
            if  self.removePreviousOperator(){
                 self.setText(text: "-")
            }
            else {
                 self.setText(text: "-")
            }
            
            
            
        }
        if tag == 18 { // + plus
            if  self.removePreviousOperator(){
                self.setText(text: "+")
            }
            else {
                self.setText(text: "+")
            }
        }
        if tag == 19 { // .
            
            if  self.removePreviousOperator(){
                self.setText(text: ".")
            }
            else {
                self.setText(text: ".")
            }
            
            
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func setText(text:String)  {
        
        self.enteredNumber.text = self.enteredNumber.text! + text

    }
    func removePreviousOperator() -> Bool {
        let lastword = self.enteredNumber.text?.last
        if lastword == "%"  ||
            lastword == "/" ||
            lastword == "^" ||
            lastword == "*" ||
            lastword == "-" ||
            lastword == "+" ||
            lastword == "."
        {
            self.enteredNumber.text = String((self.enteredNumber.text?.dropLast())!)
            return true
        }
        else
        {
            return false
        }
    }
    @IBAction func startCalculation(_ sender: UIButton) {
        let inputNumbers = self.enteredNumber.text!
        let expression = Expression(inputNumbers)
        let result = try! expression.evaluate()
        // round of upto 2 digits
        let roundOf = Double(round(100*result)/100)
         self.enteredNumber.text = String(roundOf)
    }
    
}

