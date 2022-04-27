//
//  ManageCitiesView.swift
//  WeatherForecast
//
//  Created by Fatih Kilit on 27.04.2022.
//

import SwiftUI

struct ManageCitiesView: View {
    var body: some View {
        ZStack {
            Color.pink.opacity(0.3)
                .ignoresSafeArea()
            
            Text("MANAGE CITIES")
                .font(.title)
                .bold()
                .padding()
                .background(Material.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 10))
                .padding()
        }
    }
}

struct ManageCitiesView_Previews: PreviewProvider {
    static var previews: some View {
        ManageCitiesView()
    }
}
