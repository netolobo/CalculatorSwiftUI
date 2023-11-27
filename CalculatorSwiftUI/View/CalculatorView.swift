//
//  ContentView.swift
//  CalculatorSwiftUI
//
//  Created by Neto Lobo on 25/11/23.
//

import SwiftUI
import AVFoundation

struct CalculatorView: View {
    @State var viewModel = CalculatorViewModel()
    @State var audioPlayer: AVAudioPlayer?
    @State var isBeepOn = true
    
    let gridItems = [
           GridItem(.flexible()),
           GridItem(.flexible()),
           GridItem(.flexible()),
           GridItem(.flexible())
    ]
    

    
    var body: some View {
        ZStack {
            VStack {
                Text("0")
                    .frame(height: 90)
                    .frame(maxWidth: .infinity)
                    .font(.custom("Calculator", size: 60))
                    .fontWeight(.black)
                    .background(.green.opacity(0.4))
                    .clipShape(RoundedRectangle(cornerRadius: 25))
                    .padding(.horizontal, 10)
                    .multilineTextAlignment(.trailing)
                
                LazyVGrid(columns: gridItems) {
                    ForEach(viewModel.keys, id: \.self) { key in
                        Button {
                            
                            
                            
                            if key == Keys.beep {
                                isBeepOn.toggle()
                            }
                            
                            if isBeepOn {
                                Task {
                                    await playSound()
                                }
                            }
                            
                         
                            
                        } label: {
                            Text(key.rawValue)
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .fontDesign(.rounded)
                                .padding(25)
                                .foregroundStyle(.white)
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .background(key.getBackground())
                                .clipShape(Circle())
                        }
                        
                    }
                }
            }
        }
    }
    
    func playSound() async {
            guard let soundURL = Bundle.main.url(forResource: "beep", withExtension: "mp3") else {
                print("Sound file not found")
                return
            }

            do {
                audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
                audioPlayer?.play()
            } catch {
                print("Error playing sound: \(error.localizedDescription)")
            }
        }
}

// Sound Effect by <a href="https://pixabay.com/users/edr-1177074/?utm_source=link-attribution&utm_medium=referral&utm_campaign=music&utm_content=8333">EdR</a> from <a href="https://pixabay.com//?utm_source=link-attribution&utm_medium=referral&utm_campaign=music&utm_content=8333">Pixabay</a>

#Preview {
    CalculatorView()
}
