//
//  GalleryView.swift
//  HackingUrbain
//
//  Created by alize on 05/06/2025.
//

import SwiftUI

struct GalleryView: View {
    let collumns =  [
        GridItem(.flexible(), spacing: 13), //alignement entre bloc vertical
        GridItem(.flexible())
    ]
    var body: some View {
            ScrollView {
                LazyVGrid (columns: collumns, spacing: 13) { //alignement entre les lignes
                    ForEach(galleryArray) { gallery in
                        
                        ZStack(alignment: .bottomLeading){
                            Image(gallery.image)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(height: 150)
                                .clipped()
                                .cornerRadius(25)
                            HStack {
                                Text(gallery.adresse)
                                    .font(.system(size: 11))
                                    .foregroundColor(.black)
                                    .padding(.horizontal, 10)
                                    .padding(.vertical, 5)
                                    .background(gallery.color)
                                    .cornerRadius(10)
                                    .padding(12)
                        }
                    }
                }
            }
        }
        .padding(.horizontal, 20) //marges
    }
}
#Preview {
    GalleryView()
}
