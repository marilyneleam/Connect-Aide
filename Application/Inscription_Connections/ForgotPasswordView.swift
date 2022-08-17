//
//  ForgotPasswordView.swift
//  Connect'Aide
//
//  Created by Marilyne LEAM on 28/06/2021.
//

import SwiftUI

struct ForgotPassword: View {
    @State var mdp = ""
    var body: some View {
        VStack {
            Spacer()
            Text("Mot de passe oublié ?")
                .font(.title)
                .bold()
            
            TextField("Renseigner votre adresse mail", text: $mdp)
                .keyboardType(.emailAddress)
                .background(Color(.systemGray6))
                .frame(width:270)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Text("Reinitialiser le mot de passe")
                    .multilineTextAlignment(.center)
                    .padding()
                
            })
            Spacer()
        }

        
    }
}

struct ForgotPassword_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPassword()
    }
}
