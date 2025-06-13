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
    
    var body: some View {
        
        NavigationStack {
            
            VStack(spacing: 20) {
                // Condition si Quizz Reussi = Page Bravo
                if score == maxScore {
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
                    
                    NavigationLink( destination: ProfilView(user: user)) {
                        ZStack{
                            RoundedRectangle(cornerRadius: 30)
                                .frame(width:150 ,height: 50)
                                .foregroundColor(Color.vert)
                            HStack{
                                Text("Mes Badges")
                                    .foregroundColor(Color.black)
                                    .font(Font.custom("InstrumentSans-Bold", size: 16))
                            }}
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
        }
    }
}

#Preview {
    QuizzView()
}

