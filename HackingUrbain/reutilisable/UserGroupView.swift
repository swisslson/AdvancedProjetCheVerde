//
//  UserGroupView.swift
//  HackingUrbain
//
//  Created by Mehdi Legoullon on 13/06/2025.
//

import SwiftUI

struct UserGroupView: View {

    let badge: Badge
    @Binding var showAlertBadge: Bool
    @Binding var selectedBadge: Badge?
    
    
    var body: some View {
        VStack {
                    Image(badge.imageName)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 70, height: 70)
//                        .onLongPressGesture (minimumDuration: 1.2) {
//                            showAlertBadge = true
//                        }
                        .gesture(
                            LongPressGesture(minimumDuration: 2)
                                .onChanged { _ in
                                    showAlertBadge = true
                                    selectedBadge = badge}
                                .onEnded { _ in showAlertBadge = false }
                                        )

                        .alert(isPresented: Binding<Bool>(
                                            get: {
                                                showAlertBadge && selectedBadge?.id == badge.id
                                            },
                                            set: { newValue in
                                                if !newValue {
                                                    showAlertBadge = false
                                                    selectedBadge = nil
                                                }
                                            }
                                        )){
                        Alert(
                            title: Text("Info"),
                            message: Text(badge.description),
                            dismissButton: .default(Text("OK"))
                            )
                        }

                    Text(badge.name)
                        .font(.system(size: 14))
                        .foregroundColor(.black)
                        .padding(.top, 3)
                }
                    
    }
}


