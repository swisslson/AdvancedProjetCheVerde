//
//  TutorielView.swift
//  HackingUrbain
//
//  Created by Chabane on 03/06/2025.
//

import SwiftUI

struct KitView: View {
    
    @State private var currentIndex = 0
    
    var body: some View {
        
        // variable pour gerer la position des pages
        let currentTuto = tutoList[currentIndex]
        
        NavigationStack {
            VStack {
                Spacer(minLength: 40)
                
                // Partie centrale fixe
                VStack(spacing: 24) {
                    Image(currentTuto.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 200)
                    
                    Text(currentTuto.titre)
                        .font(.title2)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .frame(width: 300, height: 100)
                    
                    Text(currentTuto.description)
                        .font(.body)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                    
                    ProgressView(value: Double(currentIndex + 1), total: Double(tutoList.count))
                        .accentColor(.purple)
                        .frame(width: 200, height: 100)
                }
                .frame(maxWidth: .infinity, maxHeight: 600) // pour maintenir la structure stable
                
                Spacer()
                
                // Zone des boutons
                HStack {
                    if currentIndex > 0 {
                        Button(action: {
                            withAnimation {
                                currentIndex -= 1
                            }
                        }) {
                            Text("Précédent")
                                .font(Font.custom("InstrumentSans-Bold", size: 16))
                                .frame(width: 120, height: 50)
                                .background(Color.gray.opacity(0.1))
                                .foregroundColor(.black)
                                .cornerRadius(30)
                        }
                    } else {
                        Spacer(minLength: 120) // Garde la place du bouton "Précédent" vide pour alignement
                    }
                    
                    Spacer()
                    
                    if currentIndex < tutoList.count - 1 {
                        Button(action: {
                            withAnimation {
                                currentIndex += 1
                            }
                        }) {
                            Text("Suivant")
                                .font(Font.custom("InstrumentSans-Bold", size: 16))
                                .frame(width: 120, height: 50)
                                .background(Color.vert)
                                .foregroundColor(.black)
                                .cornerRadius(30)
                        }
                    } else {
                        NavigationLink( destination: QuizzView()) {
                            ZStack{
                                RoundedRectangle(cornerRadius: 30)
                                    .frame(width:150 ,height: 50)
                                    .foregroundColor(Color.vert)
                                HStack{
                                    Text("Faire le quizz")
                                        .foregroundColor(Color.black)
                                }}
                        }
                    }
                }
                .padding(.horizontal, 30)
                .padding(.bottom, 40)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding()
        }
    }
}

#Preview {
    KitView()
}
