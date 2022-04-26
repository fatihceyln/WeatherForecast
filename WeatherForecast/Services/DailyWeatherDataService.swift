//
//  DailyWeatherDataService.swift
//  WeatherForecast
//
//  Created by Fatih Kilit on 24.04.2022.
//

import Foundation
import Combine

class DailyWeatherDataService {
    @Published var dailyWeather: DailyWeather? = nil
    let locationManager: LocationManager = LocationManager.shared
    var cancellables = Set<AnyCancellable>()
    
    init() {
        getCurrentLocation()
    }
    
    private func getCurrentLocation() {
        locationManager.location
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: NetworkingManager.handleCompletion(completion:)) { [weak self] returnedLocation in
                let lat = returnedLocation.coordinate.latitude
                let lon = returnedLocation.coordinate.longitude
                
                self?.getDailyWeather(lat: lat, lon: lon)
            }
            .store(in: &cancellables)
    }
    
    private func getDailyWeather(lat: Double, lon: Double) {
        guard let url = URL(string: ApiURL.daily(lat: lat, lon: lon).description) else {return}
        
        NetworkingManager.download(url: url)
            .receive(on: DispatchQueue.main)
            .decode(type: DailyWeather.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion(completion:)) { [weak self] returnedDailyWeather in
                self?.dailyWeather = returnedDailyWeather
            }
            .store(in: &cancellables)
    }
}
