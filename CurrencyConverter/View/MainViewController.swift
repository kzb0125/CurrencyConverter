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
    
    //
    var conversionLogic = ConversionLogic()
    var valueUSD: Int = 0
    var conversionArr: [Int]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func switchCurrency(_ sender: UISwitch) {
        conversionLogic.setSwitch(sender.layer.name ?? "", sender.isOn)
    }
    
    @IBAction func calculateConversion(_ sender: UIButton) {
        
        // input error check
        do {
            valueUSD = try checkInput()
            print(valueUSD)
            conversionArr = conversionLogic.calculateConversion(inputUSD.text!)
            self.performSegue(withIdentifier: "toConversionView", sender: self)
        } catch InputError.InputEmpty(let reason) {
            print(reason)
        } catch InputError.InvalidType(let reason) {
            print(reason)
        } catch {
            print("Unknown Error")
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "toConversionView" {
            let navigation = segue.destination as! ConversionViewController
            
            
        }
    }
    
    func checkInput() throws -> Int {
        // checks that input is not empty
        guard let checkInput = inputUSD.text, !checkInput.isEmpty else {
            throw InputError.InputEmpty(reason: "Empty Input: Enter Amount")
        }
        // checks if input is an integer
        guard Int(inputUSD.text!) is Int else {
            throw InputError.InvalidType(reason: "Value must be an Integer")
        }
        return Int(inputUSD.text!)!
    }
    
    enum InputError: Error {
        case InvalidType(reason: String)
        case InputEmpty(reason: String)
    }
}

