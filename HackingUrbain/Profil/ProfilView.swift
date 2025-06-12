//
//  ProfilView.swift
//  HackingUrbain
//
//  Created by cyrilH on 01/06/2025.
//

import SwiftUI

struct ProfilView: View {
    
    struct IdentifiableString: Identifiable {
        let id = UUID()
        let value: String
    }
    
    let user : User
    
    private let columns = Array(repeating: GridItem(.flexible(), spacing: 14), count: 3)
           
    @State var showAlertBadge = false
    @State private var selectedBadge: Badge?
    @State private var selectedImage: IdentifiableString? = nil

    @AppStorage("isConnected") var isConnected: Bool = false
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            VStack{
                // photo + name
                VStack{
                    Image(user.photo)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 160, height: 160)
                        .clipShape(Circle())
                    
                    Text("Hey \(user.pseudo) !")
                        .font(Font.custom("InstrumentSans-Bold", size: 30))
                        .padding(.top, 5)
                    
                }// fin de vstack photo speudo
                .padding(.bottom, 15.0)
                
                //Descprition
                VStack{
                    Text("Descprition")
                        .font(Font.custom("InstrumentSans-Bold", size: 16))
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom, 10.0)
                    
                    
                    
                    VStack{
                        Text(user.description)
                            .font(.system(size: 14))
                            .multilineTextAlignment(.leading)
                            .padding(.bottom, 10)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                    }
                    
                    
                }// fin de la stack description
                .padding(.horizontal, 20)
                
                // badges
                VStack {
                    Text("Mes Badges")
                        .font(Font.custom("InstrumentSans-Bold", size: 16))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    ScrollView(.horizontal) {
                        HStack(spacing: 15) {
                            ForEach(user.badges) { badge in
                                BadgeDescripionView(badge: badge, showAlertBadge: $showAlertBadge, selectedBadge: $selectedBadge)
                            }
                        }
                    }
                    .scrollIndicators(.hidden)
                }// fin de badges
                .padding(.leading, 20)
                
                
                // Galerie
                VStack{
                    Text("Ma galerie")
                        .font(Font.custom("InstrumentSans-Bold", size: 16))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 5)
                        .padding([.bottom, .top], 10)
                    
                    LazyVGrid(columns: columns, spacing: 14) {
                        ForEach(user.gallery, id: \.self) { imageName in
                            Image(imageName)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 110, height: 110)
                                .clipped()
                                .cornerRadius(20)
                                .onTapGesture {
                                    selectedImage = IdentifiableString(value: imageName)
                                }
                        }
                    }
                    
                }.padding(.horizontal, 20)
                // fin de vstack gallery
                
                
                Button {
                    isConnected = false
                } label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 30)
                            .frame(width: 331, height: 56)
                            .foregroundColor(Color.vert)
                        HStack{
                            Text("Déconnexion")
                                .font(Font.custom("InstrumentSans-Bold", size: 16))
                                .foregroundColor(Color.black)
                        }
                    }
                    .padding()
                }
                .padding(.bottom, 16)
            }// fin de vstack de page
            .fullScreenCover(item: $selectedImage) { identifiableImage in
                FullscreenImageView(imageName: identifiableImage.value)
            }
            
        }
    }// fin de body
}// fin du }View

#Preview {
    ProfilView(user: user)
}
