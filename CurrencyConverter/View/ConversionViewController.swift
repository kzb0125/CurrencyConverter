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
    
    let currencyFormatter = NumberFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currencyFormatter.numberStyle = .currency
        currencyFormatter.maximumFractionDigits = 0
        
        currencyFormatter.currencyCode = "USD"
        valueUSD.text = currencyFormatter.string(from: (usd ?? 0) as NSNumber)
        currencyFormatter.currencyCode = "EUR"
        valueEUR.text = currencyFormatter.string(from: (eur ?? 0) as NSNumber)
        currencyFormatter.currencyCode = "KRW"
        valueKRW.text = currencyFormatter.string(from: (krw ?? 0) as NSNumber)
        currencyFormatter.currencyCode = "GBP"
        valueGBP.text = currencyFormatter.string(from: (gbp ?? 0) as NSNumber)
        currencyFormatter.currencyCode = "JPY"
        valueJPY.text = currencyFormatter.string(from: (jpy ?? 0) as NSNumber)
    }
    
    @IBAction func returnPressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    // Hide views that have been switched off .isHidden = true
    
    
}
