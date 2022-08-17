//
//  ConnectionView.swift
//  Connect'Aide
//
//  Created by Marilyne LEAM on 24/06/2021.
//

import SwiftUI

struct ConnectionView: View {
    @State var value = ""
   @State var mdp = ""
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
                        TextField("Mail/Pseudo", text: $value)
                            .padding(.horizontal)
                            .cornerRadius(20)

                        SecureField("Password", text: $mdp)
                            .background(Color(.systemGray4))
                           .padding(.horizontal)
                            .cornerRadius(20)
                    }
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    Spacer()
                        .frame(height:20)
                    Button(action:{}
                    ){
                        Text("Se connecter")
                   }.frame(maxWidth:.infinity)
                    .padding()
                    .background(Color.red)
                    .cornerRadius(10.0)
                   .foregroundColor(.white)
                }
                Spacer()
                    .frame(height: 30)
                   NavigationLink (
                        destination: ForgotPassword(),
                        label: {
                           Text("Mot de passe oublié")
                                .padding()

                        })
                    NavigationLink (
                        destination: InscriptionView(),
                        label: {
                            Text("S'inscrire")
                                .padding()
                        })
                Spacer()

            }.padding()
            .navigationBarTitle("")
            .navigationBarHidden(true)
        }
    }
}
struct ConnectionView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ConnectionView()
                .preferredColorScheme(.light)

        }
    }
}
