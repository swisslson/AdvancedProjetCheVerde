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
        VStack(spacing: 0) {
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
            .background(Color(.vert))

            HStack {
                Text("\(event.status)")
                    .font(.system(size: 20, weight: .bold))
                    .frame(width: 150, height: 40)
                    .background(.gray.opacity(0.15), in: RoundedRectangle(cornerRadius: 30))
                Spacer()
            }

            .padding([.leading, .trailing])
            .padding(.vertical)
            .background(Color(.vert))
        }


            
        VStack(alignment: .leading) {
            Text("Membres du groupe :")
                .font(Font.custom("InstrumentSans-Bold", size: 20))
                .padding(.top, 30)
                .padding(.leading)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15) {
                    Image("user1")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                        .overlay(
                            Circle().stroke(Color.blue, lineWidth: 2)
                        )

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
        }
            
            Spacer()
            // carte de medi  ici
                    Text("Titre: \(event.titre)")
                    Text("Date: \(event.date)")
                    Text("status: \(event.status)")
            Spacer()
                }
}

#Preview {

    InfoSelectedEventView(event: eventArray[0])
}
