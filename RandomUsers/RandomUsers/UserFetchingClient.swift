//
//  UserFetchingClient.swift
//  RandomUsers
//
//  Created by pitel on 12/17/23.
//

import Foundation

/*/
 Retrieving random user data from api
 */
struct UserFetchingClient {
    //fetch 20 random users instead of 10 for testing
    static private let url = URL(string: "https://randomuser.me/api/?results=20&format=pretty")!
    
    static func getUsers() async throws -> [User] {
        async let (data, _) = URLSession.shared.data(from: url)
        let response = try await JSONDecoder().decode(Response.self, from: data)
        return response.users
    }
}
