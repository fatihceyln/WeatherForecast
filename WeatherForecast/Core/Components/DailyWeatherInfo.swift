//
//  DailyWeatherInfo.swift
//  WeatherForecast
//
//  Created by Fatih Kilit on 30.07.2022.
//

import SwiftUI

struct DailyWeatherInfo: View {
    
    let timeZone: String
    let daily: Daily
    
    var day: String {
        let date = Date(timeIntervalSince1970: TimeInterval(daily.dt ?? 0))
        let timeZone = TimeZone(identifier: timeZone)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .none
        dateFormatter.timeZone = timeZone
        dateFormatter.dateFormat = "EEEE"
        
        let today = Date()
        
        return dateFormatter.string(from: today) == dateFormatter.string(from: date) ? "Today" : dateFormatter.string(from: date)
    }
    
    var body: some View {
        HStack {
            Text(day)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            if let systemName = daily.weather?.first?.weatherDescription?.systemName {
                Image(systemName: systemName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20)
            }
            HStack(spacing: 16) {
                Text("\(daily.maxTemp)°")
                
                Text("\(daily.minTemp)°")
                    .foregroundColor(.white.opacity(0.7))
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
        }
        .padding(.vertical, 8)
    }
}

struct DailyWeatherInfo_Previews: PreviewProvider {
    static var previews: some View {
        DailyWeatherInfo(timeZone: "xxxx", daily: Daily(dt: 1659085200, sunrise: nil, sunset: nil, temp: Temp(day: 30.9, min: 19.51, max: 34.04, night: 24.61), pressure: 1011, humidity: 22, windSpeed: 4.07, windDeg: 82, weather: [Weather(id: 800, main: Main.clear, weatherDescription: Description.clearSky, icon: "01d")], clouds: 0, rain: 0))
            .preferredColorScheme(.dark)
    }
}
