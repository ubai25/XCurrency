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
    @State var alertTitle: String = "Something is Wrong"
    @State var alertMessage: String = "Something is Wrong"
    
    var colors: [[Color]] = colorsAvailableArray.shuffled()
    var images = currencyImages.shuffled()
    
    var body: some View {
        ZStack{
            VStack(){
                HStack{
                    HStack{
                        VStack(alignment:.leading){
                            Text("Hi!").bold().font(.largeTitle).foregroundColor(Color(UIColor(contrastingBlackOrWhiteColorOn:UIColor(colors[0][0]), isFlat:true)))
                            Text("Welcome To XCurrency").font(.title).foregroundColor(Color(UIColor(contrastingBlackOrWhiteColorOn:UIColor(colors[0][0]), isFlat:true)))
                        }
                        Spacer()
                        
                        Image(images[0])
                            .resizable()
                            .frame(width: UIScreen.screenHeight/8, height: UIScreen.screenHeight/8)
                            .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 8, x: 6, y: 8)
                        
                    }
                    .offset(y: UIScreen.screenHeight/50)
                }
                .frame(height: UIScreen.screenHeight/5)
                .padding(UIScreen.screenWidth/14)
                .background(LinearGradient(gradient: Gradient(colors: colors[0]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .clipShape(CustomShape(corner: .bottomRight, radii: 40))
                .offset(y: -UIScreen.screenHeight/17)

                Text(result)
                    .padding(.all)
                    .frame(maxWidth: .infinity, minHeight: UIScreen.screenHeight/10, alignment: .center)
                    .background(Color.white)
                    .cornerRadius(30)
                    .padding(.horizontal, UIScreen.screenWidth/10)
                    .offset(y: -UIScreen.screenHeight/11)
                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 8, x: 6, y: 8)
                    .font(.title)
                
                Spacer()
                
                VStack {
                    Button(action: {
                        globalVar.currencyFrom = false
                        showingPicker = true
                    }, label: {
                        Text(convertTo)
                    })
                    .pickerStyle(MenuPickerStyle())
                    .padding(.all)
                    .frame(minWidth: UIScreen.screenWidth/3)
                    .background(Color.white)
                    .cornerRadius(/*@START_MENU_TOKEN@*/20.0/*@END_MENU_TOKEN@*/)
                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 6, x: 2, y: 3)
                    .foregroundColor(colors[0][1])
                    .font(.title)
                    
                    Button(action: {
                        let temp = convertFrom
                        self.convertFrom = self.convertTo
                        self.convertTo = temp
                    }, label: {
                        Image(systemName: "repeat.circle.fill")
                            .resizable()
                            .frame(width: UIScreen.screenHeight/15, height: UIScreen.screenHeight/15)
                            .foregroundColor(colors[0][1])
                            .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                    })
                    .padding(UIScreen.screenWidth/30)
                    
                    Button(action: {
                        globalVar.currencyFrom = true
                        showingPicker = true
                    }, label: {
                        Text(convertFrom)
                    })
                    .pickerStyle(MenuPickerStyle())
                    .padding(.all)
                    .frame(minWidth: UIScreen.screenWidth/3)
                    .background(Color.white)
                    .cornerRadius(/*@START_MENU_TOKEN@*/20.0/*@END_MENU_TOKEN@*/)
                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 6, x: 2, y: 3)
                    .foregroundColor(colors[0][1])
                    .font(.title)
                }
                .offset(y: -UIScreen.screenHeight/18)
                
                VStack{
                    TextField("Amount", text: $from)
                    .padding(.all)
                    .frame(maxWidth: .infinity, minHeight: UIScreen.screenHeight/10.0, alignment: .center)
                    .background(RoundedRectangle(cornerRadius: 30)
                                    .strokeBorder(colors[0][0], lineWidth: 0.3))
                    .background(Color.white)
                    .cornerRadius(30)
                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 8, x: 6, y: 8)
                    .padding(.horizontal, UIScreen.screenWidth/10)
                    .padding(.vertical, UIScreen.screenHeight/50)
                    .font(.title)
                    .keyboardType(.numberPad)
                    
                    
                    Button(action: {
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
                    },  label: {
                        Text("Convert")
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            .foregroundColor(Color(UIColor(contrastingBlackOrWhiteColorOn:UIColor(colors[0][1]), isFlat:true)))
                    })
                    .padding(.all)
                    .frame(minWidth: 240)
                    .background(colors[0][1])
                    .cornerRadius(/*@START_MENU_TOKEN@*/20.0/*@END_MENU_TOKEN@*/)
                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 6, x: 3, y: 4)
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
    
    // MARK: FUNCS
    
    func getPosts() {
        
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
        
//        ContentView()
//            .previewDevice(PreviewDevice(rawValue: "iPhone 12"))
//                        .previewDisplayName("iPhone 12")
////
//        ContentView()
//            .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
//                        .previewDisplayName("iPhone 8")
    }
}

extension UIScreen{
   static let screenWidth = UIScreen.main.bounds.size.width
   static let screenHeight = UIScreen.main.bounds.size.height
   static let screenSize = UIScreen.main.bounds.size
}

class GlobalVar: ObservableObject{
    @Published var currencyFrom: Bool = true
    @Published var searchCurrency: String = ""
}
