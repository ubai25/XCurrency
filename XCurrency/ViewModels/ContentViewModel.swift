//
//  ContentViewModel.swift
//  XCurrency
//
//  Created by Ahmad Ubaidillah on 19/06/21.
//

import SwiftUI
import SwiftyJSON

class ContenViewModel: ObservableObject{
    @AppStorage("convertFrom") var convertFrom = String()
    @AppStorage("convertTo") var convertTo = String()
    
    @Published var isCurrencyFrom: Bool = false
    @Published var isCurrencyTo: Bool = true
    @Published var searchCurrency = String()
    @Published var selectedFrom: [String] = currencies[149]
    @Published var selectedTo: [String] = currencies[62]
    @Published var isLoadingHide = true
    @Published var result: String = "0.00"
    @Published var from: String = "0"
    @Published var showingAlert = false
    @Published var showingPicker = false
    @Published var alertTitle: String = "Error"
    @Published var alertMessage: String = "Something is wrong"
    
    func getPosts() {
        isLoadingHide = false
        result = ""
        
        guard let url = URL(string: "https://api.exchangerate.host/latest?base=\(convertFrom)&amount=\(from)&symbols=\(convertTo)&places=2") else { return}
        
        print(url)
        
        URLSession.shared.dataTask(with: url) { [self] (data, resp, err) in
            
            let weatherJSON : JSON = JSON(data as Any)
            
            let convertResult: Double = Double("\(weatherJSON["rates"][convertTo])") ?? -10.00
            
            if convertResult != -10.00 {
                DispatchQueue.main.async {
                    self.result = "\(weatherJSON["rates"][convertTo])"
                }
            }else{
                self.result = "0.00"
                showingAlert = true
            }
            
            DispatchQueue.main.async {
                isLoadingHide = true
            }
            print(self.result)
            
        }.resume()
    }
    
    func doConvert() {
        if let valid = Int(from) {
            if valid <= 0 {
                alertTitle = "Invalid Request"
                alertMessage = "Amount cannot less than 1"
                showingAlert = true
            }else{
                getPosts()
            }
        } else {
            alertTitle = "Invalid Request"
            alertMessage = "Invalid Amount"
            showingAlert = true
        }
    }
    
    func doSelect() {
        if(isCurrencyTo){
            convertTo = selectedTo[1]
        }
        
        if(isCurrencyFrom){
            convertFrom = selectedFrom[1]
        }
    }
    
    func changeCurrencyTo() {
        isCurrencyTo = true
        isCurrencyFrom = false
        showingPicker = true
    }
    
    func changeCurrencyfrom() {
        isCurrencyFrom = true
        isCurrencyTo = false
        showingPicker = true
    }
    
    func switchCurrencies() {
        let temp = convertFrom
        convertFrom = convertTo
        convertTo = temp
        
        let tempArr = selectedTo
        selectedTo = selectedFrom
        selectedFrom = tempArr
    }
}