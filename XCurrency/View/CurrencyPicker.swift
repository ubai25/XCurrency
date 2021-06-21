//
//  CurrencyPicker.swift
//  XCurrency
//
//  Created by Ahmad Ubaidillah on 20/06/21.
//

import SwiftUI

struct CurrencyPicker: View {
    
    @State var color: Color
    @State var selected: [String]
    
    var body: some View {
        VStack{
            Button(action: {

            }, label: {
                Text(selected[0])
                    .fontWeight(.light)
                    .padding(.horizontal)

                Spacer()

                Image(systemName: "magnifyingglass.circle")
                    .padding(.horizontal, 5)
            })
            .currencyDescStyle(color: color)
            
            Picker("Select your Currency", selection: $selected) {
                ForEach(currencies, id: \.self) {
                    Text($0[1])
                }
            }
            .background(Color.white)
            .cornerRadius(10)
        }
    }
}

struct CurrencyPicker_Previews: PreviewProvider {
    static var previews: some View {
        CurrencyPicker(color: Color.blue, selected: ["Dollar", "USD"])
    }
}
