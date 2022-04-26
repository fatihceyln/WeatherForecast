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
                    .frame(width: 100, height: 100)
            }
            else {
                ProgressView()
            }
        }
        .padding()
        .background(Material.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 10))
        .padding()
    }
}

struct WeatherImageView_Previews: PreviewProvider {
    static var previews: some View {
        //WeatherImageView()
        ZStack {
            
        }
    }
}
