//
//  FiltreView.swift
//  Connect'Aide
//
//  Created by Marilyne LEAM on 24/06/2021.
//

import SwiftUI

import SwiftUI

struct FiltreView: View {
    
    @State private var showGreeting = true
    @State private var distance = 250.0
    //    @State private var isEditing = false
    @State var searchVille: String = ""
    @State var selectRole : Role = .Tous          //  change29 + struct role
    @State var selectPathologie: String? = nil          ///  cahnge 29
    
    //@Binding var usersToFilter: [People]
    @Binding var isPresented : Bool
    //    @Binding var myArrayOfUsers: [People]
    @Binding var myArrayOfUsers: [People]
    
    var body: some View {
        
        // Contenus de l'interface Filtre
        NavigationView {
            VStack {
                Form {
                    Section(header: Text("Localisation")) {
                        VStack(alignment : .leading){
                            TextField("Ville", text: $searchVille)
                                .padding()
                                .background(Color(.systemGray5))
                                .cornerRadius(10)
                            
                            Toggle("Localisez-moi", isOn: $showGreeting)
                                .toggleStyle(SwitchToggleStyle(tint: .red))
                        }
                        .padding(.vertical)
                        VStack(alignment: .leading){
                            Text("Étendre ma recherche")
                            Slider(value: $distance, in: 0...500)
                            HStack {
                                Text("0 km")
                                Spacer()
                                Text("\(String(format : "%.f", distance)) km")
                                    .foregroundColor(.red)
                                Spacer()
                                Text("500 km")
                            }
                        }.padding(.vertical)
                    }
                    
                    
                    Section(header: Text("Sélectionner un rôle")) {
                        Picker("Rôle", selection: $selectRole) {
                            ForEach(Role.allCases) {
                                value in
                                Text(value.description)
                            }
                        }}
                    
                    
                    Section(header: Text("Sélectionner une pathologie")) {
                        Picker("Maladies", selection: $selectPathologie, content: {
                            Text("Pas de séléction").tag(nil as String?)         //   cahnge   29
                            ForEach(pathologies, id: \.self){
                                maladie  in Text(maladie).tag(maladie as String?)      //change 29
                                
                            }
                        }) }
                }
                Button(action: {
                    
                    myArrayOfUsers = myArrayOfUsers.filter{$0.ville.lowercased() == searchVille.lowercased()}
                    
                    //modif  sur mapresultcardview            // les liens  marchent pas    sur mapresutlcard   et sur le plan en general vieux nom de view
                    myArrayOfUsers =  myArrayOfUsers.filter{ $0.distanceFromLoggedAccount < distance}
                    
                    
                    if selectRole != .Tous {
                        myArrayOfUsers =   myArrayOfUsers.filter{ $0.role.description == selectRole.description
                            
                        }
                        
                    };
                    
                    if let pathoSelected = selectPathologie {
                        
                        myArrayOfUsers =  myArrayOfUsers.filter{$0.pathologies == pathoSelected}
                    };
                    
                    isPresented = false;
                    print(myArrayOfUsers)
                },
                label: {
                    HStack {
                        Spacer()
                        Text("Valider les filtres")
                            .padding()
                            
                            .background(Color.red)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                        Spacer()
                    }
                })
            }
            .navigationBarTitle("Mes filtres")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading:
                                    Button("Annuler") {
                                        isPresented = false
                                    })
            
        }
    }
}


//struct CapsuleView: View {
//    let name: String
//    let color: Color
//
//    var body: some View {
//    }
//}

struct FiltreView_Previews: PreviewProvider {
    static var previews: some View {
        FiltreView(isPresented: .constant(true), myArrayOfUsers: .constant([persOne, persTwo, persThree, persFour, persFive, persSix, persSeven, persEight]))
        
    }
}


