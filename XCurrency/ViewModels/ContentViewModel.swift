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
    
    @Published var searchCurrency = String()
    @Published var isLoadingHide = true
    @Published var showingAlert = false
    
    var result: String = "0.00"
    var from: String = "0"
    var alertTitle: String = "Error"
    var alertMessage: String = "Something is wrong"
    
    func getPosts() {
        isLoadingHide = false
        result = ""
        
        guard let url = URL(string: "https://api.exchangerate.host/latest?base=\(convertFrom)&amount=\(from)&symbols=\(convertTo)&places=2") else { return}
        
        print(url)
        
        URLSession.shared.dataTask(with: url) { [self] (data, resp, err) in
            
            let weatherJSON : JSON = JSON(data as Any)
            
            print("\(weatherJSON["rates"][convertTo])")
            
            let convertResult: Double = Double("\(weatherJSON["rates"][convertTo])") ?? -10.00
            
            if convertResult != -10.00 {
                DispatchQueue.main.async {
                    self.result = "\(weatherJSON["rates"][convertTo])"
                }
            }else{
                DispatchQueue.main.async {
                    self.result = "0.00"
                    alertTitle = "Request Error"
                    alertMessage = "Please check your internet connection"
                    showingAlert = true
                }
            }
            
            DispatchQueue.main.async {
                isLoadingHide = true
            }
//            print(self.result)
            
        }.resume()
    }
    
    func doConvert() {
        if(from.starts(with: "0")){
            from.remove(at: from.startIndex)
        }
        
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
}
