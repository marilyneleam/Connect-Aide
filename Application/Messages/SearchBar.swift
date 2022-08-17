//
//  SearchBar.swift
//  Connect'Aide
//
//  Created by Marilyne LEAM on 23/06/2021.
//

import SwiftUI

struct SearchBar: View {
    @Binding var searchText: String
    @State private var isEditing = false
    var body: some View {
        HStack{
            TextField("Rechercher...", text: $searchText)
                .padding(15)
                .padding(.horizontal,25)
                .background(Color(.systemGray6))
                .cornerRadius(20)
                .autocapitalization(.none)
                .overlay(
                    HStack{
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                            .padding(.leading, 15)
                        if isEditing {
                            Button(action: {
                                self.searchText = ""
                            }){
                                Image(systemName: "multiply.circle.fill")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 8)
                            }
                        }
                    }
                ).onTapGesture {
                    self.isEditing = true
                    
                }
            if isEditing {
                Button(action: {
                    self.isEditing = false
                    
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                }){
                    Text("Cancel")
                }
                .padding(.trailing, 10)
                .transition(.move(edge: .trailing))
                .animation(.default)
            }
        }
        
    }
}
