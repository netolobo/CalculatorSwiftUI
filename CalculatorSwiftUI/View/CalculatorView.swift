//
//  ContentView.swift
//  CalculatorSwiftUI
//
//  Created by Neto Lobo on 25/11/23.
//

import SwiftUI

struct CalculatorView: View {
    @State var viewModel = CalculatorViewModel()
    private let columns = [GridItem(.adaptive(minimum: 80))]
    
    var body: some View {
        ZStack {
            VStack {
                Text("0")
                    .frame(height: 90)
                    .frame(maxWidth: .infinity)
                    .font(.system(size: 45))
                    .fontWeight(.bold)
                    .background(.green.opacity(0.4))
                    .clipShape(RoundedRectangle(cornerRadius: 25))
                    .padding(.horizontal, 10)
                
                LazyVGrid(columns: columns) {
                    ForEach(viewModel.keys, id: \.self) { key in
                        Button {
                            
                        } label: {
                            Text(key.rawValue)
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .fontDesign(.rounded)
                                .padding(25)
                                .foregroundStyle(.white)
                                .background(key.getBackground())
                                .clipShape(Circle())
                            
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    CalculatorView()
}
