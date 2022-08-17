//
//  ProfilModifierView.swift
//  Connect'Aide
//
//  Created by Marilyne LEAM on 23/06/2021.
//

import SwiftUI

struct ProfilModifierView: View {
    
    @ObservedObject var data: People
    @State private var selectPathologie = ""
    @State private var mdp = ""
    @Binding var modification : Bool
    
    var body: some View {
        NavigationView {
            Form{
                Section {
                    VStack (alignment: .center) {
                        Image(data.pix)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .clipShape(Circle())
                            .frame(width: 150, height: 150, alignment: .center)
                        Spacer(minLength: 15)
                        HStack{
                            TextField("Nom/ Pseudo", text: $data.pseudo)
                                
                                .multilineTextAlignment(.center)
                        }
                    }
                }
                Section (header: Text("Informations")){
                    VStack{
                        TextField("Nom de l'entreprise", text: $data.nomEntreprise)
                        TextField("Téléphone", text: $data.tel)
                        
                        TextField("Mail", text: $data.mail)
                        
                        //Button qui va vers modification mdp
                        SecureField("Modifier le mot de passe ", text: $mdp)
                        
                        TextField("Website", text: $data.website)
                    }
                }
                
                //Localisation avec utilisation d'un dictionnaire pour retrouver la ville
                Section(header: Text("Localisation")) {
                    TextField("Code Postal", text: $data.ville)
                    Text (villes[data.ville] ?? "")
                }
                
                // Modification du rôle
                Section(header: Text("Rôle")) {
                    Picker("Rôle", selection: $data.role) {
                        ForEach(Role.allCases) {
                            value in
                            Text(value.description)
                        }
                    }}
                
                
                Section(header: Text("Pathologies")) {
                    Picker("Maladies", selection: $selectPathologie, content: {
                        ForEach(pathologies, id: \.self){ maladie  in Text(maladie)}
                    })
                    
                }
            }
            .navigationBarTitle("Modifier profil")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading:
                                    
                                    HStack {
                                        Button("Annuler") {
                                            //Récupérations des données
                                            //Modifications des deonnées
                                            //Sauvegardes des données
                                            //Fermeture de la page
                                            //data = dataSave
                                            modification = false
                                        }
                                    }, trailing:
                                        HStack {
                                            Button("Ok") {
                                                modification = false
                                               
                                            }
                                        })
          
        }
    }
}

//struct ProfilModifierView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfilModifierView(data:persTwo, modification: .constant(false))
//        
//        
//    }
//}
