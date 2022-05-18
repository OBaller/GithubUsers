//
//  UserSearchView.swift
//  GitUsers
//
//  Created by Naseem Oyebola on 18/05/2022.
//

import SwiftUI

struct UserSearchView: View {
    @ObservedObject var userViewModel = UserViewModel()
    @State private var searchText: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $searchText, onTextChanged: searchMovies)
                List {
                    if searchText == "" {
                        Text("Type to search Users")
                    } else {
                        ForEach(userViewModel.users.filter {
                            self.searchText.isEmpty ? true : $0.name.lowercased().contains(self.searchText.lowercased())
                        }) { user in
                            NavigationLink(destination: DetailsView(user: user)) {
                                UserRow(user: user)
                            }
                        }
                    }
                    
                }
                .listStyle(.plain)
                .navigationTitle("Github User")
            }
            
        }
    }
    
    func searchMovies(for searchText: String) {
        if !searchText.isEmpty {
            userViewModel.getSearch(text: searchText)
        }
    }
}

struct UserSearchView_Previews: PreviewProvider {
    static var previews: some View {
        UserSearchView()
    }
}
