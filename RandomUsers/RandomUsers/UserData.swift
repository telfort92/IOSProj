//
//  UserData.swift
//  RandomUsers
//
//  Created by pitel on 12/17/23.
//

import Foundation

@MainActor
class UserData: ObservableObject {
    @Published var users: String = ""
    
    init() {
        Task {
            await loadUsers()
        }
    }
    
    func loadUsers() async {
        do {
            let users = try await UserFetchingClient.getUsers()
            self.users = users
        }
        catch {
            print(error)
        }
    }
}
