//
//  PickerView.swift
//  HackingUrbain
//
//  Created by alize on 05/06/2025.
//
import SwiftUI

struct PickerView: View {
    
    private enum PickerSelection: String, CaseIterable, Identifiable {
        case map = "Carte"
        case list = "Liste"
        case gallery = "Gallerie"
        
        var id: String { self.rawValue }
    }
    //Par default la vue map est selectionnée
    @State private var selectedView: PickerSelection = .map
    
    var body: some View {
        VStack{
            //Création du picker
            Picker("", selection: $selectedView) {
                ForEach (PickerSelection.allCases, id: \.self) { page in
                    Text(page.rawValue).tag(page)
                        .padding(.vertical, 10)
                }
            } //picker fin
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            .cornerRadius(25)
            .padding(.top)
            .padding([.leading, .trailing], 50)
            //Affichage vue selon filtre séléctionné
            switch selectedView {
            case .map:
                MapView()
            case .list:
                EventListView()
            case .gallery:
                GalleryView()
            }
        }
    }
}

#Preview {
    PickerView()
}



