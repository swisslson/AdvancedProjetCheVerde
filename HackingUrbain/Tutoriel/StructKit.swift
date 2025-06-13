//
//  Tuto.swift
//  HackingUrbain
//
//  Created by Chabane on 10/06/2025.
//

import SwiftUI

struct Tuto: Identifiable {
    var id = UUID()
    var titre: String
    var image: String
    var description: String
}

let tutoList = [
    Tuto(titre: "Végétaliser les surfaces inutilisées en ville", image: "perso1", description: "Transformer les toits, façades, parkings inutilisées et friches urbaines en espaces verts."),
    Tuto(titre: "Prioriser les espèces locales présentes en milieu urbain", image: "perso2", description: "Utiliser des plantes adaptées à l’écosystème local pour favoriser la biodiversité et limiter l’entretien."),
    Tuto(titre: "Assurer un entretien écologique", image: "perso3", description: "Éviter les pesticides, favoriser la gestion différenciée et utiliser l’eau de pluie pour l’arrosage."),
    Tuto(titre: "Fabrication de bombe à graines réglementée", image: "perso4", description: "Respecter les consignes pour une fabrication sécurisée et utile à la biodiversité."),
    Tuto(titre: "Respecter la loi et les règles d'écocivisme", image: "perso5", description: "S’assurer de ne pas végétaliser sans autorisation et respecter l’espace public. Vous êtes responsable de votre action.")
]
