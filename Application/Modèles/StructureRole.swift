//
//  StructureRole.swift
//  Connect'Aide
//
//  Created by Marilyne LEAM on 22/06/2021.
//

import Foundation
import SwiftUI

enum Role: CustomStringConvertible, CaseIterable, Identifiable {
    
    var id: Self {self}
    
    var description: String {
        switch self {
        case .Aidant:
            return "Aidant"
        case .Aidé:
            return "Aidé"
        case .Association:
            return "Association"
        case .Entreprise:
            return "Entreprise"
        case .Autres:
            return "Autres"
        case .Tous:
            return "Tous"
        }
    }
    var icone: String {
        switch self {
        case .Aidant:
            return "figure.wave"
        case .Aidé:
            return "figure.stand.line.dotted.figure.stand"
        case .Association:
            return "person.3"
        case .Entreprise:
            return "stethoscope"
        case .Autres:
            return "circle"
        case .Tous:
            return "square"
        }
    }
    var couleur: Color {
        switch self {
        
        case .Aidant:
            return .blue
        case .Aidé:
            return .green
        case .Association:
            return .pink
        case .Entreprise:
            return .orange
        case .Autres:
            return .purple
        case .Tous:
            return .yellow
        }
    }
    case Aidant, Aidé, Association, Entreprise, Autres, Tous
}

