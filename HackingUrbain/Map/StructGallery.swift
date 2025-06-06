//
//  StructGallery.swift
//  HackingUrbain
//
//  Created by alize on 05/06/2025.
//

import SwiftUI

struct Gallery: Identifiable {
    let id = UUID()
    let adresse: String
    let image: String
    let color: Color
}

let galleryArray: [Gallery] = [
    Gallery(adresse: "13, rue de la Paix", image: "gallery1", color: .vert),
    Gallery(adresse: "46, rue de la Liberté", image: "bonus2", color: .orangeF),
    Gallery(adresse: "79, rue de la Défense", image: "gallery3", color: .violet),
    Gallery(adresse: "79, rue de la Défense", image: "gallery4", color: .vert),
    Gallery(adresse: "13, rue de la Paix", image: "bonus1", color: .vert),
    Gallery(adresse: "46, rue de la Liberté", image: "gallery6", color: .orangeF),
    Gallery(adresse: "79, rue de la Défense", image: "gallery8", color: .orangeF),
    Gallery(adresse: "79, rue de la Défense", image: "gallery7", color: .violet),
]
