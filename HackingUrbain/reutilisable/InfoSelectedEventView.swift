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

    var body: some View {
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
            .background(Color(event.color))

            HStack {
                Text("\(event.status)")
                    .font(.system(size: 20, weight: .bold))
                    .frame(width: 150, height: 40)
                    .background(.gray.opacity(0.15), in: RoundedRectangle(cornerRadius: 30))
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

            // Section Infos pratiques
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
            .padding(.top, 4)
            .padding(.leading)

            HStack {
                Image(systemName: "map")
                    .foregroundColor(.black)
                    .imageScale(.large)
                    .font(.system(size: 16, weight: .bold))
                Text("\(event.adress)")
                    .font(Font.custom("InstrumentSans-Bold", size: 16))
            }
            .padding(.top, 4)
            .padding(.leading)

            // Section À propos
            Text("À propos")
                .font(Font.custom("InstrumentSans-Bold", size: 20))
                .padding(.top, 30)
                .padding(.leading)

            Text("\(event.description)")
                .font(Font.custom("InstrumentSans", size: 16))
                .fixedSize(horizontal: false, vertical: true)
                .padding(.top, 4)
                .padding(.leading)

            Spacer()
        }
    }
}

struct InfoSelectedEventView_Previews: PreviewProvider {
    static var previews: some View {
        InfoSelectedEventView(event: eventArray[0])
    }
}
