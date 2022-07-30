//
//  SearchViewModel.swift
//  WeatherForecast
//
//  Created by Fatih Kilit on 27.07.2022.
//

import Foundation
import Combine
import SwiftUI

class SearchViewModel: ObservableObject {
    @Published var textField: String = ""
    @MainActor @Published var locations: [Location] = []
    private let service: LocationService = LocationService()
    
    init() {
        addSubscriptions()
    }
    
    private func addSubscriptions() {
        $textField
            .debounce(for: 0.5, scheduler: DispatchQueue.main)
            .removeDuplicates()
            .flatMap { value in
                Future { promise in
                    Task {
                        if !value.isEmpty {
                            let returnedLocations = await self.getLocations(locationName: value)
                            promise(.success(returnedLocations))
                        }
                    }
                }
            }
            .receive(on: DispatchQueue.main)
            .assign(to: &$locations)
    }
    
    private func getLocations(locationName: String) async -> [Location] {
        do {
            let locations = try await service.downloadLocation(locationName: locationName)
            return locations
        } catch {
            print(error)
            return []
        }
    }
}
