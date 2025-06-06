//
//  ContentView.swift
//  botanique
//
//  Created by alize on 02/06/2025.
//
import SwiftUI

struct EventListView: View {
    let events = evenArray
    let arrayFiltres: [String] = ["Tout voir", "Aujourd'hui", "Semaine", "Mois"] //tableau filtres
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            ScrollView(.horizontal) {
                ZStack {//BOUCLE FILTRES
                    HStack(spacing: 12) {
                        ForEach(arrayFiltres, id: \.self) { filtre in FilterView(titre: filtre)
                        }
                    }
                }//FIN FILTRES
            }
            .padding([.leading, .trailing], 20)
            ScrollView {
                VStack(spacing: -22) { //BOUCLE BLOC EVENT
                    ForEach(events) { event in
                        EventView(event: event)
                    }
                }
            }
        }
    }
}
#Preview {
    EventListView()
}
