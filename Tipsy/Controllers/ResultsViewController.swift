//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Antonio Gil Sánchez on 12/02/2020.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var total: String?
    var numberOfPeople : String?
    var tipPercentage : String?

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = total!
        settingsLabel.text = "Split between \(numberOfPeople!) people, with \(String(describing: tipPercentage!))% tip."
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
