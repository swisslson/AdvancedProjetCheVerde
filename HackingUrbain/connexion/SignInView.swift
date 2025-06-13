//
//  SignInView.swift
//  HackingUrbain
//
//  Created by Chabane on 03/06/2025.
//

import SwiftUI

struct SignInView: View {
  
  @State private var email = "JohnDoe@example.com"
  @State private var password = "123456"
  @AppStorage("isConnected") var isConnected: Bool = false

  
  var body: some View {
    
    NavigationStack {
      
      Spacer()
      
      // Titre et Description
      VStack(alignment: .leading, spacing: 30){
        Text("Se connecter")
          .foregroundColor(Color.black)
          .font(Font.custom("InstrumentSans-Bold", size: 32))
          .font(.largeTitle)
          .fontWeight(.bold)
        Text("Connectez-vous pour profiter de toutes les fonctionnalités")
      }
      
      Spacer()
      
      // Champs de connexion
      VStack (spacing: 30) {
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
        // Boutton Mot de passe oublié
        Button(action: {}, label: {
          HStack{
            Text("Mot de passe oublié ?")
              .foregroundColor(Color.black)
          }
        })
        // Boutton Se connecter
          
          
          
          Button {
              isConnected = true
          } label: {
              ZStack{
                RoundedRectangle(cornerRadius: 30)
                  .frame(width: 331, height: 56)
                  .foregroundColor(Color.vert)
                HStack{
                  Text("Se connecter")
                    .font(Font.custom("InstrumentSans-Bold", size: 16))
                    .foregroundColor(Color.black)
                }}
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
      NavigationLink( destination: RegisterView()) {
        ZStack{
          Rectangle()
            .frame(width: 336, height: 45)
            .foregroundColor(.clear)
            .cornerRadius(10)
          HStack{
            Text("Pas de compte ?")
              .foregroundColor(Color.black)
            Text("Créer un compte")
              .foregroundColor(Color.violet)
          }}
      }
    }
    .navigationBarBackButtonHidden()
  }
  
}



#Preview {
  SignInView()
}
