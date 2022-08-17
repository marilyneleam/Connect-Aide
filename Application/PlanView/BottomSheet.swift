//
//  BottomSheet.swift
//  Connect'Aide
//
//  Created by Marilyne LEAM on 23/06/2021.
//

import SwiftUI

struct BottomSheet: View {
//    @State var txt = ""
    @Binding var offset: CGFloat
    @Binding var selectedIndex: UUID

    
    @Binding var myArrayOfUsers: [People]
    var value: CGFloat
    var body: some View {
        VStack {
            Capsule()
                .fill(Color.gray.opacity(0.5))
                .frame(width: 50, height: 5)
                .padding()
//                .padding(.bottom, 5)
//                        HStack {
//                            Image(systemName: "magnifyingglass")
//                                .font(.system(size: 22))
//                                .foregroundColor(.gray)
//                            TextField("Rechercher", text: $txt) { (status) in
//                                withAnimation{
//                                    offset = value
//                                }
//
//                            } onCommit: {
//
//                            }
//                        }
//                        .padding(.vertical, 10)
//                        .padding(.horizontal)
//                        .background(BlurView(style: .systemMaterial))
//                        .cornerRadius(15)
//                        .padding()
            Text("A proximité\n")
                .font(.title2)

            ScrollView(.horizontal, showsIndicators: false, content: {
                            ScrollViewReader { reader in            ////  ajout

                            LazyHStack(alignment: .top, spacing: 15, content: {
                                ForEach(myArrayOfUsers){ user in

                                    MapResultCard(user: user)
                                }
                                .onChange(of: selectedIndex, perform: { val in
                                    reader.scrollTo(val, anchor:.leading)         ////  ajout
                                })
                            })
                            .padding(.horizontal)
                            }
                        })
                    }
                    .background(BlurShape())
                    .cornerRadius(15)
                }
            }

struct BlurShape: UIViewRepresentable {
    func makeUIView(context: Context) -> UIVisualEffectView {
        return UIVisualEffectView(effect: UIBlurEffect(style: .systemMaterial))
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
    }
}

struct GeoReader: View {
    @State var offset: CGFloat = 0
    @Binding var selectedIndex: UUID
    @Binding var myArrayOfUsers: [People]
    var body: some View {
        GeometryReader { reader in
            VStack {
                BottomSheet(offset: $offset, selectedIndex: $selectedIndex, myArrayOfUsers: $myArrayOfUsers, value: (-reader.frame(in: .global).height + 150))
                    .offset(y: reader.frame(in: .global).height - 175)
                    .offset(y: offset)
                    .gesture(DragGesture().onChanged( { (value) in

                        withAnimation{
                            if value.startLocation.y > reader.frame(in: .global).midX{
                                if value.translation.height < 0 && offset > (-reader.frame(in: .global).height + 150){
                                    offset = value.translation.height
                                }
                            }
                            if value.startLocation.y < reader.frame(in: .global).midX{
                                if value.translation.height > 0 && offset < 0 {
                                    offset = (-reader.frame(in: .global).height + 150) + value.translation.height
                                }
                            }
                        }

                    }).onEnded( { (value) in
                        withAnimation{
                            if value.startLocation.y > reader.frame(in: .global).midX{
                                if -value.translation.height > reader.frame(in: .global).midX{
                                    offset = (-reader.frame(in: .global).height + UIScreen.main.bounds.height-475)

                                    return
                                }
                                offset = 0
                            }
                            if value.startLocation.y < reader.frame(in: .global).midX{
                                if value.translation.height < reader.frame(in: .global).midX{
                                    offset = (-reader.frame(in: .global).height + 150)

                                    return
                                }
                                offset = 0
                            }
                        }
                    }))
            }
        }
        .ignoresSafeArea(.all, edges: .bottom)
    }
}
