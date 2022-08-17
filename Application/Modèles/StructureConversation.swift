//
//  StructureConversation.swift
//  Connect'Aide
//
//  Created by Marilyne LEAM on 22/06/2021.
//

import Foundation
import SwiftUI

struct Conversation: Identifiable {
    var id = UUID()
    var destinataire: People
    var lastMessage: String
    var msgList: [Message]
}
