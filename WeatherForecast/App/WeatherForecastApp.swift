//
//  WeatherForecastApp.swift
//  WeatherForecast
//
//  Created by Fatih Kilit on 26.07.2022.
//

import SwiftUI

@main
struct WeatherForecastApp: App {
    
    @StateObject private var store: Store = Store()
    @State private var selectedLocation: Location = Location()
    
    init() {
        UITableView.appearance().showsVerticalScrollIndicator = false
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeScreen(locations: $store.savedLocations, selectedLocation: $selectedLocation) {
                    Task {
                        do {
                            try await Store.save(locations: store.savedLocations)
                        } catch {
                            print(error)
                            throw error
                        }
                    }
                }
            }
            .preferredColorScheme(.dark)
            .onAppear {
                Task {
                    do {
                        store.savedLocations = try await Store.load()
                        selectedLocation = store.savedLocations.first ?? Location()
                    } catch {
                        print(error)
                        throw error
                    }
                }
            }
        }
    }
}
