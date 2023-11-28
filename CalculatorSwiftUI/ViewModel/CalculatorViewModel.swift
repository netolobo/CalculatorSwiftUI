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
    @AppStorage("display") var display = Const.zed
    @AppStorage("isBeepOn")  var isBeepOn = true
    @Published var audioPlayer : AVAudioPlayer?
    
    func buttonClick(key: Keys) {
        if key == Keys.beep {
            isBeepOn.toggle()
        }
        
        if isBeepOn {
            Task {
                await beep()
                
            }
        }
        Calc.performButtonClick(key: key)
        display = Calc.getDisplay()
    }
    
    private func beep() async {
        audioPlayer = await AudioPlayer.playSound(audioName: "beep", audioExtension: "mp3")
        audioPlayer?.play()
    }
    
    
}
