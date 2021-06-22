//
//  CurrencyPickerViewModel.swift
//  XCurrency
//
//  Created by Ahmad Ubaidillah on 20/06/21.
//

import SwiftUI

class CurrencyPickerViewModel: ObservableObject {
    @AppStorage("convertFrom") var convertFrom = String()
    @AppStorage("convertTo") var convertTo = String()
    
    @Published var selectedFrom: [String] = currencies[149]
    @Published var selectedTo: [String] = currencies[62]
    @Published var isCurrencyTo: Bool = true
    @Published var listOfCurrency = currencies
    @Published var isDataNotFound = false
    @Published var search: String = ""
    {
        didSet{
            DispatchQueue.main.async { [self] in
                if(search.isEmpty || search == ""){
                    listOfCurrency = currencies
                    isDataNotFound = false
                }else {
                    let tempCurr = currencies.filter{
                        $0[0].uppercased().contains(search.uppercased()) || $0[1].contains(search.uppercased())
                    }

                    if(tempCurr.count<1){
                        isDataNotFound = true
                        listOfCurrency = [["No data Found","No Data"]]
                    }else{

                        if(isCurrencyTo){
                            selectedTo = tempCurr[0]
                        }else{
                            selectedFrom = tempCurr[0]
                        }

                        listOfCurrency = tempCurr
                        isDataNotFound = false
                    }
                }
            }
        }
    }
    
    func doSelect() {
        if(isCurrencyTo){
            convertTo = selectedTo[1]
        }else{
            convertFrom = selectedFrom[1]
        }
        
        search = ""
    }
}
