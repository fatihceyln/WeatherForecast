//
//  DailyWeather.swift
//  WeatherForecast
//
//  Created by Fatih Kilit on 24.04.2022.
//

import Foundation

struct DailyWeather: Codable {
    let timezone: String
    let timezoneOffset: Int
    let daily: [Daily]

    enum CodingKeys: String, CodingKey {
        case timezoneOffset = "timezone_offset"
        case daily
        case timezone
    }
}

struct Daily: Codable, Hashable{
    static func == (lhs: Daily, rhs: Daily) -> Bool {
        lhs.dt == rhs.dt && lhs.temp == rhs.temp && lhs.weather == rhs.weather
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine("\(dt)\(temp.max)\(temp.min)\(weather.description)")
    }
    
    let dt: Int
    let temp: Temp
    let weather: [WeatherMood]
}

struct Temp: Codable, Equatable {
    let min, max: Double
}
