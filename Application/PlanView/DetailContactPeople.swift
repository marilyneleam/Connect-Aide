//
//  DetailContactPeople.swift
//  Connect'Aide
//
//  Created by Marilyne LEAM on 24/06/2021.
//

import SwiftUI

struct DetailContactPeople: View {
    @State var contact : People
    @State private var alerteIsPresented = false
    var body: some View {
        
        VStack {
            Photo(contact: $contact.pix)
            Spacer()
                .frame( height: 25)
            Text(contact.role.description)
                .padding()
                .frame(width: 150, height: 50)
                .background(contact.role.couleur)
                .font(.headline)
                .foregroundColor(.white)
                .cornerRadius(10)
            Spacer()
            Identite(information: $contact)
            Spacer()
            Button  (action: {
                self .alerteIsPresented = true
            }, label: {
                Text("Contacter cette personne")
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .alert(isPresented: $alerteIsPresented, content: {
                    Alert(title: Text ("Votre contact a bien été ajouté dans messages"), primaryButton:.cancel(Text("Annuler")), secondaryButton: .default(Text("Ok")))
                })
            })
            Spacer()
        }
        .navigationTitle("Détail Contact")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct DetailContactPeople_Previews: PreviewProvider {
    static var previews: some View {
        DetailContactPeople(contact:persFour)
    }
}

struct Photo: View {
    @Binding   var contact: String
    
    var body: some View {
        Image(contact)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(height: 210, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .clipped()
    }
}

struct Identite: View {
    @Binding var information:People
    var body: some View {
      VStack  {
        
        Text(information.pseudo)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .padding(.bottom,30)
          Text(information.nomEntreprise)
            .font(.title2)
            .padding(7)
        Text(information.mail)
              
        Text(information.tel)
                
        Text(information.website)
                .padding()
        }
    }
}
