//
//  CurrencyPickerView.swift
//  XCurrency
//
//  Created by Ahmad Ubaidillah on 14/06/21.
//

import SwiftUI
import ChameleonFramework

struct CurrencyPickerView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject var contentViewModel: ContenViewModel
    
    @AppStorage("convertFrom") var convertFrom: String?
    @AppStorage("convertTo") var convertTo: String?
    
    @State private var search: String = ""
    @State private var iSearch: Bool = false
    
    var color: Color
    
    var body: some View {
        NavigationView(){
            VStack {
                GroupBox(label:
                            HStack {
                                Text("Currencies".uppercased())
                                    .fontWeight(.regular)
                                Spacer()
                                Image(systemName: "coloncurrencysign.circle")
                            }
                            .foregroundColor(color)
                ){
                    
                    Divider().padding(.vertical, 4)
                    
                    ZStack{
                        VStack{
                            Text(contentViewModel.selectedTo[0])
                                .fontWeight(.light)
                                .currencyDescStyle(color: color)
                            
                            Picker("Select your Currency", selection: $contentViewModel.selectedTo) {
                                ForEach(currencies, id: \.self) {
                                    Text($0[1])
                                }
                            }
                            .background(Color.white)
                            .cornerRadius(10)
                        }
                        .isHidden(contentViewModel.isCurrencyFrom)
                        
                        VStack {
                            Text(contentViewModel.selectedFrom[0])
                                .fontWeight(.light)
                                .currencyDescStyle(color: color)
                            
                            Picker("Select your Currency", selection: $contentViewModel.selectedFrom) {
                                ForEach(currencies, id: \.self) {
                                    Text($0[1])
                                }
                            }
                            .background(Color.white)
                            .cornerRadius(10)
                        }
                        .isHidden(contentViewModel.isCurrencyTo)
                    }
                    
                    VStack {
                        
                        Button(action: {
                            contentViewModel.doSelect()
                            presentationMode.wrappedValue.dismiss()
                        },  label: {
                            Text("Select")
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                .fontWeight(.light)
                                .padding()
                                .foregroundColorContrast(color: color)
                        })
                        .mainButtonStyle(color: color)
                    }
                    .frame(maxWidth: UIScreen.screenWidth/1.2)
                    .background(Color.white)
                    .cornerRadius(10)
                    .padding(.vertical, 20)
                }
                .navigationBarItems(trailing: Button(action:{
                    presentationMode.wrappedValue.dismiss()
                }){
                    Image(systemName: "xmark")
                })
                .padding()
                
            }
        }
    }
    
//    func getCurrencies() -> [[String]]{
//
//        if(search.isEmpty || search == ""){
//            return currencies
//        }else {
//            let tempCurr = currencies.filter{
//                $0[0].uppercased().contains(search.uppercased()) || $0[1].contains(search.uppercased())
//            }
//
//            if(tempCurr.count<1){
//                return [["Result Not Found", ""]]
//            }
//
//            globalVar.selectedCurrency = tempCurr[0]
//            return tempCurr
//        }
//    }
}

struct CurrencyPickerView_Previews: PreviewProvider {
    static var previews: some View {
        CurrencyPickerView(contentViewModel: ContenViewModel(), color: Color(UIColor.flatPlum()))
    }
}
