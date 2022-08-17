//
//  Profil.swif$
//  Connect'Aide
//
//  Created by Marilyne LEAM on 26/06/2021.
//

import SwiftUI

struct ProfileView: View {
    @ObservedObject var data: People
    @State private var selectPathologie = ""
    @State private var mdp = ""
    @State var modification = false
    
    var body: some View {
        NavigationView {
            Form{
                Section {
                    VStack (alignment: .center){
                        Image(data.pix)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .clipShape(Circle())
                            .frame(width: 150, height: 150, alignment: .center)
                        Spacer(minLength: 15)
                        HStack{
                            Spacer()
                            Text(data.pseudo)
                            
                            Spacer()
                        }
                    }
                }
                Section (header: Text("Informations")){
                    VStack (alignment: .leading){
                        Text(data.nomEntreprise)
                        Text(data.tel)
                        Text(data.website)
                        Text(data.mail)
                    }
                }
                
                Section(header: Text("Localisation")) {
                    Text(data.ville)
                    Text(villes[data.ville] ?? "")
                }
                
                Section(header: Text("Rôle")) {
                    Text(data.role.description)
                }
                
                
                Section(header: Text("Pathologies")) {
                    Text(data.pathologies)
                    
                }
            }
            .navigationBarTitle("Profil")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing:
                                    Button(action:{
                            modification = true
                                    },label: {
                                        Text("Modifier")}
                                    ))
        }
        .sheet(isPresented: $modification, content: {
            ProfilModifierView(data: data, modification: $modification)
            
        })
    }
}


struct ProfileEditView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(data: persFour)
    }
}
