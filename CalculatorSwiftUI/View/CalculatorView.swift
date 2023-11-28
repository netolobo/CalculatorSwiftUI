//
//  ContentView.swift
//  CalculatorSwiftUI
//
//  Created by Neto Lobo on 25/11/23.
//

import SwiftUI
import AVFAudio

struct CalculatorView: View {
    @StateObject private var viewModel = CalculatorViewModel()
    
    
    let gridItems = [
           GridItem(.flexible()),
           GridItem(.flexible()),
           GridItem(.flexible()),
           GridItem(.flexible())
    ]

    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    ZStack {

                        RoundedRectangle(cornerRadius: 25.0)
                            .fill(.green.opacity(0.4))
                            .frame(height: 120)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                        
                        Text(viewModel.display)
                            .font(.custom(Const.customFontName, size: 70))
                            .fontWeight(.black)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .padding(.trailing, 10)
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 25))
                    
                    
                    LazyVGrid(columns: gridItems) {
                        ForEach(viewModel.keys, id: \.self) { key in
                            Button {
                                viewModel.buttonClick(key: key)
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
            .navigationTitle(Const.appName)
            .padding(.horizontal)
        }
    }
    

}

#Preview {
    CalculatorView()
}
