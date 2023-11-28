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
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    DisplayView(displayValue: viewModel.displayValue)
                    
                    KeyboardView(keys: viewModel.keys) { key in
                        viewModel.buttonClick(key: key)
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
