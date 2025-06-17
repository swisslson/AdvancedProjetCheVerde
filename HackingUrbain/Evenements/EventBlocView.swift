//
//  event.swift
//  botanique
//
//  Created by alize on 02/06/2025.
//
import SwiftUI

struct EventView: View {
    
    let event: Event
    
    var body: some View {
        ZStack { //BLOC EVENT
            Rectangle()
                .fill(event.color)
                .frame(height: 230.0)
                .clipShape(RoundedCorner(radius: 25, corners: [.topLeft, .topRight]))
            VStack {
                HStack {
                    Text(event.date)
                        .font(.system(size: 34, weight: .bold))
                        .multilineTextAlignment(.leading)
                        .padding()
                    Rectangle() //trait séparateur
                        .frame(width: 1, height: 73)
                    VStack(alignment: .leading) {
                        Text(event.titre)
                            .font(Font.custom("InstrumentSans-bold", size: 20))
                            .padding(.bottom, 5)
                        Text(event.description)
                            .font(.system(size: 14))
                            .lineSpacing(2)
                            .lineLimit(3)
                            .truncationMode(.tail)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .multilineTextAlignment(.leading)
                    }
                    .padding()
                }
                HStack { //heure
                    Image(systemName: "clock.fill")
                        .padding(.leading, 20)
                    Text(event.heure)
                        .font(.system(size: 14))
                    ZStack { //tag
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(Color.black, lineWidth: 1)
                            .frame(width: 80.0, height: 30.0)
                        Text(event.status)
                            .font(.system(size: 14))
                    }
                    .padding(.leading, 20)
                    Spacer()
                    //icones participants
                    HStack (spacing: -10){
                        Image("user1")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 28, height: 28)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 1))
                        Image("user2")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 28, height: 28)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 1))
                        Image("user3")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 28, height: 28)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 1))
                        ZStack {
                            Circle()
                                .frame(width: 28, height: 28)
                                .overlay(Circle().stroke(Color.white, lineWidth: 1))
                            Text(event.NbUsers)
                                .font(.system(size: 12,))
                                .foregroundColor(Color.white)
                        }
                    }
                    .padding(.trailing, 20)
                }
            }
            .padding(.bottom, 45)
        }
    }
    //Structure pour rectangle fond asymetrique (radius - top/ no radius - bottom)
    struct RoundedCorner: Shape {
        var radius: CGFloat = 25.0
        var corners: UIRectCorner = .allCorners
        
        func path(in rect: CGRect) -> Path {
            let path = UIBezierPath(
                roundedRect: rect,
                byRoundingCorners: corners,
                cornerRadii: CGSize(width: radius, height: radius)
            )
            return Path(path.cgPath)
        }
    }
}

#Preview {
    EventView(event: eventArray[0])
}
