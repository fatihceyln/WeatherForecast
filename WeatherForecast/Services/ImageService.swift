//
//  ImageService.swift
//  WeatherForecast
//
//  Created by Fatih Kilit on 30.07.2022.
//

import Foundation
import SwiftUI

class ImageService {
    let iconId: String
    
    init(iconId: String) {
        self.iconId = iconId
    }
    
    func downloadIcon(url: URL) async throws -> UIImage? {
        do {
            let data = try await NetworkingManager.shared.download(url: url)
            
            return UIImage(data: data)
        } catch {
            print(error)
            throw error
        }
    }
}
