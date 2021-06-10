//
//  WelcomingCardView.swift
//  XCurrency
//
//  Created by Ahmad Ubaidillah on 10/06/21.
//

import SwiftUI
import ChameleonFramework

struct WelcomingCardView: View {
    var imageName : String
    var wording : String
    var colors : [Color]
    
    // MARK: - PROPERTIES
    @State private var isAnimating: Bool = false
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                Text("XCurrency")
                    .foregroundColor(Color(UIColor(contrastingBlackOrWhiteColorOn:UIColor(colors[0]), isFlat:true)).opacity(0.75))
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 2, x: 2, y: 2)
                    .padding()
                
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200, alignment: .center)
                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 8, x: 6, y: 8)
                    .scaleEffect(isAnimating ? 1.0 : 0.6)
                    .padding()
                
                Text(wording)
                    .foregroundColor(Color(UIColor(contrastingBlackOrWhiteColorOn:UIColor(colors[1]), isFlat:true)).opacity(0.75))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 16)
                    .frame(maxWidth: 480)
                    .padding()
                
                StartButtonView()
                    .padding()
            }
        }
        .onAppear{
            withAnimation(.easeOut(duration: 0.5)){
                isAnimating = true
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxHeight: .infinity, alignment: .center)
        .background(LinearGradient(gradient: Gradient(colors: colors), startPoint: .top, endPoint: .bottom))
        .cornerRadius(20)
        .padding(.horizontal, 20)
    }
}

struct WelcomingCardView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomingCardView(imageName: currencyImages[0], wording: welcomingWords[0], colors: colorsAvailableArray[5])
    }
}
