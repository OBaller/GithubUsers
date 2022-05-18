//
//  NavView.swift
//  GitUsers
//
//  Created by Naseem Oyebola on 18/05/2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var userViewModel = UserViewModel()

    var body: some View {
        NavigationView {
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
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
