//
//  KeyboardView.swift
//  CalculatorSwiftUI
//
//  Created by Neto Lobo on 27/11/23.
//

import SwiftUI

struct KeyboardView: View {
    let keys : [Keys]
    let buttonClick: (Keys) -> Void
    let gridItems = [
           GridItem(.flexible()),
           GridItem(.flexible()),
           GridItem(.flexible()),
           GridItem(.flexible())
    ]
    
    var body: some View {
        LazyVGrid(columns: gridItems) {
            ForEach(keys, id: \.self) { key in
                Button {
                    buttonClick(key)
                } label: {
                    Text(key.rawValue)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .fontDesign(.rounded)
                        .padding(Const.keyPadding)
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(key.background)
                        .clipShape(RoundedRectangle(cornerRadius: Const.defaultRadius))
                }
            }
        }
    }
}

#Preview {
    KeyboardView(keys: Keys.allCases, buttonClick: {_ in })
}
