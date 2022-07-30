//
//  CGFloat.swift
//  WeatherForecast
//
//  Created by Fatih Kilit on 29.07.2022.
//

import SwiftUI

extension CGFloat {
    static var deviceWidth: Self {
        UIScreen.main.bounds.width
    }
    
    static var deviceHeight: Self {
        UIScreen.main.bounds.height
    }
}
