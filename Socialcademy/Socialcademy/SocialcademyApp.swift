//
//  SocialcademyApp.swift
//  Socialcademy
//
//  Created by pitel on 12/21/23.
//

import SwiftUI
import Firebase

@main
struct SocialcademyApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            AuthView()
        }
    }
}
