//
//  CurrentStatistics.swift
//  WeatherForecast
//
//  Created by Fatih Kilit on 29.07.2022.
//

import SwiftUI

struct Statistics<T: View>: View {
    
    let title: String
    let content: T
    
    init(title: String, @ViewBuilder content: () -> T) {
        self.title = title
        self.content = content()
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(title)
                .font(.footnote)
                .foregroundColor(.white.opacity(0.7))
            
            content
        }
    }
}

struct CurrentStatistics: View {
    let data: WeatherData
    let column: [GridItem] = [GridItem](repeating: GridItem(.flexible(), alignment: .leading), count: 2)
    
    var body: some View {
        LazyVGrid(columns: column, spacing: 30) {
            Statistics(title: "Sunrise") {
                Text("\(time(dt: data.current?.sunrise ?? 0))")
            }
            .padding(.leading, 22)
            
            Statistics(title: "Sunset") {
                Text("\(time(dt: data.current?.sunset ?? 0))")
            }
            .padding(.leading, 22)
            Statistics(title: "UV Index") {
                Text("\(data.current?.uvi?.asInt ?? 0)")
            }
            .padding(.leading, 22)
            
            Statistics(title: "Humidity") {
                Text("\(data.humidity)%")
            }
            .padding(.leading, 22)
            
            Statistics(title: "Wind") {
                HStack {
                    Image(systemName: "arrow.up")
                        .font(.callout)
                        .rotationEffect(.degrees(data.windDegree))
                    
                    Text("\(data.wind) km/h")
                }
            }
            .padding(.leading, 22)
            
            Statistics(title: "Pressure") {
                Text("\(data.current?.pressure ?? 0) hPa")
            }
            .padding(.leading, 22)
        }
        .padding(.vertical, 40)
        .background {
            RoundedRectangle(cornerRadius: 10)
                .fill(.white.opacity(0.15))
        }
        .padding(.horizontal)
    }
    
    func time(dt: Int) -> String {
        let date: Date = Date(timeIntervalSince1970: TimeInterval(dt))
        let timeZone = TimeZone(identifier: data.timezone ?? "")
        let dateFormatter = DateFormatter()
        
        dateFormatter.timeZone = timeZone
        dateFormatter.dateFormat = "HH:mm a"
        dateFormatter.amSymbol = "AM"
        dateFormatter.pmSymbol = "PM"
        
        return dateFormatter.string(from: date)
    }
}

struct CurrentStatistics_Previews: PreviewProvider {
    static var previews: some View {
        CurrentStatistics(data: WeatherData(lat: nil, lon: nil, timezone: nil, timezoneOffset: nil, current: nil, hourly: nil, daily: nil))
    }
}
