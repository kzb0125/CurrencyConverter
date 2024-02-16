//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Baik on 2/14/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var inputUSD: UITextField!
    @IBOutlet weak var switchEUR: UISwitch!
    @IBOutlet weak var switchKRW: UISwitch!
    @IBOutlet weak var switchGBP: UISwitch!
    @IBOutlet weak var switchJPY: UISwitch!
   
    var conversionLogic = ConversionLogic()
    var valueUSD: Int = 0
    var conversionArr: [Int]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inputUSD.becomeFirstResponder()
    }
    
    
    @IBAction func switchCurrency(_ sender: UISwitch) {
        conversionLogic.setSwitch(sender.accessibilityIdentifier! ?? "", sender.isOn)
    }
    
    @IBAction func calculateConversion(_ sender: UIButton) {
        
        // input error check
        do {
            valueUSD = try checkInput()
            conversionArr = conversionLogic.calculateConversion(inputUSD.text!)
            self.performSegue(withIdentifier: "toConversionView", sender: self)
        } catch InputError.InputEmpty(let reason) {
            inputUSD.text = reason
        } catch InputError.InvalidType(let reason) {
            inputUSD.text = reason
        } catch InputError.MaxValue(let reason) {
            inputUSD.text = reason
        } catch InputError.NegativeValue(let reason) {
            inputUSD.text = reason
        } catch {
            inputUSD.text = "Unknown Error"
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "toConversionView" {
            let navigation = segue.destination as! ConversionViewController
            navigation.usd = conversionArr?[0]
            navigation.eur = conversionArr?[1]
            navigation.krw = conversionArr?[2]
            navigation.gbp = conversionArr?[3]
            navigation.jpy = conversionArr?[4]
            navigation.switchStatus = conversionLogic.switchCurr
        }
    }
    
    func checkInput() throws -> Int {
        // checks that input is not empty
        guard let checkInput = inputUSD.text, !checkInput.isEmpty else {
            throw InputError.InputEmpty(reason: "Enter Value in USD")
        }
        // checks if input is an integer
        guard UInt(inputUSD.text!) is UInt else {
            throw InputError.InvalidType(reason: "Integer Values Only")
        }
        // checks maximum integer value
        guard UInt(inputUSD.text!)! <= Int.max else {
            throw InputError.MaxValue(reason: "Max Value Exceeded")
        }
        // checks for positive value
        guard Int(inputUSD.text!)! > 0 else {
            throw InputError.NegativeValue(reason: "Positive Values Only")
        }
        return Int(inputUSD.text!)!
    }
    
    enum InputError: Error {
        case InvalidType(reason: String)
        case InputEmpty(reason: String)
        case MaxValue(reason: String)
        case NegativeValue(reason: String)
    }
    
    

}

