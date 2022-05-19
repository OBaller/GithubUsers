//
//  NavView.swift
//  GitUsers
//
//  Created by Naseem Oyebola on 18/05/2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var userViewModel = UserViewModel()
    @State private var searchText: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $searchText, onTextChanged: searchMovies)
                if searchText == "" {
                    List {
                        Section() {
                            ForEach(userViewModel.users) { user in
                                NavigationLink(destination: DetailsView(user: user)) {
                                    UserRow(user: user)
                                }
                            }
                            
                            Section() {
                                LoaderView(isFailed: userViewModel.isRequestFailed)
                                    .onAppear(perform: fetchData)
                                    .onTapGesture(perform: onTapLoadView)
                            }
                        }
                    }
                } else {
                    List {
                        ForEach(userViewModel.users.filter {
                            self.searchText.isEmpty ? true : $0.name.lowercased().contains(self.searchText.lowercased())
                        }) { user in
                            NavigationLink(destination: DetailsView(user: user)) {
                                UserRow(user: user)
                            }
                        }
                    }
                    
                }
                
            }
            .listStyle(.plain)
            .navigationTitle("Github Users")
        }
    }
    
    private func fetchData() {
        userViewModel.getUsers()
    }
    
    private func onTapLoadView() {
        if userViewModel.isRequestFailed {
            userViewModel.isRequestFailed = false
            fetchData()
        }
    }
    
    func searchMovies(for searchText: String) {
        if !searchText.isEmpty {
            userViewModel.getSearch(text: searchText)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
