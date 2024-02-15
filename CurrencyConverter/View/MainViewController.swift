//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Baik on 2/14/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var inputUSD: UITextField!
    
    //
    var conversionLogic = ConversionLogic()
    var preConAmt: Int = 0
    var postConAmt: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func switchCurrency(_ sender: UISwitch) {
        conversionLogic.setSwitch(sender.title!, sender.isOn)
    }
    
    @IBAction func calculateConversion(_ sender: UIButton) {
        conversionLogic.calculateConversion(inputUSD.text)
    }
    

}

