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

        guard let url = URL(string:"https://api.apilayer.com/exchangerates_data/convert?to=\(convertTo)&from=\(convertFrom)&amount=\(from)") else { return }
        print(url)
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("IcvRfef8EnuCxuoUyfYdr8qAjAHM3mVL", forHTTPHeaderField: "apikey")
        
        URLSession.shared.dataTask(with: request){ [weak self] (data, resp, err) in
            
            let currencyJSON : JSON = JSON(data as Any)
            
            let convertResult: Double = Double("\(currencyJSON["result"])") ?? -10.00
            
            if convertResult != -10.00 {
                DispatchQueue.main.async {
                    self?.result = "\(convertResult)"
                }
            }else{
                DispatchQueue.main.async {
                    self?.result = "0.00"
                    self?.alertTitle = "Request Error"
                    self?.alertMessage = "Please check your internet connection"
                    self?.showingAlert = true
                }
            }
            
            DispatchQueue.main.async {
                self?.isLoadingHide = true
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
