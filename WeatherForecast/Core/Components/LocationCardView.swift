//
//  LocationCardView.swift
//  WeatherForecast
//
//  Created by Fatih Kilit on 27.07.2022.
//

import SwiftUI

struct LocationCardView: View {
    let location: Location
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(location.name ?? "")
                .font(.system(size: 30, weight: .bold, design: .default))
                .frame(width: .deviceWidth * 0.75, alignment: .leading)
            
            HStack {
                Text(getLocationInfo())
                    .foregroundColor(.gray)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .frame(height: 100, alignment: .top)
        .background(Color.black.opacity(0.00001)) // for tap gesture
    }
    
    private func getLocationInfo() -> String {
        let state = location.state ?? ""
        let country = location.country ?? ""
        
        let array: [String] = [state, country]
        
        if state.isEmpty && country.isEmpty {
            return ""
        } else if state.isEmpty && !country.isEmpty {
            return country
        } else if !state.isEmpty && country.isEmpty {
            return state
        } else {
            return array.joined(separator: ", ")
        }
    }
}

struct LocationCardView_Previews: PreviewProvider {
    static var previews: some View {
        LocationCardView(location: Location(name: "New York", lat: 32.1679321, lon: -95.6691277, country: "US", state: "Texas"))
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
    }
}
