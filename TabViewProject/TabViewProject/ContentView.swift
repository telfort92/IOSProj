//
//  ContentView.swift
//  TabViewProject
//
//  Created by pitel on 12/15/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Text("Wassup bro!")
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            Text("Your profile")
                .tabItem {
                    Label("Profile", systemImage: "person.circle.fill")
                }
        }
        .tabViewStyle(PageTabViewStyle())
    }
}

#Preview {
    ContentView()
}
