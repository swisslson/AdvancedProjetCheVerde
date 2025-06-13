//  CreeUIView.swift
//  HackingUrbain
//
//  Created by cyrilH on 01/06/2025.

import SwiftUI

struct CreeView: View {
    @State private var input1: String = "";
    @State private var selectedDate = Date();
    @State private var selectedTime = Date();
    @State private var input3: String = "";
    @State private var input4: String = "";
    @State private var numberOfPeople = 0;
    @State private var showingAlert = false;
    
    var isFormComplete: Bool {
        return !input1.isEmpty && !input3.isEmpty && !input4.isEmpty && numberOfPeople > 0
    }
    
    func header() -> some View {
        HStack {
            Text("Créer un event")
                .font(Font.custom("InstrumentSans-Bold", size: 30))
                .bold()
                .padding()
            Spacer()
        }
    }
    
    func form() -> some View {
        VStack() {
            Form {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Nom du groupe :")
                        .font(Font.custom("InstrumentSans-Bold", size: 16))
                    TextField("", text: ($input1), prompt: Text("Entrer un nom de groupe").foregroundColor(.black))
                        .padding(.leading)
                        .frame(maxWidth: .infinity)
                        .frame(width: 331,height: 55)
                        .background(Color.violet)
                        .background(.gray.opacity(0.15),in: .rect(cornerRadius: 30))
                }
                .foregroundColor(.black) // Couleur noire
                .padding(.bottom, 10)
                
                VStack {
                    HStack {
                        Text("Date de l'event :")
                            .font(Font.custom("InstrumentSans-Bold", size: 16))
                        Spacer()
                        Text("Heure de début :")
                            .font(Font.custom("InstrumentSans-Bold", size: 16))
                    }
                    
                    HStack {
                        DatePicker("Date :", selection: $selectedDate, displayedComponents: [.date])
                            .environment(\.locale, Locale(identifier: "fr_FR"))
                            .labelsHidden()
                        Spacer()
                        DatePicker("Heure :", selection: $selectedTime, displayedComponents: [.hourAndMinute])
                            .environment(\.locale, Locale(identifier: "fr_FR"))
                            .labelsHidden()
                    }
                }
                .padding(.bottom, 10)
                VStack(alignment: .leading, spacing: 8) {
                    Text("Localisation :")
                        .font(Font.custom("InstrumentSans-Bold", size: 16))
                    HStack {
                        TextField("", text: ($input3), prompt: Text("Adresse de l'event").foregroundColor(.black))
                            .padding(.leading, 32)
                            .frame(maxWidth: .infinity)
                            .frame(width: 331, height: 55)
                            .background(Color.violet)
                            .background(.gray.opacity(0.15), in: .rect(cornerRadius: 30))
                            .overlay(
                                HStack {
                                    Image(systemName: "mappin.and.ellipse")
                                        .foregroundColor(.black)
                                        .padding(.leading, 8)
                                    Spacer()
                                }
                            )
                    }
                }
                .padding(.bottom, 10)
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Description :")
                        .font(Font.custom("InstrumentSans-Bold", size: 16))
                    TextField("", text: ($input4), prompt: Text("Entrer une description").foregroundColor(.black))
                        .padding(.leading)
                        .frame(maxWidth: .infinity)
                        .frame(width: 331,height: 55)
                        .background(.gray.opacity(0.15),in: .rect(cornerRadius: 30))
                    
                }
                .padding(.bottom, 10)
                
                VStack {
                    Picker("Nombre de participants :", selection: $numberOfPeople) {
                        ForEach(0..<101) { number in
                            Text("\(number)")
                        }
                    }
                    .pickerStyle(.menu)
                    .font(Font.custom("InstrumentSans-Bold", size: 16))
                    .font(.headline)
                }
                .padding(.bottom, 10)
                Button(action: {
                    showingAlert = true;
                }) {
                    Text("Créer")
                        .font(Font.custom("InstrumentSans-Bold",size: 16))                        .foregroundColor(.black)
                        .frame(width: 331, height: 56)
                        .background(Color.vert)
                        .cornerRadius(30)
                }
                .disabled(!isFormComplete)
                .alert(isPresented: $showingAlert) {
                    Alert(
                        title: Text("Événement créé"),
                        message: Text("Votre événement a été créé avec succès."),
                        dismissButton: .default(Text("OK"))
                    )
                }
            }
        }
        .scrollContentBackground(.hidden)
    }
    
    var body: some View {
        VStack {
            header()
            form()
        }
    }
}

struct CreeView_Previews: PreviewProvider {
    static var previews: some View {
        CreeView()
    }
}
