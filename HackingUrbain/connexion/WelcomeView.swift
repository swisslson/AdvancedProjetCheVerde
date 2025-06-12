//
//  WelcomeView.swift
//  HackingUrbain
//
//  Created by Chabane on 03/06/2025.
//

import SwiftUI

struct WelcomeView: View {

  var body: some View {

    NavigationStack{

      ZStack{
        // Image Background
        Image(.albumGroupe4)
          .resizable()
          .scaledToFill()
          .ignoresSafeArea()

        VStack{
          Spacer()
          // Logo Che Verde
          Image(.logoCheVerdeWhite)
            .resizable()
            .frame(width: 300, height: 350)
           .padding(.top, 80)

          Spacer()
          // Boutton Se Connecter
          NavigationLink(destination: SignInView()) {
            ZStack{
              RoundedRectangle(cornerRadius: 30)
                .frame(width: 331, height: 56)
                .foregroundColor(Color.vert)
              HStack{
                Text("Se connecter")
                  .foregroundColor(Color.black)
                  .font(Font.custom("InstrumentSans-Bold", size: 16))
              }}
          }
          // Boutton Créer un compte
          NavigationLink( destination: RegisterView()) {
            ZStack{
              RoundedRectangle(cornerRadius: 30)
                .foregroundColor(Color.white)
                .frame(width: 331, height: 56)
              HStack{
                Text("Créer un compte")
                  .foregroundColor(Color.black)
                  .font(Font.custom("InstrumentSans-Bold", size: 16))
              }}

          }.padding()
         Spacer()
        }
      }
    }
  }
}

#Preview {
  WelcomeView()
}
