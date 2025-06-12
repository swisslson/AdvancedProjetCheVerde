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
        VStack {
            
        
        HStack(alignment: .lastTextBaseline) {
            Spacer()
            Button (action: {
                dismiss()
            }){
                Image(systemName: "xmark.circle.fill")
                    .font(.system(size: 30))
                    .foregroundColor(.black)
                    .padding()
                
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
}

#Preview {

    InfoSelectedEventView(event: eventArray[0])
}
