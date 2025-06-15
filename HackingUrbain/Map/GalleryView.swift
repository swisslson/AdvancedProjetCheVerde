//
//  GalleryView.swift
//  HackingUrbain
//
//  Created by alize on 05/06/2025.
//

import SwiftUI

struct GalleryView: View {
    
    @State private var selectedGallery: Gallery? = nil //Objet gallery
    
    let columns =  [
        GridItem(.flexible(), spacing: 13), //alignement entre bloc vertical
        GridItem(.flexible())
    ]
    var body: some View {
        ScrollView {
            LazyVGrid (columns: columns, spacing: 13) { //alignement entre les lignes
                ForEach(galleryArray) { gallery in
                    
                    ZStack(alignment: .bottomLeading){
                        Image(gallery.image)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: 150)
                            .clipped()
                            .cornerRadius(25)
                            .onTapGesture {
                                selectedGallery = gallery
                            }
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
        // Full Screen image
        .fullScreenCover(item: $selectedGallery) { gallery in
            FullscreenImageView(imageName: gallery.image)
        }
    }
}

#Preview {
    GalleryView()
}
