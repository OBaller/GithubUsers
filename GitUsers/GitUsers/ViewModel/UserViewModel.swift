//
//  UserViewModel.swift
//  GitUsers
//
//  Created by Naseem Oyebola on 18/05/2022.
//

import Foundation
import Combine

class UserViewModel: ObservableObject {
    @Published var users: [User] = []
    @Published var isRequestFailed = false
    private let pageLimit = 10
    private var currentLastId: Int? = nil
    private var cancellable: AnyCancellable?
    
    func getUsers() {
        cancellable = APIService.shared.getUsers(perPage: pageLimit, sinceId: currentLastId)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    self.isRequestFailed = true
                    print(error)
                case .finished:
                    print("finished loading")
                }
            } receiveValue: { users in
                self.users.append(contentsOf: users)
                self.currentLastId = users.last?.id
            }
    }
    
    
    func getSearch(text: String) {
        APIService.shared.search(with: ["q" : text]) { [unowned self] result in
            DispatchQueue.main.async {
                switch result {
                case .failure(let error):
                    print(" This is why \(error)")
                case .success(let users):
                    print("--- sucess with \(users.count)")
                    self.users = users
                }
            }
        }
        
    }
}
