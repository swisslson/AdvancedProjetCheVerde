//
//  ContentView.swift
//  botanique
//
//  Created by alize on 02/06/2025.
//
import SwiftUI

struct EventListView: View {
    let events = eventArray
    
    // Par default selection filtre = "Tout voir"
    @State private var selectedFilter: Filter = filtersDate[0]
    @State private var navigationPath = NavigationPath() // chemin de navigation
    
    //Logique pour appliquer filtres par date
    var filteredEvents: [Event]  {
        let now = Date()
        let calendar = Calendar.current
        
        switch selectedFilter.name {
        case "Aujourd'hui":
            return events.filter { calendar.isDate($0.dateEvent, inSameDayAs: now) }
        case "Demain":
            let tomorrow = calendar.date(byAdding: .day, value: 1, to: now)!
            return events.filter { calendar.isDate($0.dateEvent, inSameDayAs: tomorrow) }
        case "Semaine":
            return events.filter { calendar.isDate($0.dateEvent, equalTo: now, toGranularity: .weekOfYear)}
        case "Mois":
            return events.filter { calendar.isDate($0.dateEvent, equalTo: now, toGranularity: .month)}
        default: // "Tous"
            return events
        }
    }
    var body: some View {
        NavigationStack(path: $navigationPath) {
            VStack(alignment: .leading, spacing: 20) {
                ScrollView(.horizontal) {
                    ZStack {//BOUCLE FILTRES
                        HStack(spacing: 12) {
                            ForEach(filtersDate) { filter in
                                SelectFilterView(
                                    title: filter.name,
                                    isSelected: filter == selectedFilter,
                                    selectedColor: filter.color
                                )
                                .onTapGesture {
                                    selectedFilter = filter
                                }
                            }
                        }
                    }//FIN FILTRES
                }
                .scrollIndicators(.hidden)
                .padding(.leading, 20)
                if filteredEvents.isEmpty {
                    Spacer()
                    Text("Pas d'évènements pour le moment.")
                        .font(.system(size: 14))
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity, alignment: .center)
                    Spacer()
                } else {
                    ScrollView {
                        VStack(spacing: -35) {
                            //BOUCLE BLOC EVENT
                            ForEach(filteredEvents) { event in
                                EventView(event: event)
                            }
                        }
                    }
                }
            }
            .foregroundStyle(.black)
        }//navigationStack
    }
}

#Preview {
    EventListView()
}
