//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Mark Kenneth Bayona on 7/26/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var perPerson: String?
    var numberOfPeople: String?
    var tipPercentage: String?
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        totalLabel.text = perPerson
        settingsLabel.text = "Split between \(numberOfPeople!) people, with \(tipPercentage!) tip"
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
