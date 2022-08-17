//
//  InscriptionView.swift
//  Connect'Aide
//
//  Created by Marilyne LEAM on 24/06/2021.
//

import SwiftUI
import MapKit

struct InscriptionView: View {
    @State private var pseudo: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @StateObject var arrayOfPeople = UsersOfMyApp(persons: [persOne, persTwo, persThree, persFour, persFive, persSix, persSeven, persEight])

  func createAccount(){


    arrayOfPeople.persons.append(People(
        mail: email, tel: "", website: "", pix: "", role: .Aidant, coordonnees:CLLocationCoordinate2D(latitude: 48.264, longitude: 2.367), pseudo: pseudo, onLocalisation: false, nomEntreprise: "", pathologies: "", ville: "Paris"))
      resetForm()

   }

   func resetForm(){
       pseudo = ""
        email = ""
        password = ""
   }
   var body: some View {
      NavigationView {
         VStack {
              Spacer()
                  
                Text("Connect'Aide")
                    .font(.largeTitle)
                   .bold()
                    .foregroundColor(.red)
                    .padding(.vertical,18)
                Spacer()
                    .frame(height: 25)

                VStack{
                    VStack{
                        TextField("Pseudo", text: $pseudo)
                            .padding(.horizontal)
                            .cornerRadius(20)
                        TextField("Email", text: $email)
                            .padding(.horizontal)
                            .cornerRadius(20)
                        SecureField("Password", text: $password)
                            .padding(.horizontal)
                            .cornerRadius(20)

                    }

                }.textFieldStyle(RoundedBorderTextFieldStyle())
                Spacer()
                    .frame(height:20)
                Button(action:{createAccount()}
                ){
                   Text("S'inscrire")
                }.frame(maxWidth:.infinity)
                   .padding()
                   .background(Color.red)
                   .cornerRadius(10.0)
                    .foregroundColor(.white)
                Spacer()
                VStack{
                    Text("En créant ce compte, vous acceptez nos conditions.")
                        .padding(.bottom, 4)
                    HStack{
                        Text("Vous avez déjà un compte?")
                        NavigationLink("Se connecter", destination: ConnectionView())
                            .foregroundColor(.red)
                    }
                }.font(.caption)
               .foregroundColor(.secondary)
           Spacer()
        }.padding()
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
   }}

struct Connect_AideAppInscriptionView_Previews: PreviewProvider {
    static var previews: some View {
        InscriptionView()
    }
}
