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


            
            VStack {
                Text("Membres du groupe :")
                    .font(Font.custom("InstrumentSans-Bold", size: 16))
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding()
            
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
