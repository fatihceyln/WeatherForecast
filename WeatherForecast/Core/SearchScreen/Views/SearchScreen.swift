//
//  SearchScreen.swift
//  WeatherForecast
//
//  Created by Fatih Kilit on 27.07.2022.
//

import SwiftUI

struct SearchScreen: View {
    @StateObject private var vm: SearchViewModel = SearchViewModel()
    @Environment(\.dismiss) private var dismiss
    
    @Binding var locations: [Location]
    @Binding var selectedLocation: Location
    
    @State private var nonbindingLocations: [Location] = []
    
    @State private var noLocationLightAnimation: Bool = false
    @State private var noLocationShakeAnimation: Bool = false
    
    @Environment(\.scenePhase) private var scenePhase
    
    var save: () -> ()
    
    var body: some View {
        VStack {
            searchInputView
            
            if vm.textField.isEmpty {
                savedLocationsView
            } else {
                searchedLocationsView
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Locations")
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    if !nonbindingLocations.isEmpty {
                        locations = nonbindingLocations
                        save()
                        dismiss()
                    } else {
                        withAnimation {
                            noLocationLightAnimation = true
                            noLocationShakeAnimation = true
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                withAnimation {
                                    noLocationLightAnimation = false
                                }
                            }
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                withAnimation(.default.speed(2)) {
                                    noLocationShakeAnimation = false
                                }
                            }
                        }
                    }
                } label: {
                    Image(systemName: "chevron.left")
                        .frame(width: 18, height: 18)
                        .padding(10)
                        .background {
                            Circle()
                                .fill(Color.gray.opacity(0.3))
                        }
                }
                .foregroundColor(.white)
                .font(.body.bold())
            }
        }
        .onAppear {
            nonbindingLocations = locations
        }
        .onDisappear {
            if scenePhase == .inactive {
                locations = nonbindingLocations
                save()
            }
        }
    }
    
    var searchInputView: some View {
        HStack {
            HStack {
                Image(systemName: "magnifyingglass")
                
                TextField("Search city", text: $vm.textField.animation())
                    .disableAutocorrection(true)
            }
            .padding()
            .background {
                RoundedRectangle(cornerRadius: 10)
                    .fill(.gray.opacity(0.2))
                    .shadow(color: vm.textField.isEmpty ? .clear : .white.opacity(0.3) ,radius: 10)
            }
            .padding(vm.textField.isEmpty ? .all : [.leading, .vertical])
            
            if !vm.textField.isEmpty {
                Button {
                    withAnimation {
                        self.vm.textField = ""
                    }
                    self.vm.locations = []
                } label: {
                    Text("Cancel")
                        .font(.body)
                }
                .padding(.trailing)
                .frame(height: 30)
                .transition(.move(edge: .trailing))
            }
        }
        .offset(x: noLocationShakeAnimation ? 10 : 0)
        .brightness(noLocationLightAnimation ? 0.8 : 0)
        .shadow(color: noLocationLightAnimation ? .red : .clear, radius: 10)
    }
    var savedLocationsView: some View {
        ZStack {
            if nonbindingLocations.isEmpty {
                Text("No location")
                    .frame(maxHeight: .infinity)
            } else {
                List {
                    ForEach(nonbindingLocations, id: \.self) { model in
                        LocationCardView(location: model)
                            .listRowBackground(Color.gray.opacity(0.1))
                            .onTapGesture {
                                
                                if locations != nonbindingLocations {
                                    locations = nonbindingLocations
                                    save()
                                }
                                
                                selectedLocation = model
                                
                                dismiss()
                            }
                    }
                    .onDelete { indexSet in
                        if let index = indexSet.first, nonbindingLocations[index] == selectedLocation {
                            nonbindingLocations.remove(atOffsets: indexSet)
                            selectedLocation = nonbindingLocations.first ?? Location()
                        } else {
                            nonbindingLocations.remove(atOffsets: indexSet)
                        }
                    }
                }
            }
        }
    }
    
    var searchedLocationsView: some View {
        List {
            ForEach(vm.locations, id: \.self) { model in
                LocationCardView(location: model)
                    .listRowBackground(Color.gray.opacity(0.1))
                    .overlay(alignment: .trailing) {
                        Image(systemName: nonbindingLocations.contains(where: {$0 == model}) ? "minus" : "plus")
                            .frame(width: 18, height: 18)
                            .padding(10)
                            .background {
                                Circle()
                                    .fill(Color.gray.opacity(0.3))
                            }
                            .onTapGesture {
                                //                                    updateSavedLocation(model: model)
                                updateSavedLocation(model: model)
                            }
                    }
            }
        }
    }
    
    private func updateSavedLocation(model: Location) {
        if nonbindingLocations.contains(model) {
            if let index = nonbindingLocations.firstIndex(where: {$0 == model}) {
                self.nonbindingLocations.remove(at: index)
            }
        } else {
            nonbindingLocations.append(model)
            // if it's first location, then update selectedLocation
            if nonbindingLocations.count == 1 {
                self.selectedLocation = nonbindingLocations[0]
            }
        }
    }
}

struct SearchScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SearchScreen(locations: .constant([]), selectedLocation: .constant(Location(name: nil, lat: nil, lon: nil, country: nil, state: nil))) {}
                .preferredColorScheme(.dark)
        }
    }
}
