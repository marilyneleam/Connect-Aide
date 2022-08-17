//
//  MessagesView.swift
//  Connect'Aide
//
//  Created by Marilyne LEAM on 22/06/2021.
//


// Idées : inviter un contact // épingler un message

import SwiftUI

struct MessagesView: View {
    @State private var txt = ""
    @State var datas: [Conversation]
    var body: some View {
        NavigationView {
            VStack {
                SearchBar(searchText: $txt)
                List{
                    ForEach(datas.filter({"\($0)".lowercased().contains(txt.lowercased()) || "\($0.destinataire.pseudo)".lowercased().contains(txt.lowercased()) || txt.isEmpty})) { conversation in
                        NavigationLink(
                            destination: ConversationView(datas: conversation),
                            label: {
                                PeopleCase(data: conversation
                                )}
                        )
                        .padding(10)
                    }
                    .onDelete(perform: onDelete)
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("Messages")
            .navigationBarTitleDisplayMode(.automatic)
            .navigationBarItems(leading: EditButton())
        }
    }
    func onDelete(offsets: IndexSet) {
        datas.remove(atOffsets: offsets)
    }
}

struct PeopleCase: View {
    let data: Conversation
    var body: some View {
        HStack{
            HStack{
                Image(data.destinataire.pix)
                    .resizable()
                    .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                    .frame(width: 60, height: 60)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                Spacer()
                    .frame(width:15)
            }
            VStack (alignment: .leading){
                HStack{
                    Text(data.destinataire.pseudo)
                        .bold()
                        .font(.title2)
                    Spacer()
                    Hours()
                }
                HStack{
                    Text(data.lastMessage)
                        .font(.callout)
                        .lineLimit(2)
                }
            }
        }
    }
}

struct Hours: View {
    var body: some View {
        Text(Date(), style: .time)
            .foregroundColor(.gray)
    }
}

struct MessagesView_Previews: PreviewProvider {
    static var previews: some View {
        MessagesView(datas: tabConversation)
    }
}
