//
//  TemperatureView.swift
//  WeatherForecast
//
//  Created by Fatih Kilit on 23.04.2022.
//

import SwiftUI

struct TemperatureView: View {
    
    let temperature: Double?
    let fontFortTitle: Font
    let fontForCelcius: Font
    
    init(temperature: Double?, fontForTitle: Font, fontForCelcius: Font) {
        self.temperature = temperature
        self.fontFortTitle = fontForTitle
        self.fontForCelcius = fontForCelcius
    }
    
    var body: some View {
        HStack(alignment: .top, spacing: 0) {
            if let temperature = temperature {
                Text(temperature.numberWithNoFraction)
                    .font(fontFortTitle)
                
                Text("°C")
                    .font(fontForCelcius)
            }
        }
    }
}

struct TemperatureView_Previews: PreviewProvider {
    static var previews: some View {
        TemperatureView(temperature: 0, fontForTitle: .title, fontForCelcius: .callout)
    }
}
