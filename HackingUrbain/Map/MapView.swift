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
    @State private var selectedFilter: Filter? = filtersMap.first(where: { $0.name == "Tout voir" })
    @State private var selectedEvent: Event? = nil
    //Placement de la camera sur la carte (Paris)
    @State private var cameraPosition: MapCameraPosition = .camera(
        MapCamera(
            centerCoordinate: CLLocationCoordinate2D(latitude: 48.8566, longitude: 2.3522),
            distance: 30000,
            heading: 0,
            pitch: 0
        )
    )
    //Logique pour afficher les filtres en fonction des categories d'event
    var filteredPlaces: [Event] {
        if let selectedFilter, selectedFilter.name != "Tout voir" {
            return places.filter { $0.Category == selectedFilter.name }
        } else {
            return places
        }
    }
    
    @Binding var showPicker: Bool;

    var body: some View {
        NavigationStack{
            ZStack(alignment: .bottom) {
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
                                    // Mise à jour du filtre sélectionné au clic
                                    selectedFilter = filter
                                }
                            }
                        }
                        .padding(.leading, 20)
                    }
                    .scrollIndicators(.hidden)
                    //carte
                    Map(position: $cameraPosition) {
                        ForEach(filteredPlaces) { place in
                            //Placement des pins sur la carte en fonction des filtres
                            Annotation("", coordinate: place.coordinate) {
                                VStack {
                                    Image(systemName: "leaf.fill")
                                        .foregroundColor(Color.black)
                                }
                                .padding(6)
                                .background(place.colorMap)
                                .clipShape(Circle())
                                .onTapGesture {
                                   // Affiche la modale en bas quand selection d'un event (pin)
                                    selectedEvent = place
                                }
                            }
                        }
                    }
                    .mapStyle(.standard(pointsOfInterest: .excludingAll))
                }
                // MODALE = bloc infos event
                if let event = selectedEvent {
                   // Lien vers page détail event
                    NavigationLink {
                        InfoSelectedEventView(event: event, showPicker: $showPicker)
                    } label: {
                        // Appel de la vue modale
                        PlacesDetailsView(place: event, onDismiss: { selectedEvent = nil })
                    }
                }
            }
            .toolbar(.hidden)
        }// fin nav
    }
}

#Preview {
    MapView(showPicker: .constant(false))
}
