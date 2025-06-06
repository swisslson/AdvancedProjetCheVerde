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
    
    @State private var selectedView: PickerSelection = .list
    
    var body: some View {
        /*VStack(spacing: 20) {
            // Picker
            HStack(spacing: 10) {
                ForEach(PickerSelection.allCases) { option in
                    Text(option.rawValue)
                        .font(.system(size: 12, weight: .medium))
                        .padding(.vertical, 8)
                        .frame(maxWidth: .infinity)
                        .background(
                            RoundedRectangle(cornerRadius: 5)
                                .fill(selectedView == option ? Color.vert : Color.white)
                                .shadow(color: .gray, radius: 1, x:0.5, y:0.5)
                        )
                        .onTapGesture {
                            selectedView = option
                        }
                }
            }
            .background(
                RoundedRectangle(cornerRadius: 30)
                    .fill(Color.grisClair)
            )
            .padding(.top)
            .padding([.leading, .trailing], 50)*/
            VStack{
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

                switch selectedView {
                case .map:
                    mapView()
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
    
    
    
