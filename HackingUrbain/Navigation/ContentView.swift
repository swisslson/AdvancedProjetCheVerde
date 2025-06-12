//
//  ContentView.swift
//  HackingUrbain
//
//  Created by cyrilH on 01/06/2025.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("isConnected") var isConnected: Bool = false
    
    var body: some View {
        if isConnected == false {
            WelcomeView()
        } else {
            TabView {
                
                PickerView()
                    .tabItem {Label( "Carte", systemImage: "map.fill")}
                TutorielView( )
                    .tabItem {Label( "Tutoriels", image: .plant)}
                CreeView()
                    .tabItem {Label( "Créer", systemImage: "plus.circle.fill")}
                MyEventView()
                    .tabItem {Label( "Evenements ", image: .event)}
                ProfilView(user: user)
                    .tabItem {Label( "Compte", systemImage: "person")}
            } // fin du tabView
            .tint(Color(.violet))
            .onAppear(){
                UITabBar.appearance().backgroundColor = UIColor.white
            }
        }
    }// fin du body
}// fin du contentView

#Preview {
    ContentView()
}
