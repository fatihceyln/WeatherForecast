//
//  Store.swift
//  WeatherForecast
//
//  Created by Fatih Kilit on 29.07.2022.
//

import SwiftUI

class Store: ObservableObject {
    @Published var savedLocations:[Location] = []
    
    private static func fileURL() throws -> URL {
        try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("locations.data")
    }
    
    static func load() async throws -> [Location] {
        do {
            let fileURL = try fileURL()
            
            guard let file = try? FileHandle(forReadingFrom: fileURL) else {
                throw URLError(.badURL)
            }
            
            let locations = try JSONDecoder().decode([Location].self, from: file.availableData)
            
            return locations
        } catch {
            print(error)
            throw error
        }
    }
    
    static func save(locations: [Location]) async throws {
        do {
            let data = try JSONEncoder().encode(locations)
            let fileURL = try fileURL()
            try data.write(to: fileURL)
        } catch {
            print(error)
            throw error
        }
    }
}
