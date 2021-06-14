//
//  ContentView.swift
//  XCurrency
//
//  Created by Ahmad Ubaidillah on 10/06/21.
//

import SwiftUI
import ChameleonFramework

struct ContentView: View {
    
    @State private var result: Int = 80000000
    @State private var from: String = "0"
    var multiplyWith: Int = 25
    @State private var convertFrom: String = "IDR"
    @State private var convertTo: String = "USD"
    var colors: [[Color]] = colorsAvailableArray.shuffled()
//    @State private var isEditings: Bool = false
//    @State private var showDetails = false
    
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
                        
                        Image(currencyImages.shuffled()[0])
                            .resizable()
                            .frame(width: 120, height: 120)
                            .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 8, x: 6, y: 8)
                        
                    }
                }
                .frame(height: 180)
                .padding(30)
                .background(LinearGradient(gradient: Gradient(colors: colors[0]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .clipShape(CustomShape(corner: .bottomRight, radii: 50))
                .edgesIgnoringSafeArea(.top)
                
//                Spacer()
                Text("\(result)")
                    .padding(.all)
                    .frame(maxWidth: .infinity, minHeight: 80.0, alignment: .center)
                    .background(Color.white)
                    .cornerRadius(30)
                    .padding(.horizontal, 40)
                    .offset(y: -90)
                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 8, x: 6, y: 8)
                    .font(.title)
                
                Spacer()
                
                VStack {
                    Button(action: {
                        //action
                    }, label: {
                        Text("IDR")
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            .fontWeight(.bold)
                            .foregroundColor(colors[0][1])
                    })
                    .padding(.all)
                    .frame(minWidth: 120)
                    .background(Color.white)
                    .cornerRadius(/*@START_MENU_TOKEN@*/20.0/*@END_MENU_TOKEN@*/)
                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 6, x: 2, y: 3)
                    
                    Button(action: {
                        //action
                    }, label: {
                        Image(systemName: "repeat.circle.fill")
                            .resizable()
                            .frame(width: 60, height: 60)
                            .foregroundColor(colors[0][1])
                            .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                    })
                    .padding()
                    
                    Button(action: {
                        //action
                    }, label: {
                        Text("USD")
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            .fontWeight(.bold)
                            .foregroundColor(colors[0][1])
                    })
                    .padding(.all)
                    .frame(minWidth: 120)
                    .background(Color.white)
                    .cornerRadius(/*@START_MENU_TOKEN@*/20.0/*@END_MENU_TOKEN@*/)
                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 6, x: 2, y: 3)
                }
                .offset(y: -45)
                
                Spacer()
                
                VStack{
                    TextField(
                            "User name (email address)",
                        text: $from
                        )
                    .padding(.all)
                    .frame(maxWidth: .infinity, minHeight: 80.0, alignment: .center)
                    .background(Color.white)
                    .cornerRadius(30)
                    .padding(.horizontal, 40)
                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 8, x: 6, y: 8)
                    .font(.title)
                    
                    Button(action: {
                        guard let intFrom = Int(self.from) else {
                            return
                        }
                        
                        self.result = calculate(intFrom, multiplyWith)
    //                    Api().getPosts()
                    },  label: {
                        Text("Convert")
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            .fontWeight(.bold)
                            .foregroundColor(Color(UIColor(contrastingBlackOrWhiteColorOn:UIColor(colors[0][1]), isFlat:true)))
                    })
                    .padding(.all)
                    .frame(minWidth: 240)
                    .background(colors[0][1])
                    .cornerRadius(/*@START_MENU_TOKEN@*/20.0/*@END_MENU_TOKEN@*/)
                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 6, x: 3, y: 4)
                    
//                    Spacer()
                }
                
            }
//            .background(LinearGradient(gradient: Gradient(colors: [Color.white,colors[0][0]]), startPoint: .center, endPoint: .bottom))
//            .edgesIgnoringSafeArea(.bottom)
        }
    }
    
    func calculate(_ valFrom: Int, _ valMultiplyWith: Int) -> Int {
        valFrom * valMultiplyWith
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
