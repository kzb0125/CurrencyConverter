//
//  ConversionLogic.swift
//  CurrencyConverter
//
//  Created by Baik on 2/14/24.
//

import Foundation

struct ConversionLogic {
    
    var usd: Int = 0
    var eur: Int = 0
    var krw: Int = 0
    var gbp: Int = 0
    var jpy: Int = 0
    
    var switchCurr = ["switchEUR": true,
                      "switchKRW": true,
                      "switchGBP": true,
                      "switchJPY": true]
    
    mutating func setSwitch(_ switchName: String, _ switchValue: Bool) {
        
        if switchValue {
            switchCurr[switchName] = true
        } else {
            switchCurr[switchName] = false
        }
    }
    
    mutating func calculateConversion(_ usdValue: String) {
        
        usd = Int(usdValue)!
        eur = Int(Double(usd) * CurrencyConstants.USD_TO_EUR)
        krw = Int(Double(usd) * CurrencyConstants.USD_TO_KRW)
        gbp = Int(Double(usd) * CurrencyConstants.USD_TO_GBP)
        jpy = Int(Double(usd) * CurrencyConstants.USD_TO_JPY)
        
    }
    
    
    
}
