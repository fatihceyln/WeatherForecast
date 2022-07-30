//
//  WeatherDescriptionImageView.swift
//  WeatherForecast
//
//  Created by Fatih Kilit on 29.07.2022.
//

import SwiftUI

struct WeatherDescriptionImageView: View {
    
    let systemName: String
    
    var body: some View {
        Image(systemName: systemName)
            .resizable()
            .foregroundColor(.white)
            .scaledToFit()
            .frame(width: 200, height: 200)
            .padding(50)
            .background(.white.opacity(0.2))
            .clipShape(Circle())
    }
}

struct WeatherDescriptionImageView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherDescriptionImageView(systemName: "sun.max")
            .preferredColorScheme(.dark)
    }
}
