//
//  MyEventView.swift
//  HackingUrbain
//
//  Created by cyrilH on 09/06/2025.
//

import SwiftUI

struct MyEventView: View {
    
    @State private var selectedFilter: EventFilter = .present
    //    var user: User
    let eventColors: [Color] = [.vert, .violet, .orangeF]
    let eventImages: [String] = ["star", "diamond", "circle"]
    
    @Binding var showPicker: Bool;
    
    func dateKey(from string: String) -> Int {
        
        let cleanString = string.replacingOccurrences(of: "\n", with: "/")
        let components = cleanString.split(separator: "/")
        
        if components.count == 2,
           let day = Int(components[0]),
           let month = Int(components[1]) {
            return month * 100 + day
        }
        return 0
    }
    
    var filteredEvents: [Event] {
        let todayKey = dateKey(from: "19/06")
        return user.myEvents.filter { event in
            let eventKey = dateKey(from: event.date)
            switch selectedFilter {
            case .present:
                return eventKey >= todayKey
            case .passe:
                return eventKey < todayKey
            }
        }
    }
    
    enum EventFilter: String, CaseIterable, Identifiable {
        case present = "À venir"
        case passe = "Passés"
        
        var id: String { self.rawValue }
    }
    
    struct IdentifiableEvent: Identifiable {
        let id = UUID()
        let event: Event
    }
    @State private var selectedEvent: IdentifiableEvent? = nil
    
    var body: some View {
        VStack {
            
            Text("Mes événements")
                .font(Font.custom("InstrumentSans-Bold", size: 30))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 20)
                .padding(.bottom, 20)
            
            HStack(spacing: 12) {
                ForEach(EventFilter.allCases) { filter in
                    Text(filter.rawValue)
                        .font(.system(size: 12))
                        .frame(width: 95, height: 40)
                        .background(selectedFilter == filter ? .violet : .grisClair)
                        .cornerRadius(25)
                        .fontWeight(selectedFilter == filter ? .bold : .regular)
                        .onTapGesture {
                            selectedFilter = filter
                        }
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 20)
            .padding(.bottom, 16)
            
            ScrollView {
                LazyVStack{
                    
                    ForEach(Array(filteredEvents.enumerated()), id: \.element.id) { index, event in
                        let color = eventColors[index % eventColors.count]
                        let imageName = eventImages[index % eventImages.count]
                        
                        ZStack {
                            Rectangle()
                                .fill(color)
                                .frame(height: 110)
                                .cornerRadius(25)
                            
                            HStack(spacing: 25) {
                                Image(imageName)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 60, height: 60)
                                
                                VStack(alignment: .leading, spacing: 4) {
                                    Text(event.titre)
                                        .font(Font.custom("InstrumentSans-Bold", size: 20))
                                        .foregroundColor(.black)
                                        .padding(.bottom, 4)
                                    Text("\(event.date2) - \(event.heure)")
                                        .font(.system(size: 14))
                                        .foregroundColor(.black)
                                }
                                Spacer()
                            }
                            .padding(.horizontal, 20)
                        }
                        .onTapGesture {
                            selectedEvent = IdentifiableEvent(event: event)
                        }
                        .padding(.bottom, 10)
                    }
                }
                .fullScreenCover(item: $selectedEvent) { identifiable in
                    InfoSelectedEventView(
                        event: identifiable.event, showPicker: .constant(true)
                    )
                }
                .padding()
            }
        }
    }
}
#Preview {
    MyEventView(showPicker: .constant(false))
}
