//
//  CurrencyPickerView.swift
//  XCurrency
//
//  Created by Ahmad Ubaidillah on 14/06/21.
//

import SwiftUI

struct CurrencyPickerView: View {
    @State private var selectedCurrency: [String] = currencies[0]
    
    var body: some View {
        VStack {
            Text("\(selectedCurrency[0])")
                .font(.title2)
            
            Picker("Select your Currency", selection: $selectedCurrency) {
                ForEach(currencies, id: \.self) {
                    Text($0[1])
                }
            }
            
            
        }
    }
}

struct CurrencyPickerView_Previews: PreviewProvider {
    static var previews: some View {
        CurrencyPickerView()
    }
}
