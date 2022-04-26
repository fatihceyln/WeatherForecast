//
//  Double.swift
//  WeatherForecast
//
//  Created by Fatih Kilit on 23.04.2022.
//

import Foundation

extension Double {
    var numberWithNoFraction: String {
        String(format: "%.0f", self)
    }
    
    var numberWith2Fraction: String {
        String(format: "%0.2f", self)
    }
    
    var numberWithNoSeperator: String {
        let formatter = NumberFormatter()
        formatter.groupingSeparator = ""
        formatter.numberStyle = .decimal
        return formatter.string(from: self as NSNumber) ?? ""
    }
}
