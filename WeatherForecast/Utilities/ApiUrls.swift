//
//  ApiUrls.swift
//  WeatherForecast
//
//  Created by Fatih Kilit on 26.07.2022.
//

import Foundation

enum ApiUrls: String {
    case BASE_URL = "http://api.openweathermap.org"
    case API_KEY = "b5ec6d894e4939e185d9d168c99ca3d4"
    
    static func search(locationName: String) -> String {
        let validLocationName = locationName.lowercased().trimmingCharacters(in: .whitespacesAndNewlines).replacingOccurrences(of: " ", with: "+").folding(options: .diacriticInsensitive, locale: .current)
        return BASE_URL.rawValue + "/geo/1.0/direct?q=\(validLocationName)&limit=5&&appid=" + API_KEY.rawValue
    }
    
    static func weatherInfo(lat: Double, lon: Double) -> String {
        return BASE_URL.rawValue + "/data/2.5/onecall?lat=\(lat)&lon=\(lon)&exclude=minutely&units=metric&appid=" + API_KEY.rawValue
    }
}
