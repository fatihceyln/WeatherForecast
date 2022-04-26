//
//  TestView.swift
//  WeatherForecast
//
//  Created by Fatih Kilit on 24.04.2022.
//

import SwiftUI

struct TestView: View {
    
    @State private var showPopup: Bool = false
    @State private var text: String = ""
    @State private var textPopup: String = ""
    
    init() {
        UITextView.appearance().backgroundColor = .clear
    }
    
    //Popup view
    /*
    var body: some View {
        ZStack {
            Color.pink.opacity(0.3).ignoresSafeArea()
            
            VStack {
                Text("Custom Popup")
                    .font(.largeTitle)
                
                TextField("asdasd", text: $text)
                
                Text("Introduction")
                    .font(.title)
                    .foregroundColor(.gray)
                
                Text("You can create your own modal popup with the use of a ZStack and a State variable")
                    .font(.title)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Material.thinMaterial, in: RoundedRectangle(cornerRadius: 10)
                    )
                    .padding()
                
                Button {
                    showPopup = true
                } label: {
                    Text("Show popup")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundStyle(LinearGradient(colors: [.blue, .red], startPoint: .leading, endPoint: .trailing))
                        .padding()
                        .background(Material.thinMaterial, in: RoundedRectangle(cornerRadius: 10))
                        .padding()
                }
            }
            .allowsHitTesting(!$showPopup.wrappedValue ? true : false)
            
            if $showPopup.wrappedValue {
                ZStack {
                    Color.black.opacity(0.4)
                        .ignoresSafeArea()
                    
                    VStack {
                        Text("Popup")
                            .bold()
                            .frame(maxWidth: .infinity)
                            .frame(height: 40)
                            .background(Color.orange)
                            .foregroundColor(Color.black)
                        
                        TextEditor(text: $textPopup)
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                            .multilineTextAlignment(.leading)
                        
                        
                        Spacer()
                        
                        Button {
                            self.showPopup = false
                        } label: {
                            Text("Close")
                        }
                        .frame(maxWidth: .infinity)
                        .frame(height: 30)
                        .background(Color.white.opacity(0.4))
                    }
                    .frame(width: 300, height: 300)
                    .background(Material.thinMaterial)
                    .cornerRadius(10)
                    .shadow(radius: 10)
                }
            }
        }
    }
    */
    var body: some View {
        ZStack {
            Color.red.ignoresSafeArea()
            
            Image(uiImage: UIImage(systemName: "sun.max.fill")!)
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
