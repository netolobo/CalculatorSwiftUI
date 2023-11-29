//
//  Keys.swift
//  CalculatorSwiftUI
//
//  Created by Neto Lobo on 25/11/23.
//

import Foundation
import SwiftUI


enum Keys: String, CaseIterable {
    
    case c = "C"
    case positiveNegative = "±"
    case percent = "%"
    case divide = "÷"
    
    case seven = "7"
    case eight = "8"
    case nive = "9"
    case multiply = "x"
    
    case four = "4"
    case five = "5"
    case six = "6"
    case subtract = "-"
    
    case one = "1"
    case two = "2"
    case three = "3"
    case add = "+"
    
    case beep = "🎵"
    case zero = "0"
    case point = "."
    case equal = "="
    

    func getBackground() -> Color {
        switch self {
            
        case .beep:
            return .purple
            
        case .c:
                return .orange
         
            //numbers
        case .point:
            return .gray
        case .zero:
            return .gray
        case .one:
            return .gray
        case .two:
            return .gray
        case .three:
            return .gray
        case .four:
            return .gray
        case .five:
            return .gray
        case .six:
            return .gray
        case .seven:
            return .gray
        case .eight:
            return .gray
        case .nive:
            return .gray
            
            //operations
        case .divide:
            return .mint
        case .percent:
            return .mint
        case .positiveNegative:
            return .mint
        case .subtract:
            return .mint
        case .add:
            return .mint
        case .multiply:
            return .mint
        
        default://equals
            return .pink
        }
    }
}
