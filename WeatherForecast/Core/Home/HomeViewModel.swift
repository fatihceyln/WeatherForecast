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
    private let locationManager: LocationManager = LocationManager.shared
    
    private let currentWeatherDataService: CurrentWeatherDataService = CurrentWeatherDataService()
    private let hourlyWeatherDataService: HourlyWeatherDataService = HourlyWeatherDataService()
    private let dailyWeatherDataService: DailyWeatherDataService = DailyWeatherDataService()
    
    @Published var currentWeather: CurrentWeather? = nil
    @Published var hourlyWeather: HourlyWeather? = nil
    @Published var hourlyArray: [Hourly]? = []
    @Published var dailyWeather: DailyWeather? = nil
    @Published var dailyArray: [Daily]? = []
    
    var cancellables = Set<AnyCancellable>()
    
    init() {
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
        
    }
    
    func getTime(dt: Int) -> String {
        let date = NSDate(timeIntervalSince1970: TimeInterval(dt))
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .none
        dateFormatter.timeStyle = .short
        
        return dateFormatter.string(from: date as Date)
    }
    
    func getDay(daily: Daily) -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(daily.dt))
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .none
        dateFormatter.dateFormat = "EEEE"
        
        let today = Date()
        
        return dateFormatter.string(from: today) == dateFormatter.string(from: date) ? "Today -" : dateFormatter.string(from: date) + " -"
    
        //return dateFormatter.string(from: date) + " -"
    }
}
