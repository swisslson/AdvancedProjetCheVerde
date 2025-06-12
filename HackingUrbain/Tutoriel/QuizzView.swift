//
//  QuizzView.swift
//  HackingUrbain
//
//  Created by Chabane on 11/06/2025.
//

import SwiftUI

struct QuizzView: View {
    
    @State private var currentQuestion = 0
    @State private var score = 0
    @State private var selectedIndex: Int? = nil
    @State private var showResults = false

    var body: some View {
        
        if showResults {
            ResultView(score: score, maxScore: questions.count, restartAction: resetQuiz)
        } else {
            VStack {
            // Barre de progression et Titre
                    VStack{
                        ProgressView(value: Double(currentQuestion + 1), total: Double(questions.count))
                            .accentColor(.violet)
                            .frame(width: 200, height: 100)
                        
                        Text("Question \(currentQuestion + 1)")
                            .font(Font.custom("InstrumentSans-Bold", size: 32))
                            .padding(.top)
                }
                Spacer()
                // Questions
                Text(questions[currentQuestion].text)
                    .multilineTextAlignment(.center)
                    .font(Font.custom("InstrumentSans-Bold", size: 16))
                    .font(.headline)
                    .padding()

                Spacer()
                
                // Champs avec les choix de reponses
                ForEach(0..<4) { index in
                    Button(action: {
                        selectedIndex = index
                    }) {
                        HStack {
                            Text(questions[currentQuestion].options[index])
                                .foregroundColor(.black)
                            Spacer()
                            Circle()
                                .fill(selectedIndex == index ? Color.purple : Color.clear)
                                .frame(width: 20, height: 20)
                                .overlay(Circle().stroke(Color.gray))
                        }
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(20)
                    }
                }
                Spacer()
                
                // Boutton suivant
                Button("Suivant") {
                    if selectedIndex == questions[currentQuestion].correctIndex {
                        score += 1
                    }
                    if currentQuestion + 1 < questions.count {
                        currentQuestion += 1
                        selectedIndex = nil
                    } else {
                        showResults = true
                    }
                }
                .padding()
                .frame(width: 120, height: 50)
                .font(Font.custom("InstrumentSans-Bold", size: 16))
                .background(Color.vert)
                .foregroundColor(.black)
                .cornerRadius(30)
                .padding()
            }
            .padding()
            .navigationBarBackButtonHidden()
        }
    }

    func resetQuiz() {
        currentQuestion = 0
        score = 0
        selectedIndex = nil
        showResults = false
    }
}

#Preview {
    QuizzView()
}
