//
//  DisplayView.swift
//  CalculatorSwiftUI
//
//  Created by Neto Lobo on 27/11/23.
//

import SwiftUI

struct DisplayView: View {
    var displayValue : String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: Const.defaultRadius)
                .fill(.green.opacity(Const.displayOpacity))
                .frame(height: Const.displayHeight)
                .frame(maxWidth: .infinity, alignment: .trailing)
            
            Text(displayValue)
                .font(.custom(Const.displayFontName, size: Const.displayFontSize))
                .fontWeight(.black)
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.trailing, Const.displayPadding)
        }
        .clipShape(RoundedRectangle(cornerRadius: Const.defaultRadius))
    }
}

#Preview {
    DisplayView(displayValue: "38")
}
