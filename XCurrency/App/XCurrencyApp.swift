//
//  XCurrencyApp.swift
//  XCurrency
//
//  Created by Ahmad Ubaidillah on 10/06/21.
//

import SwiftUI

@main
struct XCurrencyApp: App {
    @AppStorage("isOnBoarding") var isOnBoarding: Bool = true
    
    @StateObject var globalVar = GlobalVar()
    
    var body: some Scene {
        WindowGroup {
            if isOnBoarding{
                OnBoardingView()
            }else{
                ContentView().environmentObject(globalVar)
            }
        }
    }
}
