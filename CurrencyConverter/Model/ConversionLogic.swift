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
        do {
            eur = try valueCheck(Double(usd) * CurrencyConstants.USD_TO_EUR)
            krw = try valueCheck(Double(usd) * CurrencyConstants.USD_TO_KRW)
            gbp = try valueCheck(Double(usd) * CurrencyConstants.USD_TO_GBP)
            jpy = try valueCheck(Double(usd) * CurrencyConstants.USD_TO_JPY)
        } catch InputError.MaxValue(let reason) {
            print(reason)
        } catch {
            print("Unknown Error")
        }
        return [usd, eur, krw, gbp, jpy]
    }
    
    func valueCheck(_ value: Double) throws -> Int {
        var returnValue: Int?
        // check that value is less than maximum integer value
        guard value.toInt() != nil else {
            returnValue = -1
            throw InputError.MaxValue(reason: "Max Int Value Exceeded")
        }
        returnValue = (returnValue != -1) ? value.toInt() : -1
        return returnValue!
    }
    
    enum InputError: Error {
        case MaxValue(reason: String)
    }
    
}

extension Double {
    func toInt() -> Int? {
        let minInt = Double(Int.min)
        let maxInt = Double(Int.max)

        guard case minInt ... maxInt = self else {
            return nil
        }

        return Int(self)
    }
}
