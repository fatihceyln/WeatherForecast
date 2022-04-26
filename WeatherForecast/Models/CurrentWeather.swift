//
//  CurrentWeather.swift
//  WeatherForecast
//
//  Created by Fatih Kilit on 22.04.2022.
//

import Foundation

struct CurrentWeather: Codable {
    let timezone: String
    let timezoneOffset: Int
    let current: Current

    enum CodingKeys: String, CodingKey {
        case timezoneOffset = "timezone_offset"
        case current
        case timezone
    }
}

struct Current: Codable {
    let sunrise, sunset: Int
    let temp, feelsLike: Double
    let pressure, humidity: Int
    let windSpeed: Double
    let weather: [WeatherMood]

    enum CodingKeys: String, CodingKey {
        case sunrise, sunset, temp
        case feelsLike = "feels_like"
        case pressure, humidity
        case windSpeed = "wind_speed"
        case weather
    }
}
