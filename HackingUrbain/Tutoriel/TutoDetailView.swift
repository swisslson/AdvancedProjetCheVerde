import SwiftUI

struct TutoDetailView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                
                // SECTION 1 - En-tête
                HStack(alignment: .bottom, spacing: 12) {
                    Text("Bombes à Graines")
                        .font(.custom("Instrument Sans", size: 30))
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                    
                    Spacer(minLength: 60)
                    Text("DIY Écolo")
                        .font(.system(size: 14))
                        .foregroundColor(.black)
                        .frame(width: 120, height: 32)
                        .overlay(RoundedRectangle(cornerRadius: 25).stroke(Color.black, lineWidth: 1))
                    
                    Spacer()
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 110) // Padding pour le contenu, pas pour le background
                .padding(.horizontal, 20)
                .padding(.bottom, 60)
                .background(
                    Color.vert
                        .ignoresSafeArea(.container, edges: .top) // Le background remonte jusqu'en haut
                )
                
                // SECTION 2
                VStack(spacing: 0) {
                    // Partie haute 
                    VStack(alignment: .leading, spacing: 20) {
                        Text("Ingrédients nécessaires")
                            .font(.custom("Instrument Sans", size: 20))
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                        
                        Text("Les bombes à graines sont un moyen fantastique de végétaliser les espaces urbains. Voici tout ce dont vous aurez besoin")
                            .font(.custom("SF Pro", size: 14))
                            .foregroundColor(.black)
                            .lineSpacing(4)
                        
                        Text("**Liste des ingrédients :**\n• 3 parts d'argile en poudre\n• 1 part de compost ou terreau\n• 1 part de graines\n")
                            .font(.custom("SF Pro", size: 14))
                            .foregroundColor(.black)
                            .lineSpacing(4)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 20)
                    .padding(.top, 20)
                    
                    //Image
                    Image("tuto1")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(maxWidth: 360)
                        .frame(maxHeight: 250)
                        .clipped()
                        .cornerRadius(12)
                        .padding(20)
                    
                    // Partie basse
                    VStack(alignment: .leading, spacing: 20) {
                        Text("Une fois tous vos ingrédients rassemblés, vous êtes prêt à passer à l'étape de fabrication. Le mélange doit avoir la consistance d'une pâte à modeler pour bien se tenir.")
                            .font(.custom("SF Pro", size: 14))
                            .foregroundColor(.black)
                            .lineSpacing(4)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 20)
                    .padding(.bottom, 20)
                }
                .frame(maxWidth: .infinity)
                .padding(.top, 45) // 20 + 25 pour compenser la superposition
                .padding(.bottom, 45) // Augmenté pour éviter que le texte soit caché
                .background(
                    Color.white
                        .clipShape(UnevenRoundedRectangle(cornerRadii: .init(topLeading: 25, bottomLeading: 0, bottomTrailing: 0, topTrailing: 25)))
                )
                .offset(y: -25) // Remonte de 25px
                
                // SECTION 3 - Règles (Background vertApp)
                VStack(alignment: .leading, spacing: 16) {
                    Text("Règles importantes")
                        .font(.custom("Instrument Sans", size: 20))
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                    
                    VStack(alignment: .leading, spacing: 12) {
                        Text("• Utiliser uniquement des graines adaptées au climat local")
                            .font(.custom("SF Pro", size: 14))
                            .foregroundColor(.black)
                        
                        Text("• Lancer seulement dans des espaces abandonnés ou autorisés")
                            .font(.custom("SF Pro", size: 14))
                            .foregroundColor(.black)
                        
                        Text("• Éviter les périodes de sécheresse pour optimiser la germination")
                            .font(.custom("SF Pro", size: 14))
                            .foregroundColor(.black)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 45) // 20 + 25 pour compenser la superposition
                .padding(.horizontal, 20)
                .padding(.bottom, 45) // Augmenté pour éviter que le texte soit caché
                .background(
                    Color.vert
                        .clipShape(UnevenRoundedRectangle(cornerRadii: .init(topLeading: 25, bottomLeading: 0, bottomTrailing: 0, topTrailing: 25)))
                )
                .offset(y: -50) // Remonte de 50px (25 + 25 de la section précédente)
                
                // SECTION 4 - Texte et photo en parallèle (Background blanc)
                VStack(alignment: .leading, spacing: 16) {
                    Text("Technique de lancement")
                        .font(.custom("Instrument Sans", size: 20))
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                    
                    HStack(alignment: .top, spacing: 16) {
                        Image("tuto2")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 170, height: 150)
                            .cornerRadius(12)
                            .clipped()
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Pour un lancement efficace, visez les zones de terre nue. Un mouvement de fronde avec le bras permet une meilleure dispersion. Lancez de préférence avant une période de pluie.")
                                .font(.custom("SF Pro", size: 14))
                                .foregroundColor(.black)
                                .lineSpacing(4)
                        }
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 45) // 20 + 25 pour compenser la superposition
                .padding(.horizontal, 20)
                .padding(.bottom, 45) // Augmenté pour éviter que le texte soit caché par les autres sections
                .background(
                    Color.white
                        .clipShape(UnevenRoundedRectangle(cornerRadii: .init(topLeading: 25, bottomLeading: 0, bottomTrailing: 0, topTrailing: 25)))
                )
                .offset(y: -75) // Remonte de 75px (25 + 25 + 25 des sections précédentes)
            }
        }
        .ignoresSafeArea(.container, edges: .top) // Pour que la ScrollView puisse s'étendre en haut
    }
}

#Preview {
    TutoDetailView()
}
