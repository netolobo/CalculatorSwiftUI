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
                        withAnimation {
                            viewModel.buttonClick(key: key)
                        }
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Text(Const.appName)
                        .font(.custom(Const.appFontName, size: Const.navigationTitleFontSize))
                }
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    CalculatorView()
}
