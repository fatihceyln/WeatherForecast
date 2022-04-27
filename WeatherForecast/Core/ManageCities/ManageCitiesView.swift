//
//  ManageCitiesView.swift
//  WeatherForecast
//
//  Created by Fatih Kilit on 27.04.2022.
//

import SwiftUI

struct ManageCitiesView: View {
    
    @Binding var showManageCities: Bool
    @State var searchCityText: String = ""
    
    var body: some View {
        ZStack() {
            Color.pink.opacity(0.3)
                .ignoresSafeArea()
            
            
            

            
            VStack(spacing: 16) {
                
                Button {
                    showManageCities = false
                } label: {
                    Image(systemName: "xmark")
                        .resizable()
                        .tint(.black)
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                        .padding()
                        .background(Material.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 10))
                        .padding(.horizontal)
                        .shadow(radius: 10)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("MANAGE CITIES")
                    .font(.title)
                    .bold()
                    .padding()
                    .background(Material.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 10))
                    .padding(.horizontal)
                    .shadow(radius: 10)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                HStack(spacing: 5) {
                    Image(systemName: "magnifyingglass")
                    TextField("Search city", text: $searchCityText)
                }
                .padding()
                .background(Color.gray.opacity(0.4))
                .cornerRadius(10)
                .padding(.horizontal)
                
                // there will be list
                
                
                
                Spacer()
            }

        }
    }
}

struct ManageCitiesView_Previews: PreviewProvider {
    static var previews: some View {
        ManageCitiesView(showManageCities: .constant(true))
    }
}
