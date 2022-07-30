//
//  WeatherInfoViewModel.swift
//  WeatherForecast
//
//  Created by Fatih Kilit on 29.07.2022.
//

import SwiftUI

class WeatherInfoViewModel: ObservableObject {
    let location: Location
    let service: WeatherService
    
    @Published var weatherDataModel: WeatherData? = nil
    
    init(location: Location) {
        self.location = location
        self.service = WeatherService(location: location)
    }
    
    func getWeatherDataModel() async {
        let returnedWeatherDataModel = try? await service.downloadWeatherInfo()
        
        await MainActor.run {
            self.weatherDataModel = returnedWeatherDataModel
        }
    }
    
    func getTime(dt: Int, timezone: String) -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(dt))
        
        let timeZone = TimeZone(identifier: timezone)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .none
        dateFormatter.timeStyle = .short
        dateFormatter.timeZone = timeZone
        
        return dateFormatter.string(from: date)
    }
}
