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
    static private let url = URL(string: "https://randomuser.me/api/?results=10&format=pretty")!
    
    static func getUsers() async throws -> String {
        async let (data, _) = URLSession.shared.data(from: url)
        return try await String(data: data, encoding: .utf8)!
      }
}
