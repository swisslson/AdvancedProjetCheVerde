// Page d'onboarding (à implémenter)
struct OnboardingView: View {
    var body: some View {
        Text("Page d'onboarding à venir...")
            .font(.custom("SF Pro", size: 12))
            .foregroundColor(.black)
            .navigationTitle("Kit de démarrage")
            .navigationBarTitleDisplayMode(.large)
    }
}

import SwiftUI

struct TutorielView: View {
    @State private var selectedFilter = "Tous"
    
    private let filters = ["Tous", "Débutant", "Plantage", "Bombes", "Équipement"]
    
    private let kitDemarrage = GuideItem(
        id: 1,
        title: "Kit de Démarrage",
        type: "Débutant",
        isStarterKit: true,
        description: "Découvrez les bases de la botanique urbaine avec ce guide complet pour débutants."
    )
    
    private let tutoriels = [
        GuideItem(id: 2, title: "Plantation en Milieu Urbain", type: "Plantage", description: "Techniques de plantation adaptées aux environnements urbains.", backgroundColor: Color.violetApp, badgeImage: "star"),
        GuideItem(id: 3, title: "Bombes à Graines", type: "Bombes", description: "Créez vos propres bombes à graines pour végétaliser les espaces abandonnés.", backgroundColor: Color.orangeApp, badgeImage: "diamond"),
        GuideItem(id: 4, title: "Choix de l'Équipement", type: "Équipement", description: "Guide complet pour choisir vos outils de jardinage urbain.", backgroundColor: Color.vertApp, badgeImage: "circle"),
        GuideItem(id: 5, title: "Conseils de Progrès", type: "Progrès", description: "Astuces pour observer et optimiser la croissance de vos plantes.", backgroundColor: Color.violetApp, badgeImage: "star")
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 14) {
                    // Titre principal - Grand titre
                    Text("Guide pratique")
                        .font(.custom("Instrument Sans", size: 32))
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .padding(.top, 10)
                        .padding(.horizontal, 16)
                        .padding(.bottom, 16)
                    // Filtres - Petit titre
                    ScrollView(.horizontal, showsIndicators: false) {
                       
                        HStack(spacing: 12) {
                            Spacer()
                                .frame(width: 4)
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
                        
                        NavigationLink(destination: OnboardingView()) {
                            HStack {
                                Image("perso4")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(height: 140)
                                    .rotationEffect(.degrees(340))
                                    .cornerRadius(12)
                                
                                VStack(alignment: .leading, spacing: 8) {
                                    // Titre kit - Sous titre
                                    Text(kitDemarrage.title)
                                        .font(.custom("Instrument Sans", size: 20))
                                        .fontWeight(.bold)
                                        .foregroundColor(.black)
                                        .multilineTextAlignment(.leading)
                                        .padding([.bottom, .top], 6)
                                    // Description kit - Texte courant
                                    Text(kitDemarrage.description)
                                        .font(.custom("SF Pro", size: 12))
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
                                NavigationLink(destination: GuideDetailView(guide: tutoriel)) {
                                    VStack(alignment: .leading, spacing: 8) {
                                        // Titre tutoriel - Sous titre
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

struct GuideDetailView: View {
    let guide: GuideItem
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                // Contenu détail - Texte courant
                Text("Contenu détaillé du tutoriel à venir...")
                    .font(.custom("SF Pro", size: 12))
                    .foregroundColor(.black)
            }
            .padding()
        }
        .navigationTitle(guide.title)
        .navigationBarTitleDisplayMode(.large)
    }
}

extension Color {
    static let orangeApp = Color(red: 253/255, green: 161/255, blue: 78/255)
    static let violetApp = Color(red: 197/255, green: 153/255, blue: 255/255)
    static let vertApp = Color(red: 205/255, green: 247/255, blue: 77/255)
}

#Preview {
    TutorielView()
}
