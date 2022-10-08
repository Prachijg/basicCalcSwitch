//
//  ViewController.swift
//  BasicCalcSwitch
//
//  Created by APPLE on 08/10/22.
//

import UIKit

class ViewController: UIViewController {
    var numberOnScreen:Double = 0
    var previousNumber:Double = 0
    var performMathOp = false
    var operation = 0
    @IBOutlet weak var calcLabel: UILabel!
    
    @IBAction func operandBtn(_ sender: UIButton) {
        if performMathOp == true{
            calcLabel.text = String(sender.tag-1)
            numberOnScreen = Double(calcLabel.text!)!
            performMathOp = false
            
            
        }
        else{
            calcLabel.text = calcLabel.text! + String(sender.tag-1)
            numberOnScreen = Double(calcLabel.text!)!
        }
    }
    
    @IBAction func operatorBtm(_ sender: UIButton) { if calcLabel.text != "" && sender.tag != 15 && sender.tag != 16{
        previousNumber=Double(calcLabel.text!)!
        switch sender.tag{
        case 11:calcLabel.text="+"
        case 12:calcLabel.text="-"
        case 13:calcLabel.text="/"
        default:calcLabel.text="*"
            
        }
        
        operation = sender.tag
        performMathOp = true
    }
    else if sender.tag == 15//else if statement for equal To Button
    {
        switch operation{
        case 11:calcLabel.text = String(previousNumber+numberOnScreen)
        case 12:calcLabel.text = String(previousNumber-numberOnScreen)
        case 13:calcLabel.text = String(previousNumber/numberOnScreen)
        default:calcLabel.text = String(previousNumber*numberOnScreen)        }
       
        
    }else if sender.tag == 16//clear Button
    {
        calcLabel.text = ""
        previousNumber = 0
        numberOnScreen = 0
        operation = 0
    }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

