//
//  Calc.swift
//  CalculatorSwiftUI
//
//  Created by Neto Lobo on 26/11/23.
//

import Foundation

struct Calc {
    private static var currentNumber: Double = 0
    private static var previousNumber: Double = 0
    private static var display: String = Const.zed
    private static var previousOperation: Operation?
    private static var currentOperation: Operation?
    private static var stillTyping: Bool = true
    private static var divisionByZeroError = false
    
    static func basicOperation(_ operation: Operation) {
        if display != Const.error {
            performOperation()
            updateCurrentOperation(operation)
            updatePreviousNumber(currentNumber)
            updateStillTyping(false)
        }
    }
    
    static private func updateStillTyping(_ answer: Bool) {
        self.stillTyping = answer
    }
    
    static private func updateCurrentOperation(_ operation: Operation) {
        self.currentOperation = operation
    }
    
    private static func updatePreviousOperation(_ operation: Operation) {
        self.previousOperation = operation
    }
    
    static private func updatePreviousNumber(_ number: Double) {
        self.previousNumber = number
    }
    
    static private func updateCurrentNumber(_ num: Double){
        self.currentNumber = num
    }
    
    private static func updateDisplay(_ value: String){
        self.display = formatLargeNumber(value)
    }
    
    static func getDisplay() -> String {
        return self.display
    }
    
    private static func setScreenNumber(number: String) {
        var currentDisplayNumber = number
        if display != Const.zed && stillTyping && display != Const.error {
            currentDisplayNumber = display+number
        }
        if isValidInput(currentDisplayNumber) {
            updateDisplay(currentDisplayNumber)
            updateCurrentNumber(Double(currentDisplayNumber)!)
            updateStillTyping(true)
        }
    }
    
    private static func percentage() {
        if (currentNumber != 0) {
            updateCurrentNumber(currentNumber / 100.0)
            updateDisplay("\(currentNumber)")
        }
    }
    
    private static func negativePositive() {
        var result = currentNumber
        if currentNumber < 0 {
            result =  -currentNumber
        } else if currentNumber > 0 {
            result = currentNumber - currentNumber - currentNumber
        }
        updateCurrentNumber(result)
        updateDisplay("\(result)")
    }
    
    private static func point() {
        if !display.contains(Const.dot) && display != Const.error {
            self.display += Const.dot
            updateStillTyping(true)
        }
        if display == Const.error {
            self.display = Const.zed+Const.dot
            updateStillTyping(true)
        }
    }
    
    private static func equals() {
        performOperation()
    }
    
    private static func aC() {
        reset()
    }
    
    private static func reset() {
        resetCurrentNumber()
        resetCurrentOperation()
        resetDisplay()
    }
    
    private static func resetCurrentNumber() {
        self.currentNumber = 0
    }
    
    private static func resetCurrentOperation() {
        self.currentOperation = nil
        updateStillTyping(true)
    }
    
    
    
    private static func resetDisplay() {
        self.display = Const.zed
    }
    
    private static func performOperation() {
        if currentOperation != nil {
            let tempPreviousNumber = previousNumber
            var tempCurrentNumber = currentNumber
            var tempPreviousOperation = previousOperation
            switch currentOperation {
            case .add:
                tempCurrentNumber = previousNumber+currentNumber
                tempPreviousOperation = .add
                break
            case .subtract:
                tempCurrentNumber = previousNumber-currentNumber
                tempPreviousOperation = .subtract
                break
            case .multiply:
                tempCurrentNumber = previousNumber*currentNumber
                tempPreviousOperation = .multiply
                break
            default :
                if(currentNumber == 0) {
                    divisionByZeroError = true
                }
                if(!divisionByZeroError) {
                    tempCurrentNumber = previousNumber/currentNumber
                    tempPreviousOperation = .divide
                }
                break
            }
            if(!divisionByZeroError) {
                updateCurrentNumber(tempCurrentNumber)
                updatePreviousNumber(tempPreviousNumber)
                updatePreviousOperation(tempPreviousOperation!)
                updateDisplay("\(currentNumber)")
            } else {
                display = Const.error
                divisionByZeroError = false
            }
            resetCurrentOperation()
        }
    }
    
    static func performButtonClick(key: Keys) {
        switch key {
        case Keys.zero:
            setScreenNumber(number: Keys.zero.rawValue)
            break
        case Keys.one:
            setScreenNumber(number: Keys.one.rawValue)
            break
        case Keys.two:
            setScreenNumber(number: Keys.two.rawValue)
            break
        case Keys.three:
            setScreenNumber(number: Keys.three.rawValue)
            break
        case Keys.four:
            setScreenNumber(number: Keys.four.rawValue)
            break
        case Keys.five:
            setScreenNumber(number: Keys.five.rawValue)
            break
        case Keys.six:
            setScreenNumber(number: Keys.six.rawValue)
            break
        case Keys.seven:
            setScreenNumber(number: Keys.seven.rawValue)
            break
        case Keys.eight:
            setScreenNumber(number: Keys.eight.rawValue)
            break
        case Keys.nive:
            setScreenNumber(number: Keys.nive.rawValue)
            break
        case Keys.point:
            point()
            break
        case Keys.equal:
            equals()
            break
        case Keys.add:
            basicOperation(.add)
            break
        case Keys.subtract:
            Calc.basicOperation(.subtract)
            break
        case Keys.multiply:
            basicOperation(.multiply)
            break
        case Keys.divide:
            basicOperation(.divide)
            break
        case Keys.percent:
            percentage()
            break
        case Keys.positiveNegative:
            negativePositive()
            break
        case Keys.beep:
            break
        default:
            aC()
            break
        }
    }
    
}
