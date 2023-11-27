//
//  String+FormatNumber.swift
//  CalculatorSwiftUI
//
//  Created by Neto Lobo on 26/11/23.
//

import Foundation

private func formatNumber(_ number: String) -> String {
    let formatter = NumberFormatter()
    formatter.maximumFractionDigits = K.maximumDecimalDigits
    formatter.decimalSeparator = K.dot
    
    if let numberValue = Double(number) {
        if let formattedString = formatter.string(from: NSNumber(value: numberValue)) {
            return formattedString
        }
    }
    
    return number
}

func formatLargeNumber(_ input: String) -> String {
    if let number = Double(input), number >= 9999999999 {
        return String(format: "%.0e", number)
    } else {
        return formatNumber(input)
    }
}

func isValidInput(_ input: String) -> Bool{
    if input.contains(K.dot) && input.count > 10{
        return false
    }
    
    if !input.contains(K.dot) && input.count > 9 {
        return false
    }
    return true
}
