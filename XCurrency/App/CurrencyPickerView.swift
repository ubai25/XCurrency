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
    
    @ObservedObject var pickerViewModel: CurrencyPickerViewModel
    
    @State private var isSearch: Bool = false
    
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
                            ZStack{
                                TextField("Search", text: $pickerViewModel.search)
                                    .padding(.horizontal)
                                    .currencyDescStyle(color: color)
                                    .isHidden(!isSearch)
                                
                                Button(action: {
                                    isSearch = true
                                }, label: {
                                    Text(pickerViewModel.selectedTo[0])
                                        .font(.title3)
                                        .fontWeight(.light)
                                        .padding(.horizontal, 7)

                                    Spacer()

                                    Image(systemName: "magnifyingglass.circle")
                                        .padding(.horizontal, 5)
                                })
//                                .padding()
                                .currencyDescStyle(color: color)
                                .isHidden(isSearch)
                            }
                            
                            Picker("Select your Currency", selection: $pickerViewModel.selectedTo) {
                                ForEach(pickerViewModel.listOfCurrency, id: \.self) {
                                    Text($0[1])
                                }
                            }
                            .background(Color.white)
                            .cornerRadius(10)
                            .onTapGesture {
                                isSearch = false
                            }
                            .gesture(DragGesture(minimumDistance: 0, coordinateSpace: .local)
                                        .onEnded({ value in
                                            isSearch = false
                                        }))
                        }
                        .isHidden(!pickerViewModel.isCurrencyTo)
                        
                        VStack {
                            ZStack{
                                TextField("Search", text: $pickerViewModel.search)
                                    .padding(.horizontal)
                                    .currencyDescStyle(color: color)
                                    .isHidden(!isSearch)
                                
                                Button(action: {
                                    isSearch = true
                                }, label: {
                                    Text(pickerViewModel.selectedFrom[0])
                                        .fontWeight(.light)
                                        .padding(.horizontal, 7)

                                    Spacer()

                                    Image(systemName: "magnifyingglass.circle")
                                        .padding(.horizontal, 5)
                                })
                                .currencyDescStyle(color: color)
                                .isHidden(isSearch)
                            }
                            
                            Picker("Select your Currency", selection: $pickerViewModel.selectedFrom) {
                                ForEach(pickerViewModel.listOfCurrency, id: \.self) {
                                    Text($0[1])
                                }
                            }
                            .background(Color.white)
                            .cornerRadius(10)
                            .onTapGesture {
                                isSearch = false
                            }
                            .gesture(DragGesture(minimumDistance: 0, coordinateSpace: .local)
                                        .onEnded({ value in
                                            isSearch = false
                                        }))
                        }
                        .isHidden(pickerViewModel.isCurrencyTo)
                    }
                    
                    VStack {
                        
                        Button(action: {
                            pickerViewModel.doSelect()
                            presentationMode.wrappedValue.dismiss()
                        },  label: {
                            Text("Select")
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                .fontWeight(.light)
                                .padding()
                                .foregroundColorContrast(color: color)
                        })
                        .mainButtonStyle(color: color)
                        .disabled(pickerViewModel.isDataNotFound)
                    }
                    .frame(maxWidth: UIScreen.screenWidth/1.2)
                    .background(Color.white)
                    .cornerRadius(10)
                    .padding(.vertical, 20)
                }
//                .background(Color.blue)
                .padding()
            }
            .navigationBarItems(trailing: Button(action:{
                pickerViewModel.search = ""
                presentationMode.wrappedValue.dismiss()
            }){
                Image(systemName: "xmark")
            })
        }
    }
}

struct CurrencyPickerView_Previews: PreviewProvider {
    static var previews: some View {
        CurrencyPickerView(pickerViewModel: CurrencyPickerViewModel(), color: Color(UIColor.flatPlum()))
    }
}
