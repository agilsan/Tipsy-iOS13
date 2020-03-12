//
//  TipBrain.swift
//  Tipsy
//
//  Created by Antonio Gil Sánchez on 13/02/2020.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct TipBrain {
    var tip : Tip?
    
    func getTotalBill() -> String {
        return String(format: "%.2f", tip?.totalBill ?? 0)
    }
    
    func getNumberOfPeople() -> String {
        return String(tip?.numberOfPeople ?? 2)//
    }
    
    func getTipPercentage() -> String {
        return String(tip?.tipPercentage ?? 10)
    }
    
    mutating func calculateTips(tipPercentage: Double, bill: Double, people: Int) {
        let tipPercent : Double = tipPercentage / 100
        let totalAmount : Double = ((bill * tipPercent) + bill) / Double(people)
        
        tip = Tip(totalBill: totalAmount, numberOfPeople: people, tipPercentage: Int(tipPercentage))
    }
}
