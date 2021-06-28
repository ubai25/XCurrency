//
//  Extentions.swift
//  XCurrency
//
//  Created by Ahmad Ubaidillah on 18/06/21.
//

import SwiftUI
import ChameleonFramework

extension UIScreen{
   static let screenWidth = UIScreen.main.bounds.size.width
   static let screenHeight = UIScreen.main.bounds.size.height
   static let screenSize = UIScreen.main.bounds.size
}

extension View {
    @ViewBuilder func isHidden(_ hidden: Bool) -> some View {
        if hidden {
            self.hidden()
        } else {
            self
        }
    }
    
    @ViewBuilder func currencyDescStyle(color: Color) -> some View {
        self.font(.title3)
            .frame(minHeight: UIScreen.screenHeight/18)
            .background(Color.white)
            .foregroundColor(color)
            .cornerRadius(10)
    }
    
    @ViewBuilder func mainButtonStyle(color: Color) -> some View {
        self.frame(width: 240)
            .background(color)
            .cornerRadius(20)
            .padding()
            .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 6, x: 3, y: 4)
    }
    
    @ViewBuilder func foregroundColorContrast(color: Color) -> some View {
        self.foregroundColor(Color(UIColor(contrastingBlackOrWhiteColorOn:UIColor(color), isFlat:true)))
    }
    
    @ViewBuilder func mainTextViewStyle() -> some View {
        self.padding(.all)
            .frame(maxWidth: .infinity, minHeight: UIScreen.screenHeight/10.0, alignment: .center)
            .background(Color.white)
            .cornerRadius(30)
            .padding(.horizontal, UIScreen.screenWidth/10)
            .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 8, x: 6, y: 8)
            .font(.title)
    }
    
    @ViewBuilder func currencySymbolButtonStyle(color: Color) -> some View {
        self.pickerStyle(MenuPickerStyle())
            .padding(.all)
            .frame(minWidth: UIScreen.screenWidth/3)
            .background(Color.white)
            .cornerRadius(/*@START_MENU_TOKEN@*/20.0/*@END_MENU_TOKEN@*/)
            .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 6, x: 2, y: 3)
            .foregroundColor(color)
            .font(.title)
    }
    
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
