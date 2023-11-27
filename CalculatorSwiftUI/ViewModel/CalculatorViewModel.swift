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
    var display = K.zed
    var isBeepOn = true
    var audioPlayer : AVAudioPlayer?
    
    func buttonClick(key: Keys) {
        if key == Keys.beep {
            isBeepOn.toggle()
        }
        
        if isBeepOn {
            Task {
//                await AudioPlayer.play(audioName: "beep", audioExtension:"mp3")
//                await audioPlayer?.playSound(audioName:"beep", audioExtension:"mp3")
//                audioPlayer = await playSound(audioName:"beep", audioExtension:"mp3")
//                audioPlayer?.play()
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
