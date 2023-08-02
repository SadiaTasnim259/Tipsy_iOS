//
//  ViewController.swift
//  Tipsy
//
//  Created by Sadia on 1/8/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var zeroButton: UIButton!
    @IBOutlet weak var tenButton: UIButton!
    @IBOutlet weak var twentyButton: UIButton!
    @IBOutlet weak var ChoosedPersonLabel: UILabel!
    
    var selectedTipPercentage : Double = 0.1
    var choosedPersonNumber : Double = 2.0
    var tipPercentage: String = "10%"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tenButton.configuration?.background.backgroundColor = UIColor.systemGreen
        tenButton.configuration?.baseForegroundColor = UIColor.white

    }
    
    @IBAction func tipPersentageButton(_ sender: UIButton) {
        
        tipPercentage = sender.titleLabel?.text ?? ""
        
        inputTextField.endEditing(true)
        resetAllTipButton()
        
        sender.configuration?.background.backgroundColor = UIColor.systemGreen
        sender.configuration?.baseForegroundColor = UIColor.white
        
        selectedTipPercentage = Double(sender.tag)/100
      
    }
    
    func resetAllTipButton(){
        tenButton.configuration?.background.backgroundColor = UIColor.clear
        tenButton.configuration?.baseForegroundColor = UIColor.systemGreen
        
        twentyButton.configuration?.background.backgroundColor = UIColor.clear
        twentyButton.configuration?.baseForegroundColor = UIColor.systemGreen
        
        zeroButton.configuration?.background.backgroundColor = UIColor.clear
        zeroButton.configuration?.baseForegroundColor = UIColor.systemGreen
    }
    
    @IBAction func numberOfPersonStepper(_ sender: UIStepper) {
        choosedPersonNumber  = sender.value
        ChoosedPersonLabel.text = String(Int(sender.value))
        
        inputTextField.endEditing(true)
    }
    func calculateTip()-> Double{
        guard let bill = inputTextField.text, !bill.isEmpty else{
            return 0.0
        }
        
        guard let doubleBill = Double(bill) else{
            return 0.0
        }
        
        let perPersonBill = doubleBill / choosedPersonNumber
        let perPersonTip = perPersonBill * selectedTipPercentage
        let totalBillWithTip = perPersonBill + perPersonTip
        
        return totalBillWithTip
        
    }
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        
        guard let bill = inputTextField.text, !bill.isEmpty else{
            self.showToast(message: "Please Enter Bill", bottomPadding: 120)
            return
        }
        
        let resultViewController = self.storyboard?.instantiateViewController(withIdentifier: "ResultViewController") as! ResultViewController
        resultViewController.tip = calculateTip()
        resultViewController.personNumber = Int(choosedPersonNumber)
        resultViewController.tipPercentages = tipPercentage
               
                
        self.navigationController?.pushViewController(resultViewController, animated: true)
    }
    
    @IBAction func dismiskeyboard(_ sender: UITapGestureRecognizer) {
        inputTextField.endEditing(true)
    }
}

