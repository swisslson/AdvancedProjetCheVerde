//
//  SignInView.swift
//  HackingUrbain
//
//  Created by Chabane on 03/06/2025.
//

import SwiftUI

struct RegisterView: View {
    
    @State private var nom = "Doe"
    @State private var prenom = "John"
    @State private var email = "john.doe@example.com"
    @State private var password = "123456"
    @AppStorage("isConnected") var isConnected: Bool = false
    
    var body: some View {
        
        NavigationStack {
            
            Spacer()
            
            // Titre et Description
            VStack(alignment: .leading, spacing: 30){
                Text("Créer un compte")
                    .foregroundColor(Color.black)
                    .font(Font.custom("InstrumentSans-Bold", size: 32))
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Text("Créer un compte pour profiter de toutes les fonctionnalités")
            }
            
            Spacer()
            
            // Champs de connexion
            VStack (spacing: 20) {
                TextField("Nom", text: ($nom))
                    .padding(.leading)
                    .frame(maxWidth: .infinity)
                    .frame(width: 331,height: 55)
                    .background(.gray.opacity(0.15),in: .rect(cornerRadius: 30))
                TextField("Prénom", text: ($prenom))
                    .padding(.leading)
                    .frame(maxWidth: .infinity)
                    .frame(width: 331,height: 55)
                    .background(.gray.opacity(0.15),in: .rect(cornerRadius: 30))
                TextField("Email", text: ($email))
                    .padding(.leading)
                    .frame(maxWidth: .infinity)
                    .frame(width: 331,height: 55)
                    .background(.gray.opacity(0.15),in: .rect(cornerRadius: 30))
                SecureField("Mot de passe", text: ($password))
                    .padding(.leading)
                    .frame(maxWidth: .infinity)
                    .frame(width: 331,height: 55)
                    .background(.gray.opacity(0.15),in: .rect(cornerRadius: 30))
            }
            VStack (spacing: 30){
                // Boutton Se connecter
                
                
                Button {
                    isConnected = true
                } label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 30)
                            .frame(width: 331, height: 56)
                            .foregroundColor(Color.vert)
                        HStack{
                            Text("Créer un compte")
                                .font(Font.custom("InstrumentSans-Bold", size: 14))
                                .foregroundColor(Color.black)
                        }
                    }
                }
                // ligne "ou"
                HStack{
                    Rectangle()
                        .frame(width: 150,height: 1.5)
                        .foregroundStyle(.gray.opacity(0.3))
                    Text("ou")
                    Rectangle()
                        .frame(width: 150,height: 1.5)
                        .foregroundStyle(.gray.opacity(0.3))
                }
                // CTA Alternatives de connexion
                HStack(spacing: 90){
                    //Apple
                    Button(action: {}, label: {
                        Image(.apple)
                            .resizable()
                            .frame(width: 25, height: 25)
                            .overlay {
                                RoundedRectangle(cornerRadius: 12).stroke(lineWidth: 1.5)
                                    .frame(width: 100,height: 50)
                                    .foregroundStyle(.gray.opacity(0.3))
                            }
                    })
                    .tint(.primary)
                    //Google
                    Button(action: {}, label: {
                        Image(.google)
                            .resizable()
                            .frame(width: 25, height: 25)
                            .overlay {
                                RoundedRectangle(cornerRadius: 12).stroke(lineWidth: 1.5)
                                    .frame(width: 100,height: 50)
                                    .foregroundStyle(.gray.opacity(0.3))
                            }
                    })
                    .tint(.primary)
                    //Facebook
                    Button(action: {}, label: {
                        Image(.facebook)
                            .resizable()
                            .frame(width: 25, height: 25)
                            .overlay {
                                RoundedRectangle(cornerRadius: 12).stroke(lineWidth: 1.5)
                                    .frame(width: 100,height: 50)
                                    .foregroundStyle(.gray.opacity(0.3))
                            }
                    })
                    .tint(.primary)
                }
            }
            .padding()
            
            Spacer()
            //Link vers Créér un compte
            NavigationLink( destination: SignInView()) {
                ZStack{
                    Rectangle()
                        .frame(width: 336, height: 45)
                        .foregroundColor(.clear)
                        .cornerRadius(10)
                    HStack{
                        Text("Déjà un compte ?")
                            .foregroundColor(Color.black)
                        Text("Se Connecter")
                            .foregroundColor(Color.violet)
                    }}
                
            }
        }
        .navigationBarBackButtonHidden()
        
    }
}

#Preview {
    RegisterView()
}
