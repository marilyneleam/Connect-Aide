//
//  PlanView.swift
//  Connect'Aide
//
//  Created by Marilyne LEAM on 22/06/2021.
//

import SwiftUI
import MapKit

struct PlanView: View {
    @State var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(
            latitude: 48.8,
            longitude: 2.3),
        span: MKCoordinateSpan(latitudeDelta: 1,
                               longitudeDelta: 1))
    
   /* func save() {
        if let encoded = try? JSONEncoder().encode(People) {
            UserDefaults.standard.set(encoded, forKey: "SavedData")
        }
    }
    */
    @State var hoveredOver: UUID
    @State var showingModal = false
    
    //  ajout
  //  @State var myArrayOfUsers = users
    @ObservedObject var myArrayOfUsers: UsersOfMyApp

    var body: some View {
        NavigationView {
            VStack{
                    ZStack{
                        Map(coordinateRegion: $region, annotationItems: myArrayOfUsers.persons){ user in
                            MapAnnotation(
                                coordinate: user.coordonnees ,
                                anchorPoint: CGPoint(x: 0.5, y: 0.5)
                            ){
                                DisplayPointerView(hoveredPointer: $hoveredOver, user: user)
                            }
                        }
                        .ignoresSafeArea(.all)
                        VStack{
                           // NavigationLink(destination: FiltreView()){
                                HStack {
                                    Spacer()
                                    Button(action: {
                                        print("coucou");
                                            showingModal = true;
                                            myArrayOfUsers.persons = [persOne, persTwo, persThree, persFour, persFive, persSix, persSeven, persEight]
                                        
                                    }, label: {
                                        ZStack{
                                            Circle()
                                                .frame(width: 60, height: 60)
                                                .foregroundColor(.red)
                                            Image(systemName: "slider.horizontal.3")
                                                .resizable()
                                                .frame(width: 25, height: 25)
                                                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                                                .foregroundColor(.white)
                                        }
                                    }).padding()
                                    
                                }
                            Spacer()
                            }
                        
                        GeoReader(selectedIndex: $hoveredOver, myArrayOfUsers: $myArrayOfUsers.persons)
                    }
                }.sheet(isPresented: $showingModal, content: {
                    FiltreView(isPresented: $showingModal, myArrayOfUsers: $myArrayOfUsers.persons)
            })
        }
    }
}


struct PlanView_Previews: PreviewProvider {
    static var previews: some View {
        PlanView(hoveredOver: UUID(), myArrayOfUsers: UsersOfMyApp(persons: [persOne, persTwo, persThree, persFour, persFive, persSix, persSeven, persEight] ))
    }
}

struct DisplayPointerView: View {
    @Binding var hoveredPointer : UUID
    @ObservedObject var user: People
    
    var body: some View {
        
        Image(systemName: user.role.icone )
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(user.role.couleur)
            .frame(width: 25, height: 25)
            .padding(4)
            .background( Color.white.opacity(0.7))
            .cornerRadius(30.00)
            .scaleEffect(user.id == hoveredPointer ? 1.2 : 1)
            .onTapGesture() {
                print(user.id)
                hoveredPointer = user.id
            }
        if hoveredPointer == user.id {
            
            NavigationLink(
                destination: DetailContactPeople(contact: user),
                label: {
                HStack{
                    Text(user.pseudo)
                }
            }).font(.caption)
                .frame(width:100, height:35)
                .padding(.vertical,5)
                .padding(.leading, 35)
                .background(Color.white.opacity(0.5))
                .cornerRadius(20.0)
            
            
                .offset(x: 48, y: -46)
                .foregroundColor(.primary)
            
            
                .zIndex(14)
        }
    }
}
