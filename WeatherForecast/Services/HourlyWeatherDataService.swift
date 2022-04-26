//
//  HourlyWeatherDataService.swift
//  WeatherForecast
//
//  Created by Fatih Kilit on 23.04.2022.
//

import Foundation
import Combine

class HourlyWeatherDataService {
    @Published var hourlyWeather: HourlyWeather? = nil
    private let locationManager = LocationManager.shared
    var cancellables = Set<AnyCancellable>()
    
    init() {
        getCurrentLocation()
    }
    
    private func getCurrentLocation() {
        locationManager.location
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: NetworkingManager.handleCompletion(completion:)) { [weak self] location in
                let lat = location.coordinate.latitude
                let lon = location.coordinate.longitude
                
                self?.getHourlyWeather(lat: lat, lon: lon)
            }
            .store(in: &cancellables)
    }
    
    private func getHourlyWeather(lat: Double, lon: Double) {
        guard let url = URL(string: ApiURL.hourly(lat: lat, lon: lon).description) else {return}
        
        NetworkingManager.download(url: url)
            .receive(on: DispatchQueue.main)
            .decode(type: HourlyWeather.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion(completion:)) { [weak self] hourlyWeather in
                self?.hourlyWeather = hourlyWeather
            }
            .store(in: &cancellables)
    }
}
