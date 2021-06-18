//
//  ContentView.swift
//  XCurrency
//
//  Created by Ahmad Ubaidillah on 10/06/21.
//

import SwiftUI
import ChameleonFramework
import SwiftyJSON

struct ContentView: View {
    @EnvironmentObject var globalVar: GlobalVar
    
    @AppStorage("convertFrom") var convertFrom: String = "USD"
    @AppStorage("convertTo") var convertTo: String = "IDR"
    
    @State private var result: String = "0.00"
    @State private var from: String = "0"
    @State private var showingAlert: Bool = false
    @State private var showingPicker: Bool = false
    @State private var isLoadingHide: Bool = true
    @State var alertTitle: String = "Something is Wrong"
    @State var alertMessage: String = "Something is Wrong"
    @State var colors: [[Color]] = colorsAvailableArray.shuffled()
    @State var images = currencyImages.shuffled()
    
    var test = "aha"
    
    var body: some View {
        ZStack{
            VStack(){
                HeaderView(colors: colors[0], image: images[0], color: colors[0][0])

                ZStack{
                    Text(result)
                        .mainTextViewStyle()
                    
                    ProgressView()
                        .scaleEffect(x: 2, y: 2, anchor: .center)
                        .isHidden(isLoadingHide)
                }
                .offset(y: -UIScreen.screenHeight/11)
                
                Spacer()
                
                VStack {
                    Button(action: {
                        changeCurrencyTo()
                    }, label: {
                        Text(convertTo)
                    })
                    .currencySymbolButtonStyle(color: colors[0][1])
                    
                    Button(action: {
                        switchCurrencies()
                        
                    }, label: {
                        Image(systemName: "repeat.circle.fill")
                            .resizable()
                            .frame(width: UIScreen.screenHeight/15, height: UIScreen.screenHeight/15)
                            .foregroundColor(colors[0][1])
                            .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                    })
                    .padding(UIScreen.screenWidth/30)
                    
                    Button(action: {
                        changeCurrencyfrom()
                    }, label: {
                        Text(convertFrom)
                    })
                    .currencySymbolButtonStyle(color: colors[0][1])
                }
                .offset(y: -UIScreen.screenHeight/18)
                
                VStack{
                    TextField("Amount", text: $from)
                    .mainTextViewStyle()
                    .padding(.vertical, UIScreen.screenHeight/50)
                    
                    Button(action: {
                        doConvert()
                    },  label: {
                        Text("Convert")
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            .padding()
                            .foregroundColorContrast(color: colors[0][1])
                    })
                    .mainButtonStyle(color: colors[0][1])
                    .alert(isPresented: $showingAlert) {
                        Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .default(Text("Ok")))
                            }
                }
                .offset(y: -UIScreen.screenHeight/25
            )}
        }
        .sheet(isPresented: $showingPicker){
            CurrencyPickerView(color: colors[0][1])
        }
    } // END OF VIEW
    
    
    // MARK: FUNCTIONS
    
    func changeCurrencyTo() {
        globalVar.isCurrencyTo = true
        globalVar.isCurrencyFrom = false
        showingPicker = true
    }
    
    func changeCurrencyfrom() {
        globalVar.isCurrencyFrom = true
        globalVar.isCurrencyTo = false
        showingPicker = true
    }
    
    func switchCurrencies() {
        let temp = convertFrom
        convertFrom = convertTo
        convertTo = temp
        
        let tempArr = globalVar.selectedTo
        globalVar.selectedTo = globalVar.selectedFrom
        globalVar.selectedFrom = tempArr
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
    
    func getPosts() {
        isLoadingHide = false
        result = ""
        
        guard let url = URL(string: "https://api.exchangerate.host/latest?base=\(convertFrom)&amount=\(from)&symbols=\(convertTo)&places=2") else { return}
        
        print(url)
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            
            let weatherJSON : JSON = JSON(data as Any)
            
            let convertResult: Double = Double("\(weatherJSON["rates"][convertTo])") ?? -10.00
            
            if convertResult != -10.00 {
                self.result = "\(weatherJSON["rates"][convertTo])"
            }else{
                self.result = "0.00"
                showingAlert = true
            }
            
            isLoadingHide = true
            print(self.result)
            
        }.resume()
    }
}

//Custom Shape
struct CustomShape : Shape {
    var corner : UIRectCorner
    var radii : CGFloat
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corner, cornerRadii: CGSize(width: radii, height: radii))
        
        return Path(path.cgPath)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

class GlobalVar: ObservableObject{
    @Published var isCurrencyFrom: Bool = false
    @Published var isCurrencyTo: Bool = true
    @Published var searchCurrency: String = ""
    @Published var selectedFrom: [String] = currencies[149]
    @Published var selectedTo: [String] = currencies[62]
}
