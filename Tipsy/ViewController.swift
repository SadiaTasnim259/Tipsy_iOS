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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    
    @IBAction func tipPersentageButton(_ sender: UIButton) {
        inputTextField.endEditing(true)
        resetAllTipButton()
        
        sender.configuration?.background.backgroundColor = UIColor.systemGreen
        sender.configuration?.baseForegroundColor = UIColor.white
        
        var selectedTipPercentage = sender.titleLabel?.text
        
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
        var choosedPersonNumber  = Int(sender.value)
        ChoosedPersonLabel.text = String(choosedPersonNumber)
        
        inputTextField.endEditing(true)
    }
    
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        
    }
    
    
    
    @IBAction func dismiskeyboard(_ sender: UITapGestureRecognizer) {
        inputTextField.endEditing(true)
    }
}

