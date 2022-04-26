//
//  LocationManager.swift
//  WeatherForecast
//
//  Created by Fatih Kilit on 22.04.2022.
//

import Foundation
import CoreLocation
import Combine
import SwiftUI

class LocationManager: NSObject {
    
    let manager = CLLocationManager()
    var location = PassthroughSubject<CLLocation, Error>()
    
    override init() {
        super.init()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }
}

extension LocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let lastLocation = locations.last {
            self.location.send(lastLocation)
        }
    }
}
