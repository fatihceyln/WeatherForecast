//
//  HourlyWeatherInfo.swift
//  WeatherForecast
//
//  Created by Fatih Kilit on 29.07.2022.
//

import SwiftUI

struct HourlyWeatherInfo: View {
    let timezone: String
    let hourly: Current

    var time: String {
        let date: Date = Date(timeIntervalSince1970: TimeInterval(hourly.dt ?? 0))
        let timeZone = TimeZone(identifier: timezone)
        let dateFormatter = DateFormatter()
        
        dateFormatter.timeZone = timeZone
        dateFormatter.dateFormat = "HH a"
        dateFormatter.amSymbol = "AM"
        dateFormatter.pmSymbol = "PM"
        
        return dateFormatter.string(from: date)
    }
    
    var body: some View {
        VStack(spacing: 20) {
            Text(time)
                .foregroundColor(.white.opacity(0.7))
                .font(.footnote)
            
            if let systemName = hourly.weather?.first?.weatherDescription?.systemName {
                Image(systemName: systemName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20)
            }
            
            Text("\(hourly.temp?.asInt ?? 0)°")
                .font(.body)
        }
        .frame(width: 50)
    }
}

struct HourlyWeatherInfo_Previews: PreviewProvider {
    static var previews: some View {
        HourlyWeatherInfo(timezone: "Europe/Istanbul", hourly: Current(dt: 1659690000, sunrise: 1659667834, sunset: 1659718717, temp: 34.02, feelsLike: 31.63, pressure: 1009, humidity: 15, uvi: 2.54, windSpeed: 2.24, windDeg: 54, weather: nil))
            .preferredColorScheme(.dark)
    }
}
