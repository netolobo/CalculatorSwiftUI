//
//  CalculatorViewModel.swift
//  CalculatorSwiftUI
//
//  Created by Neto Lobo on 25/11/23.
//

import Foundation
import AVFAudio

@Observable
class CalculatorViewModel {
    var keys = Keys.allCases
    var display = "0"
    var audioPlayer: AVAudioPlayer?
    var isBeepOn = true
    
    func buttonClick(key: Keys) {
        Calc.performButtonClick(key: key)
        display = Calc.getDisplay()
    }
}
