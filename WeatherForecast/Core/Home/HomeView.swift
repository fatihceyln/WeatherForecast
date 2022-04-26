//
//  HomeView.swift
//  WeatherForecast
//
//  Created by Fatih Kilit on 22.04.2022.
//

import SwiftUI
import Combine

struct HomeView: View {
    @EnvironmentObject var vm: HomeViewModel
    
    var body: some View {
        ZStack {
            Color.blue
                .opacity(0.9)
                .ignoresSafeArea()
            
            ScrollView {
                currentTemperatureInfo
                hourlyTemperatureInfo
                dailyWeatherInfo
                currentWeatherDetailInfo
            }
            .frame(maxWidth: .infinity)
        }
    }
}


extension HomeView {
    var currentTemperatureInfo: some View {
        ZStack {
            if let currentWeather = vm.currentWeather {
                VStack(alignment: .center) {
                    TemperatureView(temperature: currentWeather.current.temp, fontForTitle: .title, fontForCelcius: .callout)
                    
                    if let mood = currentWeather.current.weather.first {
                        Text(mood.main)
                        WeatherImageView(weatherMood: mood)
                    }
                }
                .padding()
                .padding(.vertical, 30)
                .frame(maxWidth: .infinity)
            }
        }
    }
    
    var hourlyTemperatureInfo: some View {
        
        ZStack {
            if let hourlyWeather = vm.hourlyWeather,
               let hourlyArray = vm.hourlyArray {
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(hourlyArray, id: \.self) { hourly in
                            VStack {
                                TemperatureView(temperature: hourly.temp, fontForTitle: .callout, fontForCelcius: .caption)
                                
                                if let weatherMood = hourly.weather.first {
                                    WeatherImageView(weatherMood: weatherMood)
                                }
                                
                                Text(vm.getTime(dt: hourly.dt, timezone: hourlyWeather.timezone))
                            }
                        }
                    }
                    .padding()
                }
            }
        }
    }
    
    var dailyWeatherInfo: some View {
        ZStack {
            if let dailyWeather = vm.dailyWeather,
               let dailyArray = vm.dailyArray {
                VStack {
                    ForEach(dailyArray, id: \.self) { daily in
                        HStack(spacing: 5) {
                            
                            Text(vm.getDay(dt: daily.dt, timezone: dailyWeather.timezone))
                            
                            if let weatherMood = daily.weather.first {
                                Text(weatherMood.main)
                            }
                            
                            Spacer()
                            
                            HStack(alignment: .center, spacing: 5) {
                                TemperatureView(temperature: daily.temp.max, fontForTitle: .callout, fontForCelcius: .caption)
                                Text("/")
                                TemperatureView(temperature: daily.temp.min, fontForTitle: .callout, fontForCelcius: .caption)
                            }
                            .frame(width: 100)
                        }
                        .padding()
                        
                        if daily != dailyArray.last {
                            Rectangle()
                                .frame(height: 1)
                        }
                    }
                }
                .padding()
                
                // Putting background shadow to behing the frame because of performance issues
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.clear)
                        .background(Material.ultraThin, in: RoundedRectangle(cornerRadius: 10))
                        .padding()
                        .shadow(radius: 10)
                }
                .zIndex(-1)
            }
        }
        
    }
    
    var currentWeatherDetailInfo: some View {
        
        ZStack {
            if let currentWeather = vm.currentWeather {
                HStack(alignment: .center) {
                        
                    VStack(alignment: .center, spacing: 0) {
                        Text("Feels like")
                            .font(.caption)
                        TemperatureView(temperature: currentWeather.current.feelsLike, fontForTitle: .title2, fontForCelcius: .callout)
                            .padding(.bottom)
                        
                        Text("Humidity")
                            .font(.caption)
                        Text("\(currentWeather.current.humidity) %")
                            .font(.title2)
                            .padding(.bottom)
                        
                        Text("Wind speed")
                            .font(.caption)
                        Text(currentWeather.current.windSpeed.numberWith2Fraction + " km/h")
                            .font(.title2)
                            .padding(.bottom)
                    }
                    .padding(.top)
                    
                    Spacer()
                    
                    VStack(spacing: 0) {
                        Text("Pressure")
                            .font(.callout)
                        Text(Double(currentWeather.current.pressure).numberWithNoSeperator + " mbar")
                            .font(.title2)
                            .padding(.bottom)
                        
                        Text("Sunrise")
                            .font(.callout)
                        Text("\(vm.getTime(dt: currentWeather.current.sunrise, timezone: currentWeather.timezone))")
                            .font(.title2)
                            .padding(.bottom)
                        
                        Text("Sunset")
                            .font(.callout)
                        Text("\(vm.getTime(dt: currentWeather.current.sunset, timezone: currentWeather.timezone))")
                            .font(.title2)
                            .padding(.bottom)
    
                    }
                    .padding(.top)
                }
                .padding(.horizontal, 30)
                .frame(maxWidth: .infinity)
                .padding()
                
                // Putting background shadow to behing the frame because of performance issues
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.clear)
                        .background(Material.ultraThin, in: RoundedRectangle(cornerRadius: 10))
                        .padding()
                        .shadow(radius: 10)
                }
                .zIndex(-1)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(HomeViewModel())
    }
}
