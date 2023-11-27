//
//  AudioPlayer.swift
//  CalculatorSwiftUI
//
//  Created by Neto Lobo on 27/11/23.
//

import Foundation
import AVFAudio

struct AudioPlayer {
    static func playSound(audioName: String, audioExtension: String) async -> AVAudioPlayer? {
        var audioPlayer: AVAudioPlayer
        
        guard let soundURL = Bundle.main.url(forResource: audioName, withExtension: audioExtension) else {
            print("Sound file not found")
            return nil
        }
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
            return audioPlayer
        } catch {
            print("Error playing sound: \(error.localizedDescription)")
            return nil
        }
    }
}
