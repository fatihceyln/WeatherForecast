//
//  WeatherInfoView.swift
//  WeatherForecast
//
//  Created by Fatih Kilit on 29.07.2022.
//

import SwiftUI

struct WeatherInfoView: View {
    
    let location: Location
    let locationCount: Int
    let locationIndex: Int
    @StateObject private var vm: WeatherInfoViewModel
    
    init(location: Location, locationCount: Int, locationIndex: Int) {
        self.location = location
        self.locationCount = locationCount
        self.locationIndex = locationIndex
        self._vm = StateObject(wrappedValue: WeatherInfoViewModel(location: location))
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 60) {
                VStack {
                    HStack {
                        Text(location.name ?? "")
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        Text(location.country ?? "")
                            .foregroundColor(.white.opacity(0.7))
                    }
                    
                    tabViewIndicatorView
                }
                .overlay {
                    ZStack {
                        if let systemName = vm.weatherDataModel?.current?.weather?.first?.weatherDescription?.systemName {
                            WeatherDescriptionImageView(systemName: systemName)
                                .offset(x: .deviceWidth - 175, y: 180)
                                .opacity(0.7)
                        }
                    }
                }
                
                if let data = vm.weatherDataModel {
                    temperatureInfo(data: data)
                    
                    descriptionAndFeelsLike(data: data)
                }
                
                hourlyWeather
                
                dailyWeather
                    .padding(.top, -50)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 36)
            .padding(.top, 140)
            
            if let data = vm.weatherDataModel {
                CurrentStatistics(data: data)
                    .padding(.bottom, 40)
            }
            
        }
        .task {
            if vm.weatherDataModel == nil {
                await vm.getWeatherDataModel()
            }
        }
        .background(weatherBackground)
    }
    
    var tabViewIndicatorView: some View {
        HStack {
            ForEach(0..<locationCount, id: \.self) { index in
                Circle()
                    .fill(index == locationIndex ? .white.opacity(0.8) : .white.opacity(0.4))
                    .frame(width: 7.5, height: 7.5)
            }
        }
    }
    
    @ViewBuilder
    func temperatureInfo(data: WeatherData) -> some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("\(data.currentTemp)°")
                .font(.system(size: 100))
            
            HStack(spacing: 10) {
                HStack(spacing: 4) {
                    Image(systemName: "chevron.up")
                    Text("\(data.maxTemp)°")
                        .font(.callout)
                }
                
                HStack(spacing: 4) {
                    Image(systemName: "chevron.down")
                    Text("\(data.minTemp)°")
                        .font(.callout)
                }
            }
        }
    }
    
    @ViewBuilder
    func descriptionAndFeelsLike(data: WeatherData) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("\(data.currentWeatherDescription.capitalized)")
                .fontWeight(.bold)
            
            Text("Feels like \(data.hourFeelsLike)°")
        }
    }
    
    
    var hourlyWeather: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            if let hourlyArray = vm.weatherDataModel?.hourly?.prefix(24)
            {
                VStack(spacing: 20) {
                    Divider()
                    HStack {
                        ForEach(hourlyArray, id: \.self) { hourly in
                            HourlyWeatherInfo(timezone: vm.weatherDataModel?.timezone ?? "", hourly: hourly)
                                .padding(hourlyArray[0] == hourly ? .init(rawValue: 0) : .leading)
                        }
                    }
                    Divider()
                }
            }
        }
    }
    
    var dailyWeather: some View {
        ZStack {
            if let dailyArray = vm.weatherDataModel?.daily?.prefix(7) {
                VStack {
                    ForEach(dailyArray, id: \.self) { daily in
                        DailyWeatherInfo(timeZone: vm.weatherDataModel?.timezone ?? "", daily: daily)
                    }
                }
            }
        }
    }
    
    var weatherBackground: some View {
        Rectangle()
            .fill(LinearGradient(colors: [Color("blue"), Color("blue").opacity(0.6)], startPoint: .top, endPoint: .bottom))
            .brightness(0.2)
            .ignoresSafeArea()
    }
}

struct WeatherInfoView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherInfoView(location: Location(name: "Location", lat: 39.9208, lon: 32.85, country: "country", state: "state"), locationCount: 3, locationIndex: 0)
            .preferredColorScheme(.dark)
    }
}
