//
//  HomeViewModel.swift
//  WeatherForecast
//
//  Created by Fatih Kilit on 22.04.2022.
//

import Foundation
import Combine
import CoreLocation
import SwiftUI

class HomeViewModel: ObservableObject {
    private let locationManager: LocationManager = LocationManager()
    
    private let currentWeatherDataService: CurrentWeatherDataService
    private let hourlyWeatherDataService: HourlyWeatherDataService
    private let dailyWeatherDataService: DailyWeatherDataService
    private let geocodingDataService: GeocodingDataService
    
    @Published var currentWeather: CurrentWeather? = nil
    
    @Published var hourlyWeather: HourlyWeather? = nil
    @Published var hourlyArray: [Hourly]? = []
    
    @Published var dailyWeather: DailyWeather? = nil
    @Published var dailyArray: [Daily]? = []
    
    @Published var geoCity: GeoCity? = nil
    
    var cancellables = Set<AnyCancellable>()
    
    init() {
        self.currentWeatherDataService = CurrentWeatherDataService(locationManager: locationManager)
        self.hourlyWeatherDataService = HourlyWeatherDataService(locationManager: locationManager)
        self.dailyWeatherDataService = DailyWeatherDataService(locationManager: locationManager)
        self.geocodingDataService = GeocodingDataService(locationManager: locationManager)
        addSubscribers()
    }
    
    private func addSubscribers() {
        currentWeatherDataService.$currentWeather
            .sink { [weak self] returnedCurrentWeather in
                self?.currentWeather = returnedCurrentWeather
            }
            .store(in: &cancellables)
        
        hourlyWeatherDataService.$hourlyWeather
            .sink { [weak self] returnedHourlyWeather in
                self?.hourlyWeather = returnedHourlyWeather
            }
            .store(in: &cancellables)
        
        $hourlyWeather
            .receive(on: DispatchQueue.main)
            .tryMap { returnedHourlyWeather -> [Hourly]? in
                guard let hourlyArray = returnedHourlyWeather?.hourly else {return []}
                let hourlyArrayClipped = hourlyArray.prefix(upTo: 24)
                return Array(hourlyArrayClipped)
            }
            .sink(receiveCompletion: NetworkingManager.handleCompletion(completion:)) { [weak self] returnedHourlyArray in
                self?.hourlyArray = returnedHourlyArray
            }
            .store(in: &cancellables)
        
        dailyWeatherDataService.$dailyWeather
            .sink { [weak self] returnedDailyWeather in
                self?.dailyWeather = returnedDailyWeather
            }
            .store(in: &cancellables)
        
        $dailyWeather
            .receive(on: DispatchQueue.main)
            .tryMap { returnedDailyWeather -> [Daily]? in
                guard let dailyArray = returnedDailyWeather?.daily else {return []}
                let dailyArrayClipped = dailyArray.prefix(upTo: 7)
                return Array(dailyArrayClipped)
            }
            .sink(receiveCompletion: NetworkingManager.handleCompletion(completion:)) { [weak self] returnedDailyArray in
                self?.dailyArray = returnedDailyArray
            }
            .store(in: &cancellables)
        
        geocodingDataService.$geoCity
            .tryMap { geoCities -> GeoCity? in
                return geoCities?.first
            }
            .sink(receiveCompletion: NetworkingManager.handleCompletion(completion:)) { [weak self] returnedGeoCity in
                self?.geoCity = returnedGeoCity
            }
            .store(in: &cancellables)
        
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
    
    func getDay(dt: Int, timezone: String) -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(dt))
        let timeZone = TimeZone(identifier: timezone)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .none
        dateFormatter.timeZone = timeZone
        dateFormatter.dateFormat = "EEEE"
        
        let today = Date()
        
        return dateFormatter.string(from: today) == dateFormatter.string(from: date) ? "Today -" : dateFormatter.string(from: date) + " -"
    }
}
