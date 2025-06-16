//
//  CelebrationAnimationView.swift
//  HackingUrbain
//
//  Created by Emmanuel on 15/06/2025.
//

import SwiftUI

struct CelebrationAnimationView: View {
    let score: Int
    let onAnimationComplete: (() -> Void)?
    
    // États pour les animations
    @State private var showConfetti = false
    @State private var bounceAnimation = false
    @State private var scaleAnimation = false
    @State private var badgeAnimation = false
    @State private var textAnimation = false
    
    init(score: Int, onAnimationComplete: (() -> Void)? = nil) {
        self.score = score
        self.onAnimationComplete = onAnimationComplete
    }
    
    var body: some View {
        ZStack {
            // Fond blanc/transparent
            Color.clear
                .ignoresSafeArea()
            
            // Animation des confettis en arrière-plan
            ForEach(0..<20, id: \.self) { i in
                Circle()
                    .fill(Color.vert)
                    .frame(width: 9, height: 9)
                    .offset(
                        x: showConfetti ? CGFloat.random(in: -200...200) : 0,
                        y: showConfetti ? CGFloat.random(in: -300...100) : -50
                    )
                    .opacity(showConfetti ? 0 : 1)
                    .animation(
                        .easeOut(duration: 2.0).delay(Double(i) * 0.1),
                        value: showConfetti
                    )
            }
            
            VStack(spacing: 20) {
                // Titre avec animation de rebond
                Text("Bravo !")
                    .font(.largeTitle)
                    .bold()
                    .scaleEffect(bounceAnimation ? 1.2 : 1.0)
                    .animation(
                        .spring(response: 0.6, dampingFraction: 0.8),
                        value: bounceAnimation
                    )
                    .opacity(textAnimation ? 1 : 0)
                    .animation(.easeIn(duration: 0.5), value: textAnimation)
                
                // Texte de félicitations avec animation d'apparition
                Text("Vous avez complété le quizz\navec un total de \(score) bonnes réponses")
                    .multilineTextAlignment(.center)
                    .opacity(textAnimation ? 1 : 0)
                    .offset(y: textAnimation ? 0 : 20)
                    .animation(.easeIn(duration: 0.8).delay(0.3), value: textAnimation)
                
                // Image du personnage avec animation de rotation et scale
                Image(.perso11)
                    .resizable()
                    .frame(width: 200, height: 200)
                    .scaleEffect(scaleAnimation ? 1.0 : 0.5)
                    .rotationEffect(.degrees(scaleAnimation ? 0 : -180))
                    .animation(
                        .spring(response: 1.0, dampingFraction: 0.6).delay(0.5),
                        value: scaleAnimation
                    )
                
                // Badge avec animation de pulsation
                Text("Badge Débloqué")
                    .bold()
                    .foregroundColor(.black)
                    .scaleEffect(badgeAnimation ? 1.1 : 0.8)
                    .opacity(badgeAnimation ? 1 : 0)
                    .animation(
                        .easeInOut(duration: 1).repeatForever(autoreverses: true).delay(1.2),
                        value: badgeAnimation
                    )
                
                // Bouton avec animation d'apparition
                Button(action: {
                    // Action du bouton - appeler le callback
                    onAnimationComplete?()
                }) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 30)
                            .frame(width: 150, height: 50)
                            .foregroundColor(Color.vert)
                            .shadow(color: .vert.opacity(0.3), radius: 10, x: 0, y: 5)
                        
                        HStack {
                            Text("Mes Badges")
                                .foregroundColor(Color.black)
                                .font(.system(size: 16, weight: .bold))
                                .animation(
                                    .easeInOut(duration: 1))
                        }
                    }
                }
                .scaleEffect(badgeAnimation ? 1.0 : 0.8)
                .opacity(badgeAnimation ? 1 : 0)
                .animation(.easeIn(duration: 0.5).delay(1.5), value: badgeAnimation)
            }
            .padding()
        }
        .onAppear {
            startAnimationSequence()
        }
    }
    
    private func startAnimationSequence() {
        // Déclencher toutes les animations en séquence
        withAnimation {
            textAnimation = true
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            withAnimation {
                bounceAnimation = true
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            withAnimation {
                scaleAnimation = true
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
            withAnimation {
                showConfetti = true
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
            withAnimation {
                badgeAnimation = true
            }
        }
    }
}

// Extension pour générer des couleurs aléatoires pour les confettis
extension Color {
    static var random: Color {
        return Color(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1)
        )
    }
}

// Vue de test pour prévisualiser l'animation
struct CelebrationTestView: View {
    @State private var showCelebration = false
    
    var body: some View {
        ZStack {
            Color.gray.opacity(0.1).ignoresSafeArea()
            
            if showCelebration {
                CelebrationAnimationView(score: 10) {
                    // Callback quand l'animation est terminée
                    showCelebration = false
                }
            } else {
                VStack {
                    Text("Quiz Terminé!")
                        .font(.title)
                    
                    Button("Test Animation") {
                        showCelebration = true
                    }
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
            }
        }
    }
}

#Preview {
    CelebrationTestView()
}
