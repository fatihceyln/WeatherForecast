//
//  Weather.swift
//  WeatherForecast
//
//  Created by Fatih Kilit on 22.04.2022.
//

import Foundation

struct WeatherMood: Codable, Equatable {
    let id: Int
    var main, weatherDescription, icon: String

    enum CodingKeys: String, CodingKey {
        case id, main
        case weatherDescription = "description"
        case icon
    }
}
