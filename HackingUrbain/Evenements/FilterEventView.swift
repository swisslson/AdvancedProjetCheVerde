//
//  filtresEventView.swift
//  botanique
//
//  Created by alize on 02/06/2025.
//

import SwiftUI

struct FilterView: View {
    let titre: String // variable pour contenu des filtres
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .fill(Color("grisClair"))
                .frame(width: 95.0, height: 30.0)
            Text(titre)
                .font(.system(size: 12))
                .foregroundColor(.black)
        }
    }
}

#Preview {
    FilterView(titre : "Aujourd'hui")
}
