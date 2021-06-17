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
    @EnvironmentObject var globalVar: GlobalVar
    
    @AppStorage("convertFrom") var convertFrom: String?
    @AppStorage("convertTo") var convertTo: String?
    
//    @State private var selectedCurrency: [String] = currencies[0]
    @State private var search: String = ""
    @State private var iSearch: Bool = false
    
    var color: Color
    
    var body: some View {
        NavigationView(){
            VStack {
                GroupBox(label: SettingsLabelView(labelText: "Currencies", labelImage: "coloncurrencysign.circle", color: color)){
                    
                    Divider().padding(.vertical, 4)
                    
                    ZStack{
                        VStack{
                            Text(globalVar.selectedTo[0])
                                .font(.title2)
                                .fontWeight(.light)
                                .frame(maxWidth: UIScreen.screenWidth/1.2, minHeight: UIScreen.screenHeight/18)
                                .background(Color.white)
                                .foregroundColor(color)
                                .cornerRadius(10)
                            
                            Picker("Select your Currency", selection: $globalVar.selectedTo) {
                                ForEach(currencies, id: \.self) {
                                    Text($0[1])
                                }
                            }
                            .background(Color.white)
                            .cornerRadius(10)
                        }
                        .isHidden(globalVar.isCurrencyFrom)
                        
                        
                        VStack {
                            Text(globalVar.selectedFrom[0])
                                .font(.title2)
                                .fontWeight(.light)
                                .frame(maxWidth: UIScreen.screenWidth/1.2, minHeight: UIScreen.screenHeight/18)
                                .background(Color.white)
                                .foregroundColor(color)
                                .cornerRadius(10)
                            
                            Picker("Select your Currency", selection: $globalVar.selectedFrom) {
                                ForEach(currencies, id: \.self) {
                                    Text($0[1])
                                }
                            }
                            .background(Color.white)
                            .cornerRadius(10)
                        }
                        .isHidden(globalVar.isCurrencyTo)
                    }
                    
                    VStack {
                        
                        Button(action: {
                            
                            if(globalVar.isCurrencyTo){
                                convertTo = globalVar.selectedTo[1]
                            }
                            
                            if(globalVar.isCurrencyFrom){
                                convertFrom = globalVar.selectedFrom[1]
                            }
                            
                            presentationMode.wrappedValue.dismiss()
                            
                        },  label: {
                            Text("Select")
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                .fontWeight(.light)
                                .padding()
                                .foregroundColor(Color(UIColor(contrastingBlackOrWhiteColorOn:UIColor(color), isFlat:true)))
                        })
                        .frame(width: 240)
                        .background(color)
                        .cornerRadius(20)
                        .padding()
                        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 6, x: 3, y: 4)
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

struct SettingsLabelView: View {
    var labelText: String
    var labelImage: String
    var color: Color
    
    var body: some View {
        HStack {
            Text(labelText.uppercased())
                .fontWeight(.regular)
            Spacer()
            Image(systemName: labelImage)
        }
        .foregroundColor(color)
    }
}

extension View {
    @ViewBuilder func isHidden(_ hidden: Bool) -> some View {
        if hidden {
            self.hidden()
        } else {
            self
        }
    }
}


struct CurrencyPickerView_Previews: PreviewProvider {
    static var previews: some View {
        CurrencyPickerView(color: Color(UIColor.flatPlum()))
    }
}
