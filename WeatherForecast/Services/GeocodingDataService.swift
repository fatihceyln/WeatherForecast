//
//  GeocodingDataService.swift
//  WeatherForecast
//
//  Created by Fatih Kilit on 27.04.2022.
//

import Foundation
import Combine

class GeocodingDataService {
    let locationManager: LocationManager
    @Published var geoCity: [GeoCity]? = nil
    var cancellables = Set<AnyCancellable>()
    
    init(locationManager: LocationManager) {
        self.locationManager = locationManager
        getCurrentLocation()
    }
    
    func getCurrentLocation() {
        locationManager.location
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: NetworkingManager.handleCompletion(completion:)) { [weak self] returnedLocation in
                let lat = returnedLocation.coordinate.latitude
                let lon = returnedLocation.coordinate.longitude
                
                self?.getCityName(lat: lat, lon: lon)
            }
            .store(in: &cancellables)
    }
    
    func getCityName(lat: Double, lon: Double) {
        guard let url = URL(string: ApiURL.geocodingLocation(lat: lat, lon: lon).description) else {return}
        
        NetworkingManager.download(url: url)
            .receive(on: DispatchQueue.main)
            .decode(type: [GeoCity].self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion(completion:)) { [weak self] returnedGeoCity in
                self?.geoCity = returnedGeoCity
            }
            .store(in: &cancellables)
    }
}
