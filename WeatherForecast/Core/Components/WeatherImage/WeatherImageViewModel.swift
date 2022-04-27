//
//  WeatherImageViewModel.swift
//  WeatherForecast
//
//  Created by Fatih Kilit on 23.04.2022.
//

import Foundation
import SwiftUI
import Combine

class WeatherImageViewModel: ObservableObject {
    
    @Published var image: Image? = nil
    private let weatherMood: WeatherMood
    
    init(weatherMood: WeatherMood) {
        self.weatherMood = weatherMood
        self.getWeatherImage(weatherIcon: weatherMood.icon)
    }
    
    private func getWeatherImage(weatherIcon: String) {
        switch weatherIcon {
        case "01d":
            self.image = Image(systemName: "sun.max.fill")
        case "01n":
            self.image = Image(systemName: "moon.fill")
        case "02d":
            self.image = Image(systemName: "cloud.sun.fill")
        case "02n":
            self.image = Image(systemName: "cloud.moon.fill")
        case "03d":
            self.image = Image(systemName: "smoke.fill")
        case "03n":
            self.image = Image(systemName: "smoke.fill")
        case "04d":
            self.image = Image(systemName: "cloud.fill")
        case "04n":
            self.image = Image(systemName: "cloud.fill")
        case "09d":
            self.image = Image(systemName: "cloud.drizzle.fill")
        case "09n":
            self.image = Image(systemName: "cloud.drizzle.fill")
        case "10d":
            self.image = Image(systemName: "cloud.sun.rain.fill")
        case "10n":
            self.image = Image(systemName: "cloud.moon.rain.fill")
        case "11d":
            self.image = Image(systemName: "cloud.bolt.rain.fill")
        case "11n":
            self.image = Image(systemName: "cloud.bolt.rain.fill")
        case "13d":
            self.image = Image(systemName: "snowflake.circle.fill")
        case "13n":
            self.image = Image(systemName: "snowflake.circle.fill")
        case "50d":
            self.image = Image(systemName: "cloud.fog.fill")
        case "50n":
            self.image = Image(systemName: "cloud.fog.fill")
        default:
            self.image = Image(systemName: "xmark")
        }
    }
    
}
