//
//  ApiURL.swift
//  WeatherForecast
//
//  Created by Fatih Kilit on 22.04.2022.
//

import Foundation

enum ApiURL: CustomStringConvertible {
    case current(lat: Double, lon: Double)
    case hourly(lat: Double, lon: Double)
    case daily(lat: Double, lon: Double)
    case icon(iconName: String)
    case geocodingLocation(lat: Double, lon: Double)
    
    var description: String {
        switch self {
        case .current(let lat, let lon):
            return "https://api.openweathermap.org/data/2.5/onecall?lat=\(lat)&lon=\(lon)&exclude=minutely,hourly,daily&units=metric&appid=5ada3ec5173360bd7101a3d150cb3c99"
        case .hourly(let lat, let lon):
            return "https://api.openweathermap.org/data/2.5/onecall?lat=\(lat)&lon=\(lon)&exclude=current,minutely,daily&units=metric&appid=5ada3ec5173360bd7101a3d150cb3c99"
        case .daily(let lat, let lon):
            return "https://api.openweathermap.org/data/2.5/onecall?lat=\(lat)&lon=\(lon)&exclude=current,minutely,hourly&units=metric&appid=5ada3ec5173360bd7101a3d150cb3c99"
        case .icon(let iconName):
            return "https://openweathermap.org/img/wn/\(iconName)@2x.png"
        case .geocodingLocation(let lat, let lon):
            return "https://api.openweathermap.org/geo/1.0/reverse?lat=\(lat)&lon=\(lon)&limit=5&appid=5ada3ec5173360bd7101a3d150cb3c99"
        }
    }
}
