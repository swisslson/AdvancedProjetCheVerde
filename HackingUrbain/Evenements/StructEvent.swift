//
//  StructEvent.swift
//  botanique
//
//  Created by alize on 02/06/2025.
//
import SwiftUI

struct Event: Identifiable {
    let id = UUID()
    let date: String
    let titre: String
    let description: String
    let heure: String
    let isFull: Bool
    let status: String
    let NbUsers: String
    let color: Color
    //ajouter image pour user ?
}

let evenArray: [Event] = [
    
    Event(
        date: "23\n05",
        titre: "Atelier bouturage",
        description: "Rejoignez-nous pour un atelier de bouturage participatif en plein cœur de la ville ! Venez apprendre à multiplier vos plantes à partir de simples tiges et à faire repousser la nature où on ne l’attend plus. Un moment convivial pour échanger graines, savoir-faire et bonnes ondes, dans la pure tradition Green Guerilla. Aucune expérience requise, juste vos mains et l’envie de verdir le béton !",
        heure: "17h00",
        isFull: true,
        status: "Complet",
        NbUsers: "+5",
        color: Color("vert")
    ),
    Event(
        date: "12\n06",
        titre: "Atelier bouturage",
        description: "Antehac quam insontibus placentia regni leviter cruoris Hannibaliano clandestinos turgida rumigerulos.",
        heure: "11h00",
        isFull: true,
        status: "2 places",
        NbUsers: "+7",
        color: Color("violet")
    ),
    Event(
        date: "13\n06",
        titre: "Atelier bouturage",
        description: "Antehac quam insontibus placentia regni leviter cruoris Hannibaliano clandestinos turgida rumigerulos.",
        heure: "14h30",
        isFull: true,
        status: "2 places",
        NbUsers: "+2",
        color: Color("orangeF")
    ),
    Event(
        date: "23\n06",
        titre: "Atelier Bombes de Graines",
        description: "Venez mener la green guerilla avec nous en fabriquant vos Seed bombs Envie de transformer la ville avec nous ? Rejoignez notre atelier de fabrication de seed bombs 💣 et devenez acteur·rice du changement ! ",
        heure: "17h00",
        isFull: true,
        status: "Complet",
        NbUsers: "+1",
        color: Color("vert")
    ),
    
]

