//
//  TableauDeDonnees.swift
//  Connect'Aide
//
//  Created by Marilyne LEAM on 22/06/2021.
//

import Foundation
import SwiftUI
import MapKit

// Différentes personnes et entreprises
var persOne = People(mail: "c.deets@gmail.com", tel: "01 52 64 72 56", website: "", pix: "1", role: .Aidant, coordonnees: CLLocationCoordinate2D(latitude: 48.861, longitude: 2.365), pseudo: "Charlie Deets", onLocalisation: true, nomEntreprise: "", pathologies: "Cancers", ville: "Paris")
var persTwo = People(mail: "j.didou@gmail.com", tel: "01 52 64 72 56", website: "", pix: "2", role: .Aidé, coordonnees: CLLocationCoordinate2D(latitude: 48.792, longitude: 2.359), pseudo : "Jérôme Didou", onLocalisation: false, nomEntreprise: "", pathologies: "Cancers", ville: "Marseille")
var persThree = People(mail: "assistante@clinique.fr", tel: "01 52 64 72 56", website: "www.clinique.fr", pix: "3", role: .Entreprise, coordonnees: CLLocationCoordinate2D(latitude: 48.550, longitude: 2.274), pseudo : "Clara Dubois", onLocalisation: false, nomEntreprise: "Clinique", pathologies: "Cancers", ville: "")
var persFour = People(mail: "contact@association.soleil.fr", tel: "01 52 64 72 56", website: "www.soleil.com", pix: "4", role: .Association, coordonnees: CLLocationCoordinate2D(latitude: 48.892, longitude: 2.215), pseudo : "Jérémy Cléo", onLocalisation: false, nomEntreprise: "Association Soleil", pathologies: "Cancers", ville: "Toulouse")
var persFive = People(mail: "contact@aphp.fr", tel: "01 52 64 72 56", website: "www.aphp.fr", pix: "5", role: .Autres, coordonnees: CLLocationCoordinate2D(latitude: 48.751, longitude: 2.103), pseudo : "Marie Bison", onLocalisation: false, nomEntreprise: "APHP", pathologies: "Cancers", ville: "Paris")
var persSix = People(mail: "m.kello@gmail.com", tel: "01 52 64 72 56", website: "", pix: "6", role: .Autres, coordonnees: CLLocationCoordinate2D(latitude: 48.630, longitude: 2.234), pseudo : "Mehdi Kello", onLocalisation: false, nomEntreprise: "", pathologies: "Cancers", ville: "Paris")
var persSeven = People(mail: "dclerc@gmail.com", tel: "01 52 64 72 56", website: "", pix: "7", role: .Aidé, coordonnees: CLLocationCoordinate2D(latitude: 48.85, longitude: 2.566), pseudo : "David Clerc", onLocalisation: false, nomEntreprise: "", pathologies: "Cancers", ville: "Paris")
var persEight = People(mail: "c_dupont@gmail.com", tel: "01 52 64 72 56", website: "", pix: "8", role: .Aidant, coordonnees: CLLocationCoordinate2D(latitude: 48.661, longitude: 2.345), pseudo: "Claire Dupont", onLocalisation: true, nomEntreprise: "", pathologies: "Cancers", ville: "Paris")
var sylvie = People(mail: "sylvie@gmail.com", tel: "", website: "", pix: "sylvie", role: .Aidant, coordonnees: CLLocationCoordinate2D(latitude: 48.861, longitude: 2.366), pseudo: "Sylvie", onLocalisation: true, nomEntreprise: "", pathologies: "Cancers", ville: "Paris")

// ConversationView

var infoConv1 = Conversation(destinataire: persOne, lastMessage: conv1[conv1.count - 1].msg, msgList: conv1)
var infoConv2 = Conversation(destinataire: persTwo, lastMessage: conv2[conv2.count - 1].msg, msgList: conv2)
var infoConv3 = Conversation(destinataire: persThree, lastMessage: conv3[conv3.count - 1].msg, msgList: conv3)
var infoConv4 = Conversation(destinataire: persFour, lastMessage: conv4[conv4.count - 1].msg, msgList: conv4)
var infoConv5 = Conversation(destinataire: persFive, lastMessage: conv5[conv5.count - 1].msg, msgList: conv5)
var infoConv6 = Conversation(destinataire: persSix, lastMessage: conv6[conv6.count - 1].msg, msgList: conv6)
var infoConv7 = Conversation(destinataire: persSeven, lastMessage: conv7[conv7.count - 1].msg, msgList: conv7)
var infoConv8 = Conversation(destinataire: persEight, lastMessage: conv8[conv8.count - 1].msg, msgList: conv8)

var tabConversation : [Conversation] = [infoConv1, infoConv2, infoConv3, infoConv4, infoConv5, infoConv6, infoConv7, infoConv8]

//Conversations
var conv1 = [ Message(msg: "Salut", myMsg: false),
              Message(msg: "Contente d'avoir de tes nouvelles", myMsg: false),
              Message(msg: "Comment vas-tu ?", myMsg: false),
              Message(msg: "Je vais bien et toi ?", myMsg: true),
              Message(msg: "Où es-tu ?", myMsg: false),
              Message(msg: "J'ai été admise à l'hôpital...", myMsg: true),
              Message(msg: "Ah bon, qu'est ce qui se passe ?", myMsg: true),
              Message(msg: "Rien de bien grave mais je dois y rester quelques temps encore", myMsg: false),
              Message(msg: "Prends bien soin de toi !", myMsg: true),
              Message(msg: "Donne moi de tes nouvelles quand tu peux", myMsg: true)]

var conv2 = [ Message(msg: "Hi !", myMsg: true),
              Message(msg: "I'm happy and you ?", myMsg: true),
              Message(msg: "I'm happy too", myMsg: false),
              Message(msg: "What's up ?", myMsg: false),
              Message(msg: "Nothing and you ?", myMsg: true),
              Message(msg: "Nothing too", myMsg: false) ]

var conv3 = [Message(msg: "It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.", myMsg: true)]

var conv4 = [Message(msg: "C’est une informaticienne chevronnée de 35 ans. Une surdouée qui s’est découvert une passion pour l’informatique.", myMsg: false)]

var conv5 = [Message(msg: "Comment vas ton grand-père ?", myMsg: false)]

var conv6 = [Message(msg: "Pourquoi Florence est-elle enthousiaste ?", myMsg: false),
             Message(msg: "Florence est très excitée à l’idée de se brancher sur un réseau militaire, mais en même temps, elle sait que cela va lui apporter des ennuis.", myMsg: true)]

var conv7 = [Message(msg: "Hello", myMsg: true),
             Message(msg: "How are you ?", myMsg: true),
             Message(msg: "I'm fine, thanks", myMsg: false)]

var conv8 = [Message(msg: "Have a nice day", myMsg: false),
             Message(msg: "Thank you", myMsg: true)]

var pathologies = ["Maladies cardiaques et vasculaires", "Cancers", "Maladies endocriniennes", "Maladies respiratoires et ORL", "Maladies du système digestif", "Maladies rhumatologiques", "Maladies neurologiques et musculaires", "Maladies psychiatriques et psychologiques", "Maladies rénales, urinaires ou génitales", "Maladues de la peau", "Maladies des yeux", "Maladies systémiques", "Maladies infectieuses chroniques", "Maladies hématologiques" ]

var loggedAccount = persOne

var villes = ["Toulouse":"31000", "Paris":"75001", "Marseille": "13000"]
