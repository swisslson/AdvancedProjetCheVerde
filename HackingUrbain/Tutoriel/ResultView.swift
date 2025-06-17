//
//  ResultView.swift
//  HackingUrbain
//
//  Created by Chabane on 11/06/2025.
//

import SwiftUI

struct ResultView: View {
    let score: Int
    let maxScore: Int
    let restartAction: () -> Void
    
    // AJOUT : État pour contrôler l'animation
    @State private var showAnimation = false
    
    var body: some View {
        
        NavigationStack {
            
            VStack(spacing: 20) {
                // Condition si Quizz Reussi = Page Bravo
                if score == maxScore {
                    
                    // AJOUT : Affichage conditionnel
                    if showAnimation {
                        // Afficher l'animation
                        CelebrationAnimationView(score: score) {
                            showAnimation = false
                        }
                    } else {
                        // Contenu normal après animation
                        Text("Bravo !")
                            .font(.largeTitle)
                            .bold()
                        Text("Vous avez complété le quizz\navec un total de \(score) bonnes réponses")
                            .multilineTextAlignment(.center)
                        
                        Image(.perso11)
                            .resizable()
                           .frame(width: 200, height: 200)
                        
                        Text("Badge Débloqué")
                            .bold()
                    }
                    
                    // Condition si Quizz Raté = Page Dommage
                } else {
                    
                    Text("Dommage")
                        .font(Font.custom("InstrumentSans-Bold", size: 32))
                    Image(.perso10)
                    Text("Vous avez obtenu \(score) bonnes réponses.\nEssayez encore !")
                        .multilineTextAlignment(.center)
                    
                    Button("Recommencer") {
                        restartAction()
                    }
                    .padding()
                    .padding(.horizontal, 40)
                    .background(Color.vert)
                    .font(Font.custom("InstrumentSans-Bold", size: 16))
                    .foregroundColor(.black)
                    .cornerRadius(30)
                }
            }
            .padding()
            .navigationBarBackButtonHidden()
            // AJOUT : Déclencher l'animation
            .onAppear {
                if score == maxScore {
                    showAnimation = true
                }
            }
        }
    }
}

#Preview {
    QuizzView()
}
