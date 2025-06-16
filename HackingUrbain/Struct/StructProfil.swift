//
//  Struct.swift
//  HackingUrbain
//
//  Created by cyrilH on 01/06/2025.
//

import Foundation
import UIKit
import SwiftUICore

struct Badge: Identifiable {
    let id = UUID()
    let name: String
    let isActive: Bool
    let activeImage: String
    let inactiveImage: String
    let description: String
    
    var imageName: String {
        isActive ? activeImage : inactiveImage
    }
}

struct User {
    var photo: String
    var pseudo: String
    var description: String
    var badges: [Badge]
    var gallery: [String]
    var myEvents: [Event]
}

  let user = User(
            photo: "user4",
            pseudo: "Alizé",
            description: "Voici ma description d'utilisateur.Voici ma description d'utilisateur.Voici ma description d'utilisateur.",
            badges: [
                Badge(name: "Débutant", isActive: true, activeImage: "perso9", inactiveImage: "perso-nb9", description: "Pour obtenir ce badge, il faut faire le kit de démarrage et valider le quiz. "),
                Badge(name: "1er participation", isActive: false, activeImage: "perso1", inactiveImage: "perso-nb1", description: "Pour obtenir ce badge, il faut participer à au moins un événement."),
                Badge(name: "1er création", isActive: false, activeImage: "perso6", inactiveImage: "perso-nb6", description: "Pour obtenir ce badge, il faut créer au moins un événement."),
                
            ],
            gallery: ["albumCompte1",
                      "albumCompte2",
                      "albumCompte3",
                      "albumCompte4",
                      "albumCompte5",
                      "albumCompte6"
                
            ]
            ,
            myEvents: [eventArray[1], eventArray[3], eventArray[2],eventArray[4]]
        )
