//
//  TutorielView.swift
//  HackingUrbain
//
//  Created by alize on 15/06/2025.
//

import SwiftUI

struct TutorielView: View {
    @State private var selectedFilter = "Tous"
    
    private let filters = ["Tous", "Débutant", "Astuces", "Bombes", "Équipement"]
    
    private let kitDemarrage = GuideItem (
        id: 1,
        title: "Kit de Démarrage",
        type: "Débutant",
        isStarterKit: true,
        description: "Découvrez les bases de la botanique urbaine avec ce guide complet pour débutants."
    )
    
    private let tutoriels = [
        GuideItem(id: 2, title: "Plantation en Milieu Urbain", type: "Plantage", description: "Techniques de plantation adaptées aux environnements urbains.", backgroundColor: Color.violet, badgeImage: "star"),
        GuideItem(id: 3, title: "Bombes à Graines", type: "Bombes", description: "Créez vos propres bombes à graines pour végétaliser les espaces abandonnés.", backgroundColor: Color.orangeF, badgeImage: "diamond"),
        GuideItem(id: 4, title: "Choix de l'Équipement", type: "Équipement", description: "Guide complet pour choisir vos outils de jardinage urbain.", backgroundColor: Color.vert, badgeImage: "circle"),
        GuideItem(id: 5, title: "Conseils de Progrès", type: "Progrès", description: "Astuces pour observer et optimiser la croissance de vos plantes.", backgroundColor: Color.violet, badgeImage: "star")
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 14) {
                    Text("Guide pratique")
                        .font(.custom("Instrument Sans", size: 30))
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .padding(.top, 10)
                        .padding(.horizontal, 16)
                        .padding(.bottom, 16)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 12) {
                            Spacer()
                                .frame(width: 4)
                            // Affichage filtres
                            ForEach(filters, id: \.self) { filter in
                                Button(filter) {
                                    selectedFilter = filter
                                }
                                .font(.system(size: 14))
                                .foregroundColor(.black)
                                .fontWeight(selectedFilter == filter ? .bold : .regular)
                                .padding(.horizontal, 20)
                                .padding(.vertical, 10)
                                .background(selectedFilter == filter ? Color.violet : Color.gray.opacity(0.2))
                                .cornerRadius(25)
                            }
                            .padding(.bottom, 5)
                            Spacer()
                                .frame(width: 6)
                        }
                    }
                    
                    // Kit de démarrage
                    VStack {
                        
                        NavigationLink(destination: KitView()) {
                            HStack {
                                Image("perso4")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(height: 130)
                                    .rotationEffect(.degrees(340))
                                    .cornerRadius(12)
                                    .padding(.trailing, 10)
                                VStack(alignment: .leading, spacing: 8) {
                                    
                                    Text(kitDemarrage.title)
                                        .font(.custom("Instrument Sans", size: 20))
                                        .fontWeight(.bold)
                                        .foregroundColor(.black)
                                        .multilineTextAlignment(.leading)
                                        .padding([.bottom, .top], 6)
                                    
                                    Text(kitDemarrage.description)
                                        .font(.custom("SF Pro", size: 14))
                                        .foregroundColor(.black)
                                        .multilineTextAlignment(.leading)
                                        .lineLimit(3)
                                        .padding(.bottom, 10)
                                    Text("Quiz")
                                        .font(.system(size: 14))
                                        .foregroundColor(.black)
                                        .frame(width: 120, height: 32)
                                        .overlay(RoundedRectangle(cornerRadius: 25).stroke(Color.black, lineWidth: 1))
                                        
                                }
                                .frame(height: 160)
                            }
                            .padding(16)
                            .background(Color.vert)
                            .cornerRadius(25)
                        }
                    }.padding(.horizontal, 16)
                    
                    // Tutoriels
                    
                    VStack(alignment: .leading) {
                        
                        LazyVGrid(columns: [GridItem(.flexible(), spacing: 14),GridItem(.flexible())], spacing: 14) {
                            ForEach(filteredTutorials) { tutoriel in
                                NavigationLink(destination: TutoDetailView()) {
                                    VStack(alignment: .leading, spacing: 8) {
                                        // Titre tutoriel
                                        Text(tutoriel.title)
                                            .font(.custom("InstrumentSans-bold", size: 20))
                                            .fontWeight(.bold)
                                            .foregroundColor(.black)
                                            .multilineTextAlignment(.leading)
                                        
                                        // Description tutoriel
                                        Text(tutoriel.description)
                                            .font(.custom("SF Pro", size: 14))
                                            .foregroundColor(.black)
                                            .multilineTextAlignment(.leading)
                                            .lineLimit(3)
                                            .padding(.bottom, 10)
                                        
                                        // Rectangle tag
                                        HStack {
                                            Text("Tutoriel")
                                                .font(.system(size: 14))
                                                .foregroundColor(.black)
                                                .frame(width: 90, height: 32)
                                                .background {
                                                    RoundedRectangle(cornerRadius: 25)
                                                        .foregroundStyle(tutoriel.backgroundColor)
                                                        .overlay {
                                                            RoundedRectangle(cornerRadius: 25)
                                                                .stroke(.black, lineWidth: 1)
                                                        }
                                                }
                                                .padding(.trailing, 15)
                                            Image(tutoriel.badgeImage)
                                                .resizable()
                                                .frame(width: 28, height: 28)
                                        }
                                    }
                                    .padding([.horizontal, .vertical], 10)
                                    .padding(9)
                                    .background(tutoriel.backgroundColor)
                                    .cornerRadius(25)
                                }
                            }
                        }
                    }.padding(.horizontal, 16)
                }
            }
        }
        .tint(.black)
    }
    private var filteredTutorials: [GuideItem] {
        selectedFilter == "Tous" ? tutoriels : tutoriels.filter { $0.type == selectedFilter }
    }
}

struct GuideItem: Identifiable {
    let id: Int
    let title: String
    let type: String
    let isStarterKit: Bool
    let description: String
    let content: String
    let backgroundColor: Color
    let badgeImage: String
    
    init(id: Int, title: String, type: String, isStarterKit: Bool = false, description: String, content: String = "", backgroundColor: Color = .white, badgeImage: String = ""  ) {
        self.id = id
        self.title = title
        self.type = type
        self.isStarterKit = isStarterKit
        self.description = description
        self.content = content
        self.backgroundColor = backgroundColor
        self.badgeImage = badgeImage

    }
}

#Preview {
    TutorielView()
}
