//
//  NetworkingManager.swift
//  WeatherForecast
//
//  Created by Fatih Kilit on 26.07.2022.
//

import Foundation
import Combine

actor NetworkingManager {
    static let shared: NetworkingManager = NetworkingManager()
    
    private init() {}
    
    func download(url: URL) async throws -> Data {
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            
            guard
                let response = response as? HTTPURLResponse,
                response.statusCode >= 200 && response.statusCode < 300 else {
                
                throw URLError(.badServerResponse)
            }
            
            return data
        } catch {
            print(error)
            throw error
        }
    }
    
    // for testing purpose
    nonisolated func downloadCombine(url: URL) -> AnyPublisher<Data, Error> {
        URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .tryMap { (data, response) -> Data in
                
                guard
                    let response = response as? HTTPURLResponse,
                    response.statusCode >= 200 && response.statusCode < 300 else {
                    throw URLError(.badURL)
                }
                
                return data
            }
            .retry(3)
            .eraseToAnyPublisher()
    }
}
