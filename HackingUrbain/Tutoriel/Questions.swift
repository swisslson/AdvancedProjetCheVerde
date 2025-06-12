//
//  Questions.swift
//  HackingUrbain
//
//  Created by Chabane on 11/06/2025.
//

import Foundation

struct Question {
    let text: String
    let options: [String]
    let correctIndex: Int
}

let questions: [Question] = [
    Question(text: "Que puis-je végétaliser en ville ?", options: ["Les friches urbaines", "Les espaces verts", "Les toits de bâtiments", "Les parkings abandonnés"], correctIndex: 0),
    Question(text: "Comment favoriser la biodiversité ?", options: ["En plantant des arbres à croissance rapide", "En utilisant des plantes adaptées à l’écosystème", "En créant des étangs artificiels", "En cultivant uniquement des espèces exotiques"], correctIndex: 1),
    Question(text: "Comment assurer un entretien écologique ?", options: ["En utilisant des produits chimiques", "En arrosant uniquement avec de l’eau de ville", "En évitant les pesticides et favorisant l’eau de pluie", "En coupant régulièrement les plantes"], correctIndex: 2),
    Question(text: "Quel élément naturel pour une bombe de jardinage ?", options: ["Du terreau", "Des graines", "Des morceaux de plastique", "De l’engrais chimique"], correctIndex: 1),
    Question(text: "Puis-je végétaliser comme bon me semble ?", options: ["Oui, il suffit de planter", "Oui, avec des plantes locales", "Non, seulement sur espaces urbains abandonnés", "Non, il faut l'autorisation de la mairie"], correctIndex: 2)
]
