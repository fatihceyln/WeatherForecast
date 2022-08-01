//
//  HomeScreen.swift
//  WeatherForecast
//
//  Created by Fatih Kilit on 27.07.2022.
//

import SwiftUI

struct HomeScreen: View {
    
    @Binding var locations: [Location]
    @Binding var selectedLocation: Location
    
    @State private var noLocation: Bool = false
    
    var save: () -> ()
    
    var body: some View {
        ZStack(alignment: .top) {
            if !locations.isEmpty {
                ScrollView(.init()) {
                    TabView(selection: $selectedLocation) {
                        ForEach(locations, id: \.self) { location in
                            WeatherInfoView(location: location, locationCount: locations.count, locationIndex: locations.firstIndex(of: location) ?? 0)
                        }
                    }
                    .tabViewStyle(.page(indexDisplayMode: .never))
                }
                .edgesIgnoringSafeArea(.all)
                
                tabBarItems
            } else {
                tabBarItems
                    .frame(maxHeight: .infinity, alignment: .top)
                
                VStack {
                    Text("No location")
                        .foregroundColor(.gray)
                    
                    Text("Tap plus button to add one")
                        .bold()
                }
                .frame(maxHeight: .infinity, alignment: .center)
            }
        }
        .onAppear(perform: {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                if locations.isEmpty {
                    noLocation.toggle()
                }
            }

            // fixing TabView issue
            let temp = selectedLocation
            selectedLocation = Location()
            selectedLocation = temp
        })
        .overlay(content: {
            NavigationLink("", isActive: $noLocation) {
                SearchScreen(locations: $locations, selectedLocation: $selectedLocation) {
                    save()
                }
            }
        })
        .navigationBarHidden(true)
    }
    
    var tabBarItems: some View {
        HStack() {
            Image(systemName: "info")
                .font(.body.bold())
                .foregroundColor(.white)
                .frame(width: 18, height: 18)
                .padding(10)
                .background {
                    Circle()
                        .fill(Color.blue.opacity(0.7))
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .frame(maxHeight: .infinity, alignment: .bottom)
                .padding()
            
            NavigationLink {
                SearchScreen(locations: $locations, selectedLocation: $selectedLocation) {
                    save()
                }
            } label: {
                Image(systemName: "plus")
                    .font(.body.bold())
                    .foregroundColor(.white)
                    .frame(width: 18, height: 18)
                    .padding(10)
                    .background {
                        Circle()
                            .fill(Color.blue.opacity(0.7))
                    }
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .frame(maxHeight: .infinity, alignment: .bottom)
                    .padding()
            }
        }
        .frame(height: 100)
        .frame(maxWidth: .infinity)
        .background {
            VStack(spacing: 0) {
                Color("blue")
                    .brightness(0.2)
                
                Divider()
            }
        }
        .ignoresSafeArea()
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeScreen(locations: .constant([]), selectedLocation: .constant(Location())) {}
                .preferredColorScheme(.dark)
        }
    }
}
