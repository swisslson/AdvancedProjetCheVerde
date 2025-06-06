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
    let decsription: String
    
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
}

  let user = User(
            photo: "user4",
            pseudo: "Alizé",
            description: "Voici ma description d'utilisateur.Voici ma description d'utilisateur.Voici ma description d'utilisateur.",
            badges: [
                Badge(name: "débutant", isActive: true, activeImage: "perso1", inactiveImage: "perso-nb1",decsription: "a"),
                Badge(name: "1er participation", isActive: false, activeImage: "perso2", inactiveImage: "perso-nb2",decsription: "a")
            ],
            gallery: ["albumCompte1",
                      "albumCompte2",
                      "albumCompte3",
                      "albumCompte4",
                      "albumCompte5",
                      "albumCompte6"
                
            ]
        )
