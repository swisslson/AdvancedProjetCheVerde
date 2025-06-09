//
//  CeRejoindreView.swift
//  HackingUrbain
//
//  Created by cyrilH on 01/06/2025.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    let places = eventArray
    @State private var selectedFilter: Filter? = nil
    
    @State private var cameraPosition: MapCameraPosition = .camera(
        MapCamera(
            centerCoordinate: CLLocationCoordinate2D(latitude: 48.8566, longitude: 2.3522), //coordonnées
            distance: 30000,   // zoom (en metre)
            heading: 0,        // Orientation vers le nord
            pitch: 0,         // Inclinaison vue de dessus
        )
    )
    //Struct pour appliquer filtres par cat
    var filteredPlaces: [Event] {
        if let selectedFilter, selectedFilter.name != "Tous" {
            return places.filter { $0.Category == selectedFilter.name }
        } else {
            return places
        }
    }
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            ScrollView(.horizontal) {
                ZStack {//FILTRES
                    HStack(spacing: 12) {
                        ForEach(filtersMap) { filter in
                                    SelectFilterView(
                                        title: filter.name,
                                        isSelected: filter.id == selectedFilter?.id,
                                        selectedColor: filter.color
                                        )
                                .onTapGesture {
                                    selectedFilter = filter
                                }
                        }
                    }
                }
            }.scrollIndicators(.hidden)
                .padding(.leading, 20)
            Map(position: $cameraPosition) {
                ForEach(filteredPlaces) { place in
                    Annotation("", coordinate: place.coordinate) {
                        VStack {
                            Image(systemName: "leaf.fill")
                                .foregroundColor(Color.white)
                        }
                        .padding(6)
                        .background(place.colorMap)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                }
            }
            .mapStyle(.standard(pointsOfInterest: .excludingAll))
        }
    }
}
#Preview {
    MapView()
}
