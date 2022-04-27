//
//  WeatherImageVİew.swift
//  WeatherForecast
//
//  Created by Fatih Kilit on 23.04.2022.
//

import SwiftUI

struct WeatherImageView: View {
    
    @ObservedObject var vm: WeatherImageViewModel
    
    init(weatherMood: WeatherMood) {
        vm = WeatherImageViewModel(weatherMood: weatherMood)
    }
    
    var body: some View {
        ZStack {
            if let image = vm.image {
                image
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.black)
            }
            else {
                ProgressView()
            }
        }
        .padding()
        .background(Material.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 10))
        .padding()
        .shadow(radius: 10)
    }
}

struct WeatherImageView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherImageView(weatherMood: WeatherMood(id: 0, main: "", weatherDescription: "", icon: "01d"))
    }
}
