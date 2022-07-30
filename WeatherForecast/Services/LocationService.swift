//
//  LocationService.swift
//  WeatherForecast
//
//  Created by Fatih Kilit on 27.07.2022.
//

import Foundation

class LocationService {
    
    func downloadLocation(locationName: String) async throws -> [Location] {
        guard let url = URL(string: ApiUrls.search(locationName: locationName)) else {return []}
        
        do {
            let downloadedData = try await NetworkingManager.shared.download(url: url)
            guard let locations = try? JSONDecoder().decode([Location].self, from: downloadedData) else {return []}
            
            return locations
        } catch {
            print(error)
            throw error
        }
    }
}
