//
//  StructurePeople.swift
//  Connect'Aide
//
//  Created by Marilyne LEAM on 22/06/2021.
//

import Foundation
import SwiftUI
import MapKit

class UsersOfMyApp: ObservableObject{
    internal init(persons: [People]) {
        self.persons = persons
    }
    @Published var persons: [People]
    
}



class People: Identifiable, ObservableObject {
    
    internal init(mail: String, tel: String, website: String, pix: String, role: Role, coordonnees: CLLocationCoordinate2D, pseudo: String, onLocalisation: Bool, nomEntreprise: String, pathologies: String, ville: String) {
        self.mail = mail
        self.tel = tel
        self.website = website
        self.pix = pix
        self.role = role
        self.coordonnees = coordonnees
        self.pseudo = pseudo
        self.onLocalisation = onLocalisation
        self.nomEntreprise = nomEntreprise
        self.pathologies = pathologies
        self.ville = ville
    }
    
    var id = UUID()
    @Published var mail: String
    @Published var tel: String
    @Published var website: String
    @Published var pix: String
    @Published var role: Role
    @Published var coordonnees: CLLocationCoordinate2D
    @Published var pseudo: String
    @Published var onLocalisation: Bool
    @Published var nomEntreprise: String
    @Published var pathologies: String
    @Published var ville: String
    
    var distanceFromLoggedAccount: Double{
        get{
            let p = 0.017453292519943295;    // Math.PI / 180
            
            let a = 0.5 - cos((coordonnees.latitude - coordonnees.latitude) * p)/2 +
                    cos(coordonnees.latitude * p) * cos(loggedAccount.coordonnees.latitude * p) *
                    (1 - cos((loggedAccount.coordonnees.longitude - coordonnees.longitude) * p))/2;

            return 12742 * asin(a.squareRoot());
        }
    }
    
  // @Published var allPeople = [persOne, persTwo, persThree, persFour, persFive, persSix, persSeven, persEight]
    
}


extension CLLocationCoordinate2D: Hashable {

    public static func == (lhs: Self, rhs: Self) -> Bool {
           return lhs.latitude == rhs.latitude && lhs.longitude == rhs.longitude
       }

       public func hash(into hasher: inout Hasher) {
           hasher.combine(latitude)
           hasher.combine(longitude)
       }
}
