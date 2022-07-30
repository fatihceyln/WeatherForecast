//
//  WeatherService.swift
//  WeatherForecast
//
//  Created by Fatih Kilit on 29.07.2022.
//

import Foundation

class WeatherService {
    let location: Location
    
    init(location: Location) {
        self.location = location
    }
    
    func downloadWeatherInfo() async throws -> WeatherData? {
        guard let url = URL(string: ApiUrls.weatherInfo(lat: location.lat ?? 0, lon: location.lon ?? 0)) else {print("error"); throw URLError(.badURL)}
        print(url.description)
        
        do {
            let data = try await NetworkingManager.shared.download(url: url)
            if let returnedWeatherData = try? JSONDecoder().decode(WeatherData.self, from: data) {
                return returnedWeatherData
            }
        } catch {
            throw error
        }
        
        return nil
    }
}
