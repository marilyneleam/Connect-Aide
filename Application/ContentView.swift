//
//  ContentView.swift
//  Connect'Aide
//
//  Created by Marilyne LEAM on 22/06/2021.
//

import SwiftUI

struct ContentView: View {
    @State var modification: Bool = false
    @StateObject var arrayOfPeople = UsersOfMyApp(persons: [persOne, persTwo, persThree, persFour, persFive, persSix, persSeven, persEight])
    
    var body: some View {
        TabView {
            PlanView(hoveredOver: UUID(), myArrayOfUsers: arrayOfPeople )
                .tabItem {
                    Image(systemName: "map")
                    Text("Plan")
                }
            MessagesView(datas: tabConversation)
                .tabItem {
                    Image(systemName: "envelope")
                    Text("Messages")
                }
            ProfileView(data: sylvie, modification: modification)
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profil")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
