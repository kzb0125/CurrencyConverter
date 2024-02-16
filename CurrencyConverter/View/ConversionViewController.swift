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
        displayConversion()
    }
    
    func displayConversion() {
        toggleSwitchView()
        currencyFormat.currencyCode = "USD"
        valueUSD.text = currencyFormat.string(from: (usd!) as NSNumber)
        currencyFormat.currencyCode = "EUR"
        valueEUR.text = (eur != -1) ? currencyFormat.string(from: (eur!) as NSNumber) : "Max Value Exceeded"
        currencyFormat.currencyCode = "KRW"
        valueKRW.text = (krw != -1) ? currencyFormat.string(from: (krw!) as NSNumber) : "Max Value Exceeded"
        currencyFormat.currencyCode = "GBP"
        valueGBP.text = (gbp != -1) ? currencyFormat.string(from: (gbp!) as NSNumber) : "Max Value Exceeded"
        currencyFormat.currencyCode = "JPY"
        valueJPY.text = (jpy != -1) ? currencyFormat.string(from: (jpy!) as NSNumber) : "Max Value Exceeded"
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
