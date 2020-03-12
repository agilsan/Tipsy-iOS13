//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var totalAmount : Double?
    var tipSelected : String = "10%"
    
    var tipBrain = TipBrain()
    
    @IBAction func tipChanged(_ sender: UIButton) {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        sender.isSelected = true
        tipSelected = sender.currentTitle!
        tipSelected.removeLast()
        
        billTextField.endEditing(true)
    }
    
    @IBAction func steppedValueChanged(_ sender: UIStepper) {
        let steppedValue = sender.value
        splitNumberLabel.text = String(format: "%.0f", steppedValue)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let percentage = tipSelected
        let bill = Double(billTextField.text!) ?? 0
        let people = splitNumberLabel.text!
        
        tipBrain.calculateTips(tipPercentage: Double(percentage)!, bill: bill, people: Int(people) ?? 2)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToRecalculate" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.total = tipBrain.getTotalBill()
            destinationVC.numberOfPeople = splitNumberLabel.text!
            destinationVC.tipPercentage = tipSelected
        }
    }
    
}

