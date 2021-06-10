//
//  OnBoardingView.swift
//  XCurrency
//
//  Created by Ahmad Ubaidillah on 10/06/21.
//

import SwiftUI

struct OnBoardingView: View {
    var imagesName: [String] = currencyImages.shuffled()
    var colors : [[Color]] = colorsAvailableArray.shuffled()
    var wording = welcomingWords
    
    var body: some View {
        TabView {
            ForEach(0..<3) { item in
                WelcomingCardView(imageName: imagesName[item], wording: wording[item], colors: colors[item])
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .padding(.vertical, 20)
    }
}

struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
    }
}
