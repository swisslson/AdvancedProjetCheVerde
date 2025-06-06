//
//  ProfilView.swift
//  HackingUrbain
//
//  Created by cyrilH on 01/06/2025.
//

import SwiftUI

struct ProfilView: View {
    
    private let columns = Array(repeating: GridItem(.flexible()), count: 3)
//    @State private var user = User
    
    var body: some View {
        VStack{
            
            VStack{
                Image(user.photo)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 160, height: 160)
                    .clipShape(Circle())
//                              .shadow(radius: 5)
                Text("Hey \(user.pseudo) !")
                    .font(Font.custom("InstrumentSans-Bold", size: 30))
                    .foregroundColor(Color.black)
                // fair la fonts
                    .padding(.top, 5)
                
            }// fin de vsteack photo speudo
            .padding(.bottom, 15.0)
            
            
            VStack{
                Text("Descprition")
                    .font(Font.custom("InstrumentSans-Bold", size: 14))

                    .foregroundColor(Color.black)
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 10.0)
                
                
                // fair la fonts
                VStack{
                    Text(user.description)
                        .font(.system(size: 12))
                        .foregroundColor(Color.black)
                        .multilineTextAlignment(.leading)
                        .padding(.bottom, 10)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    // fair la fonts
                }
                
                
            }// fin de la stack description
            //            .padding(.bottom, 300)
            .padding(.horizontal, 30)
            
            
            
            
            VStack {
                Text("Mes Badges")
                    .font(Font.custom("InstrumentSans-Bold", size: 14))
                    .foregroundColor(Color.black)
                    .frame(maxWidth: .infinity, alignment: .leading)
                ScrollView(.horizontal) {
                    HStack(spacing: 15) {
                        ForEach(user.badges) { badge in
                        VStack {
                            Image(badge.imageName)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 70, height: 70)
                            Text(badge.name)
                                .font(.system(size: 12))
                                .foregroundColor(Color.black)
                                .padding(.top, 3)
                            
                            
                            }
                        }
                  
                        
                        
                        
                    }
                    
                }
            }// fin de v stack badges
            .padding(.horizontal, 30)
            
            
            // boucle et verif condition is == true pour afficher struct person-> [logo = image == false/ image == true]
            
            
            
            // boucle affichage photo prise struc liste dimage
            // Galerie
            VStack{
                Text("Ma galerie")
                    .font(Font.custom("InstrumentSans-Bold", size: 14))
                    .foregroundColor(Color.black)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 5)
                    .padding([.bottom, .top], 10)
                    
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(user.gallery, id: \.self) { imageName in
                        Image(imageName)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 100, height: 100)
                            .clipped()
                            .cornerRadius(20)
                    }
                }
                .padding(.horizontal, 10.0)
            }.padding(.horizontal, 30)
               
            
            
        }// fin de vstack de page
    
        
    }// fin du body
    
    
}// fin du ProfilView








#Preview {
    ProfilView()
}
