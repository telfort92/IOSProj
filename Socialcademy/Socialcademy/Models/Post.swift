//
//  Post.swift
//  Socialcademy
//
//  Created by pitel on 12/21/23.
//

import Foundation

struct Post: Identifiable, Equatable {
    var title: String
    var content: String
    var author: User
    var isFavorite = false
    var timestamp = Date()
    var id = UUID()
    
    func contains(_ string: String) -> Bool {
        let properties = [title, content, author.name].map { $0.lowercased() }
        let query = string.lowercased()
        
        let matches = properties.filter { $0.contains(query) }
        return !matches.isEmpty
    }
}

extension Post: Codable {
    enum CodingKeys: CodingKey {
        case title, content, author, timestamp, id
    }
}

extension Post {
    static let testPost = Post(
        title: "Lorem ipsum",
        content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
        author: User.testUser
    )
}
