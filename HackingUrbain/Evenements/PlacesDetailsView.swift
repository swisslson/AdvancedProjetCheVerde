//
//  PlacesDetailsView.swift
//  HackingUrbain
//
//  Created by alize on 09/06/2025.
//

import SwiftUI

struct PlacesDetailsView: View {
    let place: Event
    let onDismiss: () -> Void //fonction popur fermer la modale
    
    var body: some View {
        ZStack { // BLOC EVENT
            Rectangle()
                .fill(place.colorMap)
                .frame(height: 175)
                .cornerRadius(25)
            VStack(spacing: 10) { // Contenu centré verticalement
                HStack(alignment: .top, spacing: 20) {
                    Text(place.date)
                        .font(.system(size: 34, weight: .bold))
                        .multilineTextAlignment(.leading)
                    Rectangle() // trait séparateur
                        .frame(width: 1, height: 73)
                    VStack(alignment: .leading, spacing: 4) {
                        HStack {
                            Text(place.titre)
                                .font(Font.custom("InstrumentSans-Bold", size: 20))
                            Spacer()
                            Button(action: {
                                onDismiss()
                            }) {
                                Image(systemName: "multiply")
                                    .foregroundStyle(.black)
                                    .font(.system(size: 25))
                            }
                        }
                        Text(place.description)
                            .font(.system(size: 12))
                            .lineSpacing(2)
                            .lineLimit(3)
                            .truncationMode(.tail)
                            .multilineTextAlignment(.leading)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
                HStack {
                    HStack(spacing: 8) {
                        Image(systemName: "location.circle.fill")
                        Text(place.adress)
                            .font(.system(size: 12))
                    }
                    Spacer()
                    HStack(spacing: -10) {
                        ForEach(["user1", "user2", "user3"], id: \.self) { user in
                            Image(user)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 28, height: 28)
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.white, lineWidth: 1))
                        }
                        ZStack {
                            Circle()
                                .frame(width: 28, height: 28)
                                .overlay(Circle().stroke(Color.white, lineWidth: 1))
                            Text(place.NbUsers)
                                .font(.system(size: 12))
                                .foregroundColor(.white)
                        }
                    }
                }
            }
            .padding(.vertical, 20)
            .padding(.horizontal, 20)
        }
        .foregroundStyle(.black)
        .padding(.horizontal, 20)
        .padding(.bottom, 20)
    }
}
#Preview {
    PlacesDetailsView(place: eventArray[0], onDismiss: {})
}
