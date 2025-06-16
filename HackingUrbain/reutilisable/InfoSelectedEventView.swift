//
//  InfoSelectedEventView.swift
//  HackingUrbain
//
//  Created by cyrilH on 10/06/2025.
//

import SwiftUI

struct InfoSelectedEventView: View {

    var event: Event
    @Environment(\.dismiss) private var dismiss
    
    @Binding var showPicker: Bool;

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                
                HStack(alignment: .lastTextBaseline) {
                    Text("\(event.titre)")
                        .font(Font.custom("InstrumentSans-Bold", size: 30))
                        .bold()
                        .lineLimit(1)
                        .minimumScaleFactor(0.5)
                    
                    Spacer()
                    
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .font(.system(size: 30))
                            .foregroundColor(.black)
                    }
                }
                .padding([.leading, .trailing])
                .padding(.top, 55)
                .background(Color(event.color))
                
                HStack {
                    Text("\(event.status)")
                        .font(.system(size: 14))
                        .foregroundColor(.black)
                        .frame(width: 120, height: 32)
                        .overlay(RoundedRectangle(cornerRadius: 25).stroke(Color.black, lineWidth: 1))
                    Spacer()
                }
                .padding([.leading, .trailing])
                .padding(.vertical)
                .background(Color(event.color))
                
                Text("Membres du groupe :")
                    .font(Font.custom("InstrumentSans-Bold", size: 20))
                    .padding(.top, 20)
                    .padding([.top, .bottom, .leading])
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 15) {
                        Image("user1")
                            .resizable()
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.blue, lineWidth: 2))
                        
                        Image("user2")
                            .resizable()
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                        
                        Image("user3")
                            .resizable()
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                        
                        Image("user4")
                            .resizable()
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                        
                        Image("user5")
                            .resizable()
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                    }
                    .padding(.horizontal)
                }
                
                Text("4 participants")
                    .font(Font.custom("InstrumentSans", size: 16))
                    .padding(.top, 16)
                    .padding(.leading)
                
                Text("Infos pratiques :")
                    .font(Font.custom("InstrumentSans-Bold", size: 20))
                    .padding(.top, 30)
                    .padding([.bottom, .leading])
                
                HStack {
                    Image(systemName: "calendar")
                        .foregroundColor(.black)
                        .imageScale(.large)
                        .font(.system(size: 16, weight: .bold))
                    Text("\(event.date2) - \(event.heure)")
                        .font(Font.custom("InstrumentSans-Bold", size: 16))
                }
                .padding(.leading)
                .padding(.vertical, 4)
                
                
                HStack {
                    Image(systemName: "map")
                        .foregroundColor(.black)
                        .imageScale(.large)
                        .font(.system(size: 16, weight: .bold))
                    Text("\(event.adress)")
                        .font(Font.custom("InstrumentSans-Bold", size: 16))
                }
                .padding(.leading)
                .padding(.vertical, 4)
                
                Text("À propos")
                    .font(Font.custom("InstrumentSans-Bold", size: 20))
                    .padding(.top, 30)
                    .padding([.bottom, .leading])
                
                Text("\(event.description)")
                    .font(Font.custom("InstrumentSans", size: 16))
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(.top, 4)
                    .padding(.leading)
                
                Text("Photos")
                    .font(Font.custom("InstrumentSans-Bold", size: 20))
                    .padding(.top, 30)
                    .padding([.bottom, .leading])
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 15) {
                        Image("albumGroupe1")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 100, height: 100)
                            .clipped()
                            .cornerRadius(20)
                            .shadow(radius: 5)
                        
                        Image("gallery1")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 100, height: 100)
                            .clipped()
                            .cornerRadius(20)
                            .shadow(radius: 5)
                        
                        Image("albumGroupe3")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 100, height: 100)
                            .clipped()
                            .cornerRadius(20)
                            .shadow(radius: 5)
                        
                        Image("albumGroupe4")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 100, height: 100)
                            .clipped()
                            .cornerRadius(20)
                            .shadow(radius: 5)
                    }
                    .padding(.leading)
                }
                .frame(height: 120)
                
                HStack(spacing: 20) {
                    Text("Voir plus")
                        .font(Font.custom("InstrumentSans", size: 16))
                        .underline()
                        .padding(.top, 8)
                        .padding(.leading)
                    
                    Text("Ajouter")
                        .font(Font.custom("InstrumentSans", size: 16))
                        .underline()
                        .padding(.top, 8)
                        .padding(.leading)
                }
                .padding(.leading)
                .padding(.top, 8)
                
                Text("Commentaires")
                    .font(Font.custom("InstrumentSans-Bold", size: 20))
                    .padding(.top, 30)
                    .padding(.leading)
                
                HStack(spacing: 10) {
                    Image("user1")
                        .resizable()
                        .frame(width: 45, height: 45)
                        .clipShape(Circle())

                    Text("Pseudoname")
                        .font(Font.custom("InstrumentSans", size: 16))
                        .font(.system(size: 16, weight: .bold))

                    Spacer()
                    
                    HStack(spacing: 8) {
                        Text("\(event.date2)")
                            .font(Font.custom("InstrumentSans", size: 14))
                        Text("\(event.heure)")
                            .font(Font.custom("InstrumentSans", size: 14))
                    }
                    .padding(.trailing)
                }
                .padding([.bottom, .leading])
                .padding(.top)
                
                HStack(alignment: .top) {
                    Spacer()
                        .frame(width: 45 + 10)

                    ZStack {
                        RoundedRectangle(cornerRadius: 25)
                            .fill(Color(.grisClair))
                            .frame(width: 302, height: 67)

                        Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et.")
                            .font(Font.custom("InstrumentSans", size: 14))
                            .foregroundColor(.black)
                            .padding(.horizontal)
                    }
                }
                .padding(.leading)
                
                HStack(spacing: 10) {
                    Image("user3")
                        .resizable()
                        .frame(width: 45, height: 45)
                        .clipShape(Circle())

                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color(.vert))
                        .frame(width: 306, height: 45)
                        .overlay(
                            HStack {
                                Text("Ajouter un commentaire")
                                    .font(Font.custom("InstrumentSans", size: 14))
                                    .foregroundColor(.black)
                                    .padding(.leading, 20)
                                Spacer()
                            }
                        )
                }
                .padding(.leading)
                .padding(.top)
                
                // Show join button
                if (!showPicker) {
                    HStack {
                        Spacer()
                        RoundedRectangle(cornerRadius: 30)
                            .fill(Color(.violet))
                            .frame(width: 230, height: 45)
                            .overlay(
                                Text("Rejoindre")
                                    .font(Font.custom("InstrumentSans-Bold", size: 14))
                                    .foregroundColor(.black)
                            )
                        Spacer()
                    }
                    .padding(.top, 25)
                    .padding(.bottom, 100)
                }
            }
        }
        .edgesIgnoringSafeArea(.all)
        .navigationBarBackButtonHidden()
        .onAppear {
            withAnimation {
                showPicker = false
            }
        }
        .onDisappear {
            withAnimation {
                showPicker = true
            }
        }
    }
}

struct InfoSelectedEventView_Previews: PreviewProvider {
    static var previews: some View {
        InfoSelectedEventView(event: eventArray[0], showPicker: .constant(false))
    }
}
