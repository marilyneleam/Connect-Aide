//
//  ConversationView.swift
//  Connect'Aide
//
//  Created by Marilyne LEAM on 24/06/2021.
//

import SwiftUI

struct ConversationView: View {
    @State var datas: Conversation
    var body: some View {
        ZStack{
            Color.clear
            VStack(spacing: 0){
                ChatTopView(data: datas)
                GeometryReader {_ in
                    ChatList(conv: $datas)
                }
                ChatBottomView(conv: $datas)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ChatTopView : View {
    var data: Conversation
    var body: some View {
        HStack{
            Spacer()
            VStack (spacing: 10){
                Image(data.destinataire.pix).resizable().aspectRatio(contentMode: .fill).frame(width: 60, height:60).clipShape(Circle())
                Text(data.destinataire.pseudo)
                    .fontWeight(.heavy)
            }
            Spacer()
        }
        .padding()
    }
}

struct ChatBottomView: View {
    @State var txt = ""
    @Binding var conv: Conversation
    var body: some View {
        HStack {
            HStack(spacing: 8){
                TextField("Messages", text: $txt, onCommit: {
                    conv.msgList.append(Message(msg: txt, myMsg: true))
                    txt = ""
                })
                Button(action: {
                    
                }) {
                    Image(systemName: "camera.fill").font(.body)
                }.foregroundColor(.gray)
                    .padding(.horizontal, 5)
                Button(action: {
                    
                }) {
                    Image(systemName: "paperclip").font(.body)
                }.foregroundColor(.gray)
                    .padding(.horizontal, 5)
                Button(action: {
                    
                }) {
                    Image(systemName: "mic.fill")
                        .background(Color(.systemGray5))
                        .padding(.horizontal, 5)
                }.foregroundColor(.gray)
            }.padding(20)
                .background(Color(.systemGray5))
                .clipShape(Capsule())
            
            Button(action: {
                conv.msgList.append(Message(msg: txt, myMsg: true))
                txt = ""
            }) {
                Image(systemName: "arrow.up.circle.fill")
                    .resizable()
                    .frame(width: 50, height: 50)
                
            }
        }.padding(.horizontal, 10)
            .background(Color.clear)
    }
}

struct ChatList: View {
    @Binding var conv: Conversation
 
    var body: some View {
        ScrollView {
            ScrollViewReader { scrollView in
                VStack {
                    ForEach(conv.msgList, id: \.messageId) {i in
                        HStack{
                        ChatCell(data: i)
                        }.id(i.messageId)
                    }
                }
                .onChange(of: conv.msgList, perform: { value in
                    DispatchQueue.main.async {
                        withAnimation{
                        scrollView.scrollTo(conv.msgList[conv.msgList.endIndex - 1].messageId, anchor: .bottom)
                        }
                    }
                })
                .onAppear {
                    scrollView.scrollTo(conv.msgList[conv.msgList.endIndex - 1].messageId, anchor: .bottom)}
            }
        }
        .padding()
        .background(Color.clear)
        .clipShape(Rectangle())
    }
}

struct ChatCell : View {
    var data: Message
    var body: some View {
        HStack{
            if data.myMsg{
                Spacer()
                Text(data.msg)
                    .font(.title3)
                    .padding()
                    .background(Color.red.opacity(0.80))
                    .clipShape(ConvForm(mymsg: data.myMsg))
                    .foregroundColor(.white)
            }
            else {
                Text(data.msg)
                    .font(.title3)
                    .padding()
                    .background(Color(.systemGray2))
                    .clipShape(ConvForm(mymsg: data.myMsg))
                    .foregroundColor(.white)
                Spacer()
            }
        }
        .padding(data.myMsg ? .leading : .trailing, 40)
    }
}

struct ConvForm : Shape {
    var mymsg : Bool

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft, .topRight, mymsg ? .bottomLeft : .bottomRight], cornerRadii: CGSize(width: 25, height: 25))
        return Path(path.cgPath)
    }
}

struct ConversationView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ConversationView(datas: infoConv1)
        }
    }
}
