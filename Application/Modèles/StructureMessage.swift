//
//  StructureMessage.swift
//  Connect'Aide
//
//  Created by Marilyne LEAM on 22/06/2021.
//

import Foundation
import SwiftUI

struct Message : Equatable {
    var messageId = UUID().uuidString
    var msg: String
    var myMsg: Bool
}
