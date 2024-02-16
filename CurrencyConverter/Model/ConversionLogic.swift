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
    
    mutating func calculateConversion(_ usdValue: String) -> [Int] {
        
        usd = Int(usdValue)!
        gbp = (Double(usd) * CurrencyConstants.USD_TO_GBP).toInt()!
        eur = (Double(usd) * CurrencyConstants.USD_TO_EUR).toInt()!
        jpy = (Double(usd) * CurrencyConstants.USD_TO_JPY).toInt()!
        krw = (Double(usd) * CurrencyConstants.USD_TO_KRW).toInt()!
        return [usd, eur, krw, gbp, jpy]
    }
}

extension Double {
    func toInt() -> Int? {
        let minInt = Double(Int.min)
        let maxInt = Double(Int.max)

        guard case minInt ... maxInt = self else {
            return -1
        }
        
        return Int(self)
    }
}
