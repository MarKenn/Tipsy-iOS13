//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    var tip: Double = 0.20
    var split: Double = 2
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    @IBOutlet var tipButtons: [UIButton]!
    
    @IBAction func tipChanged(_ sender: UIButton) {
        for btn in tipButtons {
            btn.isSelected = btn == sender
        }
        
        let tipString = sender.currentTitle?.dropLast() ?? "20"
        
        tip = Double(tipString)! / 100
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        split = sender.value
        splitNumberLabel.text = String(format: "%.0f", split)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        print(split)
    }

}

