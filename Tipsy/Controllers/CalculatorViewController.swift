//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    var selectedTipString: String? = "20%"
    var split: Double = 2
    var perPerson: String = ""
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    @IBOutlet var tipButtons: [UIButton]!
    
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        for btn in tipButtons {
            btn.isSelected = btn == sender
        }
        
        selectedTipString = sender.currentTitle
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        split = sender.value
        splitNumberLabel.text = String(format: "%.0f", split)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let billTotal = Double(billTextField.text ?? "0")!
        let tipString = selectedTipString?.dropLast() ?? "20"
        let tip = Double(tipString)! / 100
        
        let perPersonValue = (billTotal + (billTotal*tip)) / split
        perPerson = String(format: "%.2f", perPersonValue)
        
        performSegue(withIdentifier: "showResults", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showResults" {
            if let destinationVC = segue.destination as? ResultsViewController {
                destinationVC.perPerson = perPerson
                destinationVC.numberOfPeople = String(format: "%.0f", split)
                destinationVC.tipPercentage = selectedTipString
            }
        }
    }
}

