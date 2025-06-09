//
//  FilterView.swift
//  HackingUrbain
//
//  Created by alize on 09/06/2025.
//

import SwiftUI

struct Filter: Identifiable, Equatable {
    let id = UUID()
    let name: String
    let color: Color
}

let filtersMap: [Filter] = [
    Filter(name: "Tous", color: Color("vert")),
    Filter(name: "Actions", color: Color("violet")),
    Filter(name: "Ateliers", color: Color("vert")),
    Filter(name: "Photos", color: Color("orangeF")),
]

let filtersDate: [Filter] = [
    Filter(name: "Tous", color: Color("vert")),
    Filter(name: "Aujourd'hui", color: Color("violet")),
    Filter(name: "Demain", color: Color("violet")),
    Filter(name: "Semaine", color: Color("violet")),
    Filter(name: "Mois", color: Color("violet")),
]

