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
                .opacity(0.4)
                .ignoresSafeArea()
            
            ScrollView {
                if let _ = vm.currentWeather {
                    currentTemperatureInfo
                } else {
                    EmptyView()
                }
                
                if let _ = vm.hourlyArray {
                    hourlyTemperatureInfo
                }
                else {
                    EmptyView()
                }
                
                if let _ = vm.dailyArray {
                    dailyWeatherInfo
                }
                else {
                    EmptyView()
                }
                
                currentWeatherDetailInfo
                    
                
            }
            .frame(maxWidth: .infinity)
        }
    }
}


extension HomeView {
    var currentTemperatureInfo: some View {
        VStack(alignment: .center) {
            TemperatureView(temperature: vm.currentWeather?.current.temp, fontForTitle: .title, fontForCelcius: .callout)
            
            if let mood = vm.currentWeather?.current.weather.first {
                Text(mood.main)
                WeatherImageView(weatherMood: mood)
            }
        }
        .padding()
        .padding(.vertical, 30)
        .frame(maxWidth: .infinity)
    }
    
    var hourlyTemperatureInfo: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                if let hourlyArray = vm.hourlyArray {
                    ForEach(hourlyArray, id: \.self) { hourly in
                        VStack {
                            TemperatureView(temperature: hourly.temp, fontForTitle: .callout, fontForCelcius: .caption)
                            
                            if let weatherMood = hourly.weather.first {
                                WeatherImageView(weatherMood: weatherMood)
                            }
                            
                            Text(vm.getTime(dt: hourly.dt))
                        }
                    }
                }
            }
            .padding()
        }
    }
    
    var dailyWeatherInfo: some View {
        ZStack {
            if let dailyArray = vm.dailyArray {
                VStack {
                    ForEach(dailyArray, id: \.self) { daily in
                        HStack(spacing: 5) {
                            Text(vm.getDay(daily: daily))
                            
                            if let weatherMood = daily.weather.first {
                                Text(weatherMood.main)
                            }
                            
                            Spacer()
                            
                            TemperatureView(temperature: daily.temp.max, fontForTitle: .callout, fontForCelcius: .caption)
                            Text("/")
                            TemperatureView(temperature: daily.temp.min, fontForTitle: .callout, fontForCelcius: .caption)
                        }
                        .padding()
                        
                        if daily != dailyArray.last {
                            Rectangle()
                                .frame(height: 1)
                        }
                    }
                }
                .padding()
                .background(Material.ultraThin, in: RoundedRectangle(cornerRadius: 10))
                .padding()
            }
            
        }
        
    }
    
    var currentWeatherDetailInfo: some View {
        HStack(alignment: .center) {
            
            if let currentWeather = vm.currentWeather {
                
                    
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
                    Text("\(vm.getTime(dt: currentWeather.current.sunrise))")
                        .font(.title2)
                        .padding(.bottom)
                    
                    Text("Sunset")
                        .font(.callout)
                    Text("\(vm.getTime(dt: currentWeather.current.sunset))")
                        .font(.title2)
                        .padding(.bottom)
                    
                    
                }
                .padding(.top)
                
            }
            
        }
        .padding(.horizontal, 30)
        .frame(maxWidth: .infinity)
        .padding()
//        .background {
//            RoundedRectangle(cornerRadius: 10)
//                .fill(Color.pink.opacity(0.2))
//                .padding()
//        }
        .background(Material.ultraThin, in: RoundedRectangle(cornerRadius: 10))
        .padding()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(HomeViewModel())
    }
}
