//
//  WeatherImageVİew.swift
//  WeatherForecast
//
//  Created by Fatih Kilit on 23.04.2022.
//

import SwiftUI

struct WeatherImageView: View {
    
    @ObservedObject var vm: WeatherImageViewModel
    let width: CGFloat
    let height: CGFloat
    init(weatherMood: WeatherMood, width: CGFloat, height: CGFloat) {
        vm = WeatherImageViewModel(weatherMood: weatherMood)
        self.width = width
        self.height = height
    }
    
    var body: some View {
        ZStack {
            if let image = vm.image {
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: width, height: height)
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
        WeatherImageView(weatherMood: WeatherMood(id: 0, main: "", weatherDescription: "", icon: "01d"), width: 100, height: 100)
    }
}
