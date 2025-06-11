//
//  filtresEventView.swift
//  botanique
//
//  Created by alize on 02/06/2025.
//

import SwiftUI

struct SelectFilterView: View {
    let title: String
    let isSelected: Bool
    let selectedColor: Color
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .fill(isSelected ? selectedColor : Color("grisClair"))
                .frame(width: 95.0, height: 40.0)
            Text(title)
                .font(.system(size: 12))
                .fontWeight(isSelected ? .bold : .regular)
        }
    }
}

#Preview {
    SelectFilterView(title: "Aujourd'hui", isSelected: true, selectedColor: Color("orangeF"))
}
