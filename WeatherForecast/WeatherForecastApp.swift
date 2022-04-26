//
//  WeatherForecastApp.swift
//  WeatherForecast
//
//  Created by Fatih Kilit on 22.04.2022.
//

import SwiftUI

@main
struct WeatherForecastApp: App {
    @StateObject var vm: HomeViewModel = HomeViewModel()
    @State var showHomeView: Bool = false
    var body: some Scene {
        WindowGroup {
            ZStack {
                if showHomeView {
                    HomeView()
                        .transition(AnyTransition.opacity.animation(.spring()))
                        .environmentObject(vm)
                }
                else {
                    EmptyView()
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    withAnimation(.spring()) {
                        showHomeView.toggle()
                    }
                }
            }
        }
    }
}
