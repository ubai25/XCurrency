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
    
    @AppStorage("convertFrom") var convertFrom: String?
    @AppStorage("convertTo") var convertTo: String?
    
    @State private var selectedCurrency: [String] = currencies[0]
    @State private var search: String = ""
    @State private var iSearch: Bool = false
//    @State private var filteredCurrencies = currencies
    
    var color: Color
    var state: String
    
    var body: some View {
        NavigationView(){
            VStack {
                GroupBox(label: SettingsLabelView(labelText: "Currencies", labelImage: "coloncurrencysign.circle", color: color)){
                    
                    Divider().padding(.vertical, 4)
                    
                    HStack{
                        TextField("Search", text: $search)
                            .padding()
                            .font(.title)
                            .frame(width: UIScreen.screenWidth/1.2, height: UIScreen.screenHeight/18)
                            .background(Color.white)
                            .foregroundColor(color)
                            .cornerRadius(10)
                            .isHidden(false)
//                            .padding(.horizontal, 10)
                    }
                    
                    Text(selectedCurrency[0])
                        .font(.title)
                        .fontWeight(.light)
                        .frame(width: UIScreen.screenWidth/1.2, height: UIScreen.screenHeight/18)
                        .background(Color.white)
                        .foregroundColor(color)
                        .cornerRadius(10)
                        .isHidden(false)
                    
                    Picker("Select your Currency", selection: $selectedCurrency) {
                        ForEach(getCurrencies(state: state), id: \.self) {
                            Text($0[1])
                        }
                    }
                    .background(Color.white)
                    .cornerRadius(10)
                    
                    VStack {
                        
                        Button(action: {
                            
                            if(state == "to"){
                                convertTo = selectedCurrency[1]
                            }else{
                                convertFrom = selectedCurrency[1]
                            }
                            
                            presentationMode.wrappedValue.dismiss()
                            
                        },  label: {
                            Text("Select")
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                .fontWeight(.light)
                                .padding()
                                .foregroundColor(Color(UIColor(contrastingBlackOrWhiteColorOn:UIColor(color), isFlat:true)))
                        })
                        .frame(minWidth: UIScreen.screenWidth/2.5)
    //                    .background(RoundedRectangle(cornerRadius: 20)
    //                                    .strokeBorder(Color.gray, lineWidth: 0.3))
                        .background(color)
                        .cornerRadius(20)
                        .padding()
                        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 6, x: 3, y: 4)
                    }
                    .frame(width: UIScreen.screenWidth/1.2)
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
    
    func getCurrencies(state: String) -> [[String]]{
        if(search.isEmpty || search == ""){
            return currencies
        }else {
            let tempCurr = currencies.filter{
                $0[0].uppercased().contains(search.uppercased()) || $0[1].contains(search.uppercased())
            }
            selectedCurrency = tempCurr[0]
            return tempCurr
        }
    }
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
        CurrencyPickerView(color: Color(UIColor.flatPlum()), state: "to")
    }
}
