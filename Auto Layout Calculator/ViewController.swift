//
//  ViewController.swift
//  Auto Layout Calculator
//
//  Created by Churong Zhang on 12/26/18.
//  Copyright © 2018 Churong Zhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var Display: UILabel!
    
    var operand1 : Double = 0
    var operand2 : Double = 0
    var operator1 : Int = 0
    var stage: Int = 0
    var decimalPoint: Bool = false
    var decimalPointMult: Double = 10
    var negative = 1.0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    @IBAction func NumberPressed(_ sender: UIButton) {
        if stage == 0 || stage == 3{
            if stage == 3
            {
                stage = 0
                operand1 = 0
            }
            if sender.tag == 10
            {
                decimalPoint = true
            }
            else
            {
                if decimalPoint
                {
                    var val = Double(sender.tag) / decimalPointMult
                    val *= negative
                    decimalPointMult *= 10
                    operand1 += val
                    
                }
                else
                {
                    operand1 *= 10
                    let val = Double(sender.tag) * negative
                    operand1 += val
                }
            }
            
        }
        else //if stage == 2
        {
            if sender.tag == 10
            {
                decimalPoint = true
            }
            else
            {
                if decimalPoint
                {
                    var val = Double(sender.tag) / decimalPointMult
                    val *= negative
                    decimalPointMult *= 10
                    operand2 += val
                    
                }
                else
                {
                    operand2 *= 10
                    let val = Double(sender.tag) * negative
                    operand2 += val
                }
            }
            stage = 2
        }
       displayIt()
        
    }
    
    @IBAction func OperatorPressed(_ sender: UIButton) {
        
        if sender.tag == 18
        {
            clear(op1: 0)
            Display.text = "0"
            //displayIt()
        }
        else if sender.tag == 16
        {
            if stage == 2
            {
                operand2 /= 100
            }
            else
            {
                operand1 /= 100
            }
            decimalPoint = true
            displayIt()
        }
        else if sender.tag == 17
        {
            negative *= -1.0
            if stage == 2
            {
                operand2 *= -1
            }
            else
            {
                operand1 *= -1
            }
            displayIt()
        }
        else if sender.tag == 11
        {
            calculate()
            decimalPoint = true
            stage = 1

            displayIt()
            clear(op1: operand1)
            stage = 3
        }
        else
        {
            if stage == 2
            {
                calculate()
                operand2 = 0
                stage = 0
                displayIt()
            }

            operator1 = sender.tag
            decimalPointMult = 10
            decimalPoint = false
            stage = 1
            negative = 1.0
        }
        
    }
    func clear(op1: Double)
    {
        operand1 = op1
        operand2 = 0
        operator1 = 0
        stage = 0
        decimalPoint = false
        decimalPointMult = 10
        negative = 1
    }
    
    func displayIt()
    {
        
//        if stage == 2
//        {
//            if negative == -1 && operand2 == 0
//            {
//                Display.text = "-0"
//            }
//            else if decimalPoint
//            {
//                 Display.text = "\(Int(operand2))"
//            }
//            else
//            {
//                Display.text = "\(operand2)"
//            }
//
//        }
//        else{
//
//            if negative == -1 && operand1 == 0
//            {
//                Display.text = "-0"
//            }
//            else if decimalPoint
//            {
//                Display.text = "\(Int(operand1))"
//            }
//            else
//            {
//                Display.text = "\(operand1)"
//            }
//        }
        
        if decimalPoint
        {
            if stage == 2
            {
                Display.text = "\(operand2)"
            }
            else{
                Display.text = "\(operand1)"
            }
        }
        else
        {
            if stage == 2
            {
                Display.text = "\(Int(operand2))"
            }
            else
            {
                Display.text = "\(Int(operand1))"
            }
        }
    }
    
    func calculate()
    {
        switch operator1 {
        case 12: // add
            operand1 = operand1 + operand2
            break
        case 13: // minus
            operand1 -= operand2
            break
        case 14:
            operand1 *= operand2
            break
        case 15:
            operand1 /= operand2
            break
        default:
            print("reach default on calculate()")
          //  displayIt()
            
            
        }
    }
    
}

