//
//  HourlyWeather.swift
//  WeatherForecast
//
//  Created by Fatih Kilit on 23.04.2022.
//

import Foundation

struct HourlyWeather: Codable {
    let timezoneOffset: Int
    let hourly: [Hourly]

    enum CodingKeys: String, CodingKey {
        case timezoneOffset = "timezone_offset"
        case hourly
    }
}

struct Hourly: Codable, Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine("\(dt.description)\(temp.description)\(weather.description)")
    }
    
    let dt: Int
    let temp: Double
    let weather: [WeatherMood]
}
