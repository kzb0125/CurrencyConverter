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
    
    @IBOutlet weak var viewEUR: UIStackView!
    @IBOutlet weak var viewKRW: UIStackView!
    @IBOutlet weak var viewGBP: UIStackView!
    @IBOutlet weak var viewJPY: UIStackView!
    
    var usd: Int?
    var eur: Int?
    var krw: Int?
    var gbp: Int?
    var jpy: Int?
    
    var switchStatus = [String : Bool]()
    
    let currencyFormat: NumberFormatter = {
        let currencyFormatter = NumberFormatter()
        currencyFormatter.numberStyle = .currency
        currencyFormatter.maximumFractionDigits = 0
        return currencyFormatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(switchStatus)
        displayConversion()
    }
    
    func displayConversion() {
        toggleSwitchView()
        currencyFormat.currencyCode = "USD"
        valueUSD.text = currencyFormat.string(from: (usd ?? 0) as NSNumber)
        currencyFormat.currencyCode = "EUR"
        valueEUR.text = currencyFormat.string(from: (eur ?? 0) as NSNumber)
        currencyFormat.currencyCode = "KRW"
        valueKRW.text = currencyFormat.string(from: (krw ?? 0) as NSNumber)
        currencyFormat.currencyCode = "GBP"
        valueGBP.text = currencyFormat.string(from: (gbp ?? 0) as NSNumber)
        currencyFormat.currencyCode = "JPY"
        valueJPY.text = currencyFormat.string(from: (jpy ?? 0) as NSNumber)
    }
    
    @IBAction func returnPressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    // Hide views that have been switched off .isHidden = true
    func toggleSwitchView() {
        for (country, isOn) in switchStatus {
            switch (country) {
            case "switchEUR":
                viewEUR.isHidden = !isOn
            case "switchKRW":
                viewKRW.isHidden = !isOn
            case "switchGBP":
                viewGBP.isHidden = !isOn
            case "switchJPY":
                viewJPY.isHidden = !isOn
            default:
                break;
            }
        }
    }
    
    
}
