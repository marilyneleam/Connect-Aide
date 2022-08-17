//
//  MapResultCard.swift
//  Connect'Aide
//
//  Created by Marilyne LEAM on 24/06/2021.
//

import SwiftUI

struct MapResultCard: View {
    
    let user: People

    
    var body: some View {
        NavigationLink(destination: DetailContactPeople(contact: user)) {
            VStack (alignment : .leading){
                Image(user.pix)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width:180, height:150, alignment: .top)
                    .clipped()
                HStack{
                    Spacer()
                    Text(user.pseudo)
                        .font(.title2)
                    Spacer()
                }
                HStack{
                    Spacer()
                    Text(user.nomEntreprise)
                        .font(.body)
                    Spacer()
                }
                Spacer()
                HStack {
                    Image(systemName: user.role.icone)
                        .frame(width: 25, height: 25)
                        .clipShape(Rectangle())
                        .padding(10)
                        
                        .background(user.role.couleur)
                        .cornerRadius(10.0)
                        .foregroundColor(.white)

                    Spacer()
                    Text("\(String(format : "%.0.2f", user.distanceFromLoggedAccount))km")
                        .font(.callout)
                }
                .padding()
                Spacer()
                    .frame(height:10)
            }
            .frame(width:180, height:275)
            
            .background(Color.white)
            .cornerRadius(20.0)
        }
        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
        .foregroundColor(.secondary)
        
    }
}

struct MapResultCard_Previews: PreviewProvider {
    static var previews: some View {
        MapResultCard(user: persFive)
    }
}
