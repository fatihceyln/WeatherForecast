//
//  CurrentWeatherDataService.swift
//  WeatherForecast
//
//  Created by Fatih Kilit on 22.04.2022.
//

import Foundation
import Combine
import SwiftUI

class CurrentWeatherDataService {
    
    private let locationManager: LocationManager
    @Published var currentWeather: CurrentWeather? = nil
    private var cancellables = Set<AnyCancellable>()
    
    init(locationManager: LocationManager) {
        self.locationManager = locationManager
        getCurrentLocation()
    }
    
    private func getCurrentLocation() {
        locationManager.location
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: NetworkingManager.handleCompletion(completion:)) { [weak self] returnedLocation in
                let lat = returnedLocation.coordinate.latitude
                let lon = returnedLocation.coordinate.longitude
                
                self?.getCurrentWeather(lat: lat, lon: lon)
            }
            .store(in: &cancellables)
    }
    
    private func getCurrentWeather(lat: Double, lon: Double) {
        
        guard let url = URL(string: ApiURL.current(lat: lat, lon: lon).description) else { return }
        
        NetworkingManager.download(url: url)
            .receive(on: DispatchQueue.main)
            .decode(type: CurrentWeather.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion(completion:)) { [weak self] returnedCurrentWeather in
                print("getting current weather")
                self?.currentWeather = returnedCurrentWeather
            }
            .store(in: &cancellables)
    }
}
