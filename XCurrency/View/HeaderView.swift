//
//  HeaderView.swift
//  XCurrency
//
//  Created by Ahmad Ubaidillah on 19/06/21.
//

import SwiftUI

struct HeaderView: View {
    var colors: [Color]
    var image: String
    var color: Color
    
    var body: some View {
        HStack{
            HStack{
                VStack(alignment:.leading){
//                    Text("Hi!")
//                        .bold()
//                        .font(.largeTitle)
//                        .foregroundColorContrast(color: color)
                    Text("Welcome To")
                        .font(.title)
                        .foregroundColorContrast(color: color)
                    Text("XCurrency!")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColorContrast(color: color)
                }
                .shadow(color: Color.black.opacity(0.15), radius: 6, x: 4, y: 4)
                Spacer()
                
                Image(image)
                    .resizable()
                    .frame(width: UIScreen.screenHeight/9, height: UIScreen.screenHeight/9)
                    .shadow(color: Color.black.opacity(0.15), radius: 8, x: 6, y: 6)
                
            }
            .offset(y: UIScreen.screenHeight/30)
        }
        .frame(height: UIScreen.screenHeight/5)
        .padding(UIScreen.screenWidth/14)
        .background(LinearGradient(gradient: Gradient(colors: colors), startPoint: .topLeading, endPoint: .bottomTrailing))
        .clipShape(CustomShape(corner: .bottomRight, radii: 40))
        .offset(y: -UIScreen.screenHeight/17)
    }
}

struct CustomShape : Shape {
    var corner : UIRectCorner
    var radii : CGFloat
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corner, cornerRadii: CGSize(width: radii, height: radii))
        
        return Path(path.cgPath)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(colors: [Color.blue, Color.black], image: "currency_1", color: Color.blue)
    }
}
