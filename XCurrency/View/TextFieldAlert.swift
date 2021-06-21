//
//  TextFieldAlert.swift
//  XCurrency
//
//  Created by Ahmad Ubaidillah on 20/06/21.
//

import SwiftUI

struct TextFieldAlert: View {
    var body: some View {
        VStack(spacing: 10){
            Text("\(UIScreen.screenHeight)")
            Text("\(UIScreen.screenWidth)")
        }
        .frame(width: UIScreen.screenWidth/1.25, height: UIScreen.screenHeight/5, alignment: .center)
        .background(Color.yellow)
        .cornerRadius(25)
        .padding()
    }
}

struct TextFieldAlert_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldAlert()
    }
}
