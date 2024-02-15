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
    
    
    var usd: Int?
    var eur: Int?
    var krw: Int?
    var gbp: Int?
    var jpy: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        valueUSD.text = String(usd ?? 0)
        valueEUR.text = String(eur ?? 0)
        valueKRW.text = String(krw ?? 0)
        valueGBP.text = String(gbp ?? 0)
        valueJPY.text = String(jpy ?? 0)
        
    }
    
    @IBAction func returnPressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    // Hide views that have been switched off .isHidden = true
    
    
}
