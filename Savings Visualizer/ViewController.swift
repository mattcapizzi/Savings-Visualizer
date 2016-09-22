//
//  ViewController.swift
//  Savings Visualizer
//
//  Created by Matt Kapp on 3/2/16.
//  Copyright © 2016 mKappDesign. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var txtYearlyIncome: UITextField!
    @IBOutlet weak var sldPercentSaved: UISlider!

    @IBOutlet weak var lblPercent: UILabel!
    @IBOutlet weak var lblWeeklySaved: UILabel!
    @IBOutlet weak var lblMonthlySaved: UILabel!
    @IBOutlet weak var lblYearlySaved: UILabel!
    @IBOutlet weak var lbl25YearsSaved: UILabel!
    
    var yearlyIncomeString = ""
    var yearlyIncomeFloat : Float = 0.0
    var percent : Float = 0.0
    
    var weeklySaved : Float = 0.0
    var monthlySaved : Float = 0.0
    var yearlySaved : Float = 0.0
    var saved25Years : Float = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func sldPercentSavedAction(_ sender: UISlider) {
        takeInData()
        calculate()
    }
    
    @IBAction func btnCalculateACTION(_ sender: UIButton) {
        takeInData()
        calculate()
    }
    
    @IBAction func btnClearACTION(_ sender: UIButton) {
        clear()
    }
    
    
    func takeInData(){
//        put placeholder number in so that app doesnt crash
        if txtYearlyIncome.text == "" {
            txtYearlyIncome.text = "50000"
        }
        
        yearlyIncomeString = txtYearlyIncome.text!
        yearlyIncomeFloat = Float(yearlyIncomeString)!
        
        percent = sldPercentSaved.value
    }
    
    func calculate(){
        yearlySaved = yearlyIncomeFloat * percent
        monthlySaved = yearlySaved / 12
        weeklySaved = yearlySaved / 52
        saved25Years = yearlySaved * 25
        
        
        print()
    }
    
    func print(){
        percent = percent * 100
        
        let sPercent = String(format: "%0.0f", percent)
        let sWeekly = String(format: "%0.2f", weeklySaved)
        let sMonthly = String(format: "%0.2f", monthlySaved)
        let sYearly = String(format: "%0.2f", yearlySaved)
        let save25Years = String(format: "%0.2f", saved25Years)
        
        lblPercent.text = "\(sPercent) %"
        lblWeeklySaved.text = "$ \(sWeekly)"
        lblMonthlySaved.text = "$ \(sMonthly)"
        lblYearlySaved.text = "$ \(sYearly)"
        lbl25YearsSaved.text = "$ \(save25Years)"
    }
    
    func clear(){
        txtYearlyIncome.text = ""
        lblWeeklySaved.text = "$$$$"
        lblMonthlySaved.text = "$$$$"
        lblYearlySaved.text = "$$$$"
        lbl25YearsSaved.text = "$$$$"
    }
    
    func hideKeyboard(){
        txtYearlyIncome.resignFirstResponder()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        hideKeyboard()
    }
    
}

