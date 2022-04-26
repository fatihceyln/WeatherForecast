//
//  NetworkingManager.swift
//  WeatherForecast
//
//  Created by Fatih Kilit on 22.04.2022.
//

import Foundation
import Combine

class NetworkingManager {
    
    enum NetworkingError: LocalizedError {
        case badURLResponse(url: URL)
        case unknown
        
        var errorDescription: String? {
            switch self {
            case .badURLResponse(let url):
                return "Bad response from URL: \(url)"
            case .unknown:
                return "Unknown error occured."
            }
        }
    }
    
    static func download(url: URL) -> AnyPublisher<Data, Error> {
        URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { (data: Data, response: URLResponse) in
                try self.handleURLResponse(data: data, response: response, url: url)
            }
            .retry(3)
            .eraseToAnyPublisher()
    }
    
    static func handleURLResponse(data: Data, response: URLResponse, url: URL) throws -> Data{
        guard let response = response as? HTTPURLResponse,
              response.statusCode >= 200 && response.statusCode < 300 else {
            throw NetworkingError.badURLResponse(url: url)
        }
        
        return data
    }
    
    static func handleCompletion(completion: Subscribers.Completion<Error>) {
        switch completion {
        case .finished:
            break
        case .failure(let error):
            print("Error: \(error)")
        }
    }
}
