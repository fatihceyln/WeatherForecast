//
//  Double.swift
//  WeatherForecast
//
//  Created by Fatih Kilit on 29.07.2022.
//

import Foundation

extension Double {
    var asInt: Int {
        if ceil(self) - self <= 0.5 {
            return Int(ceil(self))
        } else if (self - floor(self)) < 0.5 {
            return Int(floor(self))
        } else {
            return Int(self)
        }
    }
}
