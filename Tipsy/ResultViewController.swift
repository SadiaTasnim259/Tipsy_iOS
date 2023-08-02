//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Sadia on 1/8/23.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var tipDisplayLabel: UILabel!
    @IBOutlet weak var tipDiscriptionLabel: UILabel!
    
    var tip:Double = 0.0
    var personNumber = 0
    var tipPercentages = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tipDisplayLabel.text = String(format: "%.2f", tip)
        tipDiscriptionLabel.text = "Split between \(personNumber) people, with \(tipPercentages) tip."
        
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
    }
    
   

}
