//
//  StructEvent.swift
//  botanique
//
//  Created by alize on 02/06/2025.
//
import SwiftUI
import CoreLocation

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
    var coordinate: CLLocationCoordinate2D
    var Category: String
    var colorMap: Color
    var dateEvent: Date
    var adress: String
    var date2: String
    //ajouter image pour user ?
}
    let eventArray: [Event] = [
        Event(
            date: "18\n06",
            titre: "Atelier bouturage",
            description: "Rejoignez-nous pour un atelier de bouturage participatif en plein cœur de la ville ! Venez apprendre à multiplier vos plantes à partir de simples tiges et à faire repousser la nature où on ne l’attend plus. Un moment convivial pour échanger graines, savoir-faire et bonnes ondes, dans la pure tradition Green Guerilla. Aucune expérience requise, juste vos mains et l’envie de verdir le béton !",
            heure: "17h00",
            isFull: true,
            status: "Complet",
            NbUsers: "+5",
            color: Color("vert"),
            coordinate: CLLocationCoordinate2D(latitude: 48.8976, longitude: 2.3444), //Porte de Clignancourt
            Category: "Ateliers",
            colorMap: Color("vert"),
            dateEvent: Date(),
            adress : "20 rue des bosquets, 75017 Paris",
            date2: "18/06/2025"
            
        ),
        Event(
            date: "18\n06",
            titre: "Jardinons la ville",
            description: "Antehac quam insontibus placentia regni leviter cruoris Hannibaliano clandestinos turgida rumigerulos.",
            heure: "11h00",
            isFull: true,
            status: "2 places",
            NbUsers: "+7",
            color: Color("violet"),
            coordinate: CLLocationCoordinate2D(latitude: 48.8400, longitude: 2.3655), //Austerlitz
            Category: "Actions",
            colorMap: Color("violet"),
            dateEvent: Date(),
            adress : "56 rue de la rapée, 75012 Paris",
            date2: "18/06/2025"
            
        ),
        Event(
            date: "18\n06",
            titre: "Session Paris Green",
            description: "Antehac quam insontibus placentia regni leviter cruoris Hannibaliano clandestinos turgida rumigerulos.",
            heure: "14h30",
            isFull: true,
            status: "2 places",
            NbUsers: "+2",
            color: Color("orangeF"),
            coordinate: CLLocationCoordinate2D(latitude: 48.8733, longitude: 2.3895), // Ménilmontant
            Category: "Actions",
            colorMap: Color("orangeF"),
            dateEvent: Date(),
            adress : "67 rue Menilmontant, 75020 Paris",
            date2: "18/06/2025"
        ),
        Event(
            date: "23\n06",
            titre: "Atelier bombes de Graines",
            description: "Venez mener la green guerilla avec nous en fabriquant vos Seed bombs Envie de transformer la ville avec nous ? Rejoignez notre atelier de fabrication de seed bombs 💣 et devenez acteur·rice du changement ! ",
            heure: "17h00",
            isFull: true,
            status: "Complet",
            NbUsers: "+1",
            color: Color("vert"),
            coordinate: CLLocationCoordinate2D(latitude: 48.8638, longitude: 2.4433), //Haut Montreuil
            Category: "Ateliers",
            colorMap: Color("vert"),
            dateEvent: Calendar.current.date(from: DateComponents(year: 2025, month: 6, day: 23))!,
            adress : "134 rue de Paris, 93000 Montreuil",
            date2: "23/06/2025"
        ),
        Event(
            date: "23\n06",
            titre: "Session Paris Green",
            description: "Antehac quam insontibus placentia regni leviter cruoris Hannibaliano clandestinos turgida rumigerulos.",
            heure: "17h00",
            isFull: true,
            status: "Complet",
            NbUsers: "+1",
            color: Color("violet"),
            coordinate: CLLocationCoordinate2D(latitude: 48.8545, longitude: 2.4290), // Robespierre
            Category: "Photos",
            colorMap: Color("violet"),
            dateEvent: Calendar.current.date(from: DateComponents(year: 2025, month: 6, day: 23))!,
            adress: "64 rue de Paris, 93000 Montreuil",
            date2: "23/06/2025"
        ),
        Event(
            date: "23\n06",
            titre: "Bouges ton douze",
            description: "Antehac quam insontibus placentia regni leviter cruoris Hannibaliano clandestinos turgida rumigerulos.",
            heure: "17h00",
            isFull: true,
            status: "Complet",
            NbUsers: "+1",
            color: Color("orangeF"),
            coordinate: CLLocationCoordinate2D(latitude: 48.8352, longitude:  2.3877), //Bercy
            Category: "Photos",
            colorMap: Color("orangeF"),
            dateEvent: Calendar.current.date(from: DateComponents(year: 2025, month: 6, day: 23))!,
            adress : "5 rue de Bercy, paris 12",
            date2: "23/06/2025"
        ),
        Event(
            date: "23\n06",
            titre: "Titre",
            description: "Antehac quam insontibus placentia regni leviter cruoris Hannibaliano clandestinos turgida rumigerulos.",
            heure: "17h00",
            isFull: true,
            status: "Complet",
            NbUsers: "+1",
            color: Color("vert"),
            coordinate: CLLocationCoordinate2D(latitude: 48.8407, longitude: 2.3211), //Montparnasse
            Category: "Photos",
            colorMap: Color("vert"),
            dateEvent: Calendar.current.date(from: DateComponents(year: 2025, month: 6, day: 23))!,
            adress : "4 boulevard Montparnasse, paris 14",
            date2: "23/06/2025"
        ),
        Event(
            date: "23\n06",
            titre: "Atelier",
            description: "Antehac quam insontibus placentia regni leviter cruoris Hannibaliano clandestinos turgida rumigerulos.",
            heure: "17h00",
            isFull: true,
            status: "Complet",
            NbUsers: "+1",
            color: Color("violet"),
            coordinate: CLLocationCoordinate2D(latitude: 48.8691, longitude: 2.3632), //République
            Category: "Ateliers",
            colorMap: Color("violet"),
            dateEvent: Calendar.current.date(from: DateComponents(year: 2025, month: 6, day: 23))!,
            adress : "134 avenue de la Republique, Paris 4",
            date2: "23/06/2025"
        ),
        Event(
            date: "23\n06",
            titre: "Atelier",
            description: "Antehac quam insontibus placentia regni leviter cruoris Hannibaliano clandestinos turgida rumigerulos.",
            heure: "17h00",
            isFull: true,
            status: "Complet",
            NbUsers: "+1",
            color: Color("orangeF"),
            coordinate: CLLocationCoordinate2D(latitude: 48.8350, longitude: 2.2934),//convention
            Category: "Ateliers",
            colorMap: Color("orangeF"),
            dateEvent: Calendar.current.date(from: DateComponents(year: 2025, month: 6, day: 23))!,
            adress : "14 avenue Convention, Paris 15",
            date2: "23/06/2025"
        ),
        Event(
            date: "23\n06",
            titre: "Ateliers découverte",
            description: "Antehac quam insontibus placentia regni leviter cruoris Hannibaliano clandestinos turgida rumigerulos.",
            heure: "17h00",
            isFull: true,
            status: "Complet",
            NbUsers: "+1",
            color: Color("vert"),
            coordinate: CLLocationCoordinate2D(latitude: 2.3488, longitude: 2.3488), //quartier latin
            Category: "Ateliers",
            colorMap: Color("vert"),
            dateEvent: Calendar.current.date(from: DateComponents(year: 2025, month: 6, day: 23))!,
            adress : "39 rue des Ecoles, 75006 Paris",
            date2: "23/06/2025"
        ),
        Event(
            date: "23\n06",
            titre: "Titre",
            description: "Antehac quam insontibus placentia regni leviter cruoris Hannibaliano clandestinos turgida rumigerulos.",
            heure: "17h00",
            isFull: true,
            status: "Complet",
            NbUsers: "+1",
            color: Color("violet"),
            coordinate: CLLocationCoordinate2D(latitude: 48.8465, longitude: 2.2591), //Auteuil
            Category: "Actions",
            colorMap: Color("violet"),
            dateEvent: Calendar.current.date(from: DateComponents(year: 2025, month: 6, day: 23))!,
            adress : "23 rue du Four, 75016 Paris",
            date2: "23/06/2025"
        ),
        Event(
            date: "23\n06",
            titre: "Titre",
            description: "Antehac quam insontibus placentia regni leviter cruoris Hannibaliano clandestinos turgida rumigerulos.",
            heure: "17h00",
            isFull: true,
            status: "Complet",
            NbUsers: "+1",
            color: Color("orangeF"),
            coordinate: CLLocationCoordinate2D(latitude: 48.8702, longitude: 2.3242), //Madeleine
            Category: "Photos",
            colorMap: Color("orangeF"),
            dateEvent: Calendar.current.date(from: DateComponents(year: 2025, month: 6, day: 23))!,
            adress : "22 rue des Martyrs, 75008 Paris",
            date2: "23/06/2025"
        ),
        Event(
            date: "23\n06",
            titre: "EnGraines-toi",
            description: "Antehac quam insontibus placentia regni leviter cruoris Hannibaliano clandestinos turgida rumigerulos.",
            heure: "17h00",
            isFull: true,
            status: "Complet",
            NbUsers: "+1",
            color: Color("vert"),
            coordinate: CLLocationCoordinate2D(latitude: 48.8912, longitude: 2.3015), //Levallois
            Category: "Actions",
            colorMap: Color("vert"),
            dateEvent: Calendar.current.date(from: DateComponents(year: 2025, month: 6, day: 23))!,
            adress : "89 rue du bois, 75016 Paris",
            date2: "23/06/2025"
        ),
    ]
