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
    @State private var selectedEvent: Event? = nil
    
    @State private var cameraPosition: MapCameraPosition = .camera(
        MapCamera(
            centerCoordinate: CLLocationCoordinate2D(latitude: 48.8566, longitude: 2.3522),
            distance: 30000,
            heading: 0,
            pitch: 0
        )
    )
    
    var filteredPlaces: [Event] {
        if let selectedFilter, selectedFilter.name != "Tous" {
            return places.filter { $0.Category == selectedFilter.name }
        } else {
            return places
        }
    }
    
    var body: some View {
        ZStack(alignment: .bottom) { // permet de superposer la fiche event
            VStack(alignment: .leading, spacing: 20) {
                ScrollView(.horizontal) {
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
                    .padding(.leading, 20)
                }
                .scrollIndicators(.hidden)
                
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
                            .onTapGesture {
                                selectedEvent = place
                            }
                        }
                    }
                }
                .mapStyle(.standard(pointsOfInterest: .excludingAll))
            }
            // MODALE – fiche info event
            if let event = selectedEvent {
                PlacesDetailsView(place: event, onDismiss: { selectedEvent = nil })
                .transition(.move(edge: .bottom)) // animation
            }
        }
    }
}

//Preview {
//    MapView()
//}
