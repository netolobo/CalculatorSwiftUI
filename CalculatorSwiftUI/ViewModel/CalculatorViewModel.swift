//
//  CalculatorViewModel.swift
//  CalculatorSwiftUI
//
//  Created by Neto Lobo on 25/11/23.
//

import Foundation
import AVFAudio
import SwiftUI

@MainActor 
class CalculatorViewModel : ObservableObject{
    @Published var keys = Keys.allCases
    @AppStorage(Const.displayKey) var displayValue = Const.zed
    @AppStorage(Const.isBeepOnKey)  var isBeepOn = true
    @Published var audioPlayer : AVAudioPlayer?
    
    init() {
        Task { audioPlayer = await AudioPlayer.playSound(audioName: Const.audioName, audioExtension: Const.audioExtension) }
    }
    
    func buttonClick(key: Keys) {
        if key == Keys.beep {
            isBeepOn.toggle()
        }
        
        if isBeepOn {
            beep()
        }
        
        Calc.performButtonClick(key: key)
        displayValue = Calc.getDisplay()
    }
    
    private func beep() {
        audioPlayer?.play()
    }
    
    
}
