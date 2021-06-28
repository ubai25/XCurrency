//
//  ContentView.swift
//  XCurrency
//
//  Created by Ahmad Ubaidillah on 10/06/21.
//

import SwiftUI
import ChameleonFramework

struct ContentView: View {
    @StateObject var pickerModel = CurrencyPickerViewModel()
    @StateObject var vmModel = ContenViewModel()
    
    @AppStorage("convertFrom") var convertFrom: String = "USD"
    @AppStorage("convertTo") var convertTo: String = "IDR"
    
    @State var colors: [[Color]] = colorsAvailableArray.shuffled()
    @State var images = currencyImages.shuffled()
    @State var showingPicker = false {
        didSet{
            pickerModel.search = ""
        }
    }
    
    var body: some View {
        ZStack{
            VStack(){
                HeaderView(colors: colors[0], image: images[0], color: colors[0][0])

                ZStack{
                    Text(vmModel.result)
                        .mainTextViewStyle()
                    
                    ProgressView()
                        .scaleEffect(x: 2, y: 2, anchor: .center)
                        .isHidden(vmModel.isLoadingHide)
                }
                .offset(y: -UIScreen.screenHeight/11)
                
                Spacer()
                
                VStack {
                    Button(action: {
                        pickerModel.isCurrencyTo = true
                        showingPicker = true
                    }, label: {
                        Text(convertTo)
                    })
                    .currencySymbolButtonStyle(color: colors[0][1])
                    
                    Button(action: {
                        doSwitch()
                    }, label: {
                        Image(systemName: "repeat.circle.fill")
                            .resizable()
                            .frame(width: UIScreen.screenHeight/15, height: UIScreen.screenHeight/15)
                            .foregroundColor(colors[0][1])
                            .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                    })
                    .padding(UIScreen.screenWidth/30)
                    
                    Button(action: {
                        pickerModel.isCurrencyTo = false
                        showingPicker = true
                    }, label: {
                        Text(convertFrom)
                    })
                    .currencySymbolButtonStyle(color: colors[0][1])
                }
                .offset(y: -UIScreen.screenHeight/18)
                
                VStack{
                    TextField("Amount", text: $vmModel.from)
                        .mainTextViewStyle()
                        .padding(.vertical, UIScreen.screenHeight/50)
                        .keyboardType(.numberPad)
                    Button(action: {
                        convertTo = convertTo
                        convertFrom = convertFrom
                        vmModel.doConvert()
                    },  label: {
                        Text("Convert")
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            .padding()
                            .foregroundColorContrast(color: colors[0][1])
                    })
                    .mainButtonStyle(color: colors[0][1])
                    .alert(isPresented: $vmModel.showingAlert) {
                        Alert(title: Text(vmModel.alertTitle), message: Text(vmModel.alertMessage), dismissButton: .default(Text("Ok")))
                    }
                }
                .offset(y: -UIScreen.screenHeight/25
            )}
        }
        .sheet(isPresented: $showingPicker){
            CurrencyPickerView(pickerViewModel: pickerModel, color: colors[0][1])
        }
        .onTapGesture {
            hideKeyboard()
        }
    } // END OF VIEW
    
    func doSwitch() {
        let temp = convertFrom
        convertFrom = convertTo
        convertTo = temp
        
        let tempArr = pickerModel.selectedTo
        pickerModel.selectedTo = pickerModel.selectedFrom
        pickerModel.selectedFrom = tempArr
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
