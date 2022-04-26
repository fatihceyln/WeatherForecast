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
    
    var description: String {
        switch self {
        case .current(let lat, let lon):
            return "https://api.openweathermap.org/data/2.5/onecall?lat=\(lat)&lon=\(lon)&exclude=minutely,hourly,daily&units=metric&appid=617a7c13afa5b96bc908f78841b29114"
        case .hourly(let lat, let lon):
            return "https://api.openweathermap.org/data/2.5/onecall?lat=\(lat)&lon=\(lon)&exclude=current,minutely,daily&units=metric&appid=617a7c13afa5b96bc908f78841b29114"
        case .daily(let lat, let lon):
            return "https://api.openweathermap.org/data/2.5/onecall?lat=\(lat)&lon=\(lon)&exclude=current,minutely,hourly&units=metric&appid=617a7c13afa5b96bc908f78841b29114"
        case .icon(let iconName):
            return "https://openweathermap.org/img/wn/\(iconName)@2x.png"
        }
    }
}
