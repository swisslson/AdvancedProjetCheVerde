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
        case present = "Présents"
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
            
            
            
            
            HStack(spacing: 12) {
                ForEach(EventFilter.allCases) { filter in
                    Text(filter.rawValue)
                        .font(.system( size: 12))
//                        .padding(.vertical, 8)
//                        .padding(.horizontal, 18)
                        .frame(width: 95, height: 40)
                        .background(selectedFilter == filter ? .violet : .grisClair)

                        .cornerRadius(25)
                        .fontWeight(selectedFilter == filter ? .bold : .regular)
                        .onTapGesture {
                            selectedFilter = filter
                        }
                }
            }

            
            
            
            ScrollView {
                LazyVStack{
                    
                    ForEach(Array(filteredEvents.enumerated()), id: \.element.id) { index, event in
                        let color = eventColors[index % eventColors.count]
                        let imageName = eventImages[index % eventImages.count]
//                        NavigationLink(destination: CreeView(event: event)) {
                            
                            ZStack {
                                Rectangle()
                                    .fill(color)
                                    .frame(height: 90)
                                    .cornerRadius(25)
                                HStack {
                                    Image(imageName)
                                        .resizable()
                                        .frame(width: 60, height: 60)
                                        .padding(.leading, 20)
                                    Spacer()
                                    VStack {
                                        Text(event.titre)
                                            .font(Font.custom("InstrumentSans-Bold", size: 20))
                                            .padding(5)
                                        Text("Date: \(event.date.replacingOccurrences(of: "\n", with: "/"))")
                                            .font(.system(size: 12))
                                    }
                                    Spacer()
                                }
                            }// fin de zstack event
                            .onTapGesture {
                                selectedEvent = IdentifiableEvent(event: event)
                            }
                            .padding(5)
                            
//                        }
                    }
                    
                }
                
                
            }
            
        }
        .fullScreenCover(item: $selectedEvent) { identifiable in
            InfoSelectedEventView(event: identifiable.event)
        }
        .padding()
     
    }
}

#Preview {
    MyEventView()
}
