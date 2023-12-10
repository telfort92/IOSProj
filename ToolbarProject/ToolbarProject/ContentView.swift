//
//  ContentView.swift
//  ToolbarProject
//
//  Created by pitel on 12/5/23.
//

import SwiftUI

struct ContentView: View {
    @State var isPresenting: Bool = false
    
    var body: some View {
        NavigationView {
            Text("Initial View")
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(action: {
                            isPresenting = true
                        }, label: {
                                Image(systemName: "gear")
                            })
                    }
                }
                .sheet(isPresented: $isPresenting) {
                    NavigationView {
                        Text("Settings Page")
                        .toolbar {
                            ToolbarItem {
                                Button("Save") {
                                    
                                }
                            }
                        }
                    }
                }
        }
    }
}

#Preview {
    ContentView()
}
