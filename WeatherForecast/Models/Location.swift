//
//  LocationModel.swift
//  WeatherForecast
//
//  Created by Fatih Kilit on 27.07.2022.
//

import Foundation

struct Location: Codable, Hashable {
    let name: String?
    let lat: Double?
    let lon: Double?
    var country: String?
    let state: String?
    
    init(name: String?, lat: Double?, lon: Double?, country: String?, state: String?) {
        self.name = name
        self.lat = lat
        self.lon = lon
        self.country = country
        self.state = state
    }
    
    // I would have assign them above but I want my struct to be immutable. Therefore I'm using this approach.
    init() {
        self.name = nil
        self.lat = nil
        self.lon = nil
        self.country = nil
        self.state = nil
    }
}
