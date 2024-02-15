//
//  ViewConversionViewController.swift
//  CurrencyConverter
//
//  Created by Baik on 2/14/24.
//

import UIKit

class ConversionViewController: UIViewController {

    @IBOutlet weak var valueUSD: UILabel!
    @IBOutlet weak var valueEUR: UILabel!
    @IBOutlet weak var valueKRW: UILabel!
    @IBOutlet weak var valueGBP: UILabel!
    @IBOutlet weak var valueJPY: UILabel!
    
    
    var usd: String = ""
    var eur: String = ""
    var krw: String = ""
    var gbp: String = ""
    var jpy: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        valueUSD.text = "\(usd)"
        valueEUR.text = "\(eur)"
        valueKRW.text = "\(krw)"
        valueGBP.text = "\(gbp)"
        valueJPY.text = "\(jpy)"
        
    }
    
    
    
    
    // Hide views that have been switched off .isHidden = true
    
    
}
