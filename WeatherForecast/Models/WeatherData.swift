//
//  Model.swift
//  WeatherForecast
//
//  Created by Fatih Kilit on 29.07.2022.
//

import Foundation

struct WeatherData: Codable {
    let lat, lon: Double?
    let timezone: String?
    let current: Current?
    let hourly: [Current]?
    let daily: [Daily]?

    enum CodingKeys: String, CodingKey {
        case lat, lon, timezone
        case current, hourly, daily
    }
}

// MARK: - Current
struct Current: Codable, Hashable {
    static func == (lhs: Current, rhs: Current) -> Bool {
        lhs.dt == rhs.dt
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(dt)
    }
    
    let dt, sunrise, sunset: Int?
    let temp, feelsLike: Double?
    let pressure, humidity: Int?
    let uvi: Double?
    let windSpeed: Double?
    let windDeg: Int?
    let weather: [Weather]?

    enum CodingKeys: String, CodingKey {
        case dt, sunrise, sunset, temp
        case feelsLike = "feels_like"
        case pressure, humidity
        case uvi
        case windSpeed = "wind_speed"
        case windDeg = "wind_deg"
        case weather
    }
}

// MARK: - Weather
struct Weather: Codable {
    let weatherDescription: Description?
    let icon: String?

    enum CodingKeys: String, CodingKey {
        case weatherDescription = "description"
        case icon
    }
}

enum Description: String, Codable {
    case brokenClouds = "broken clouds"
    case clearSky = "clear sky"
    case fewClouds = "few clouds"
    case lightRain = "light rain"
    case moderateRain = "moderate rain"
    case overcastClouds = "overcast clouds"
    case scatteredClouds = "scattered clouds"
    
    var systemName: String {
        switch self {
        case .brokenClouds:
            return "smoke"
        case .clearSky:
            return "sun.max"
        case .fewClouds:
            return "smoke.fill"
        case .lightRain:
            return "cloud.drizzle"
        case .moderateRain:
            return "cloud.rain"
        case .overcastClouds:
            return "cloud.fill"
        case .scatteredClouds:
            return "smoke.fill"
        }
    }
}

// MARK: - Daily
struct Daily: Codable, Hashable, Equatable {
    static func == (lhs: Daily, rhs: Daily) -> Bool {
        lhs.dt == rhs.dt
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(dt)
    }
    
    let dt, sunrise, sunset: Int?
    let temp: Temp?
    let pressure, humidity: Int?
    let windSpeed: Double?
    let windDeg: Int?
    let weather: [Weather]?
    let rain: Double?

    enum CodingKeys: String, CodingKey {
        case dt, sunrise, sunset
        case temp
        case pressure, humidity
        case windSpeed = "wind_speed"
        case windDeg = "wind_deg"
        case weather, rain
    }
}

// MARK: - Temp
struct Temp: Codable {
    let min, max: Double?
}

// MARK: Extensions

extension WeatherData {
    var currentTemp: Int {
        self.current?.temp?.asInt ?? 0
    }
    
    var maxTemp: Int {
        self.daily?.first?.temp?.max?.asInt ?? 0
    }
    
    var minTemp: Int {
        self.daily?.first?.temp?.min?.asInt ?? 0
    }
    
    var currentWeatherDescription: String {
        self.current?.weather?.first?.weatherDescription?.rawValue ?? ""
    }
    
    var currentFeelsLike: Int {
        self.hourly?.first?.feelsLike?.asInt ?? 0
    }
    
    var sunrise: Int {
        self.current?.sunrise ?? 0
    }
    
    var sunset: Int {
        self.current?.sunset ?? 0
    }
    
    var humidity: Int {
        self.current?.humidity ?? 0
    }
    
    var wind: Int {
        self.current?.windSpeed?.asInt ?? 0
    }
    
    var windDegree: Double {
        Double(self.current?.windDeg ?? 0)
    }
}

extension Daily {
    var maxTemp: Int {
        self.temp?.max?.asInt ?? 0
    }
    
    var minTemp: Int {
        self.temp?.min?.asInt ?? 0
    }
}
