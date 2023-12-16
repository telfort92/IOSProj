//
//  MainTabView.swift
//  cookcademy
//
//  Created by pitel on 12/15/23.
//

import SwiftUI

struct MainTabView: View {
  @StateObject var recipeData = RecipeData()
  
  var body: some View {
      /*
       Use tab view to create icons for users click on
       to navigate views. See example below
       */
    TabView {
      RecipeCategoryGridView()
        .tabItem { Label("Recipes", systemImage: "list.dash") }
        /*
         Use NavigationView to navigate views. See example below
         */
      NavigationView {
        RecipesListView(viewStyle: .favorites)
      }.tabItem { Label("Favorites", systemImage: "heart.fill") }
    }
    .environmentObject(recipeData)
  }
}

struct MainTabView_Previews: PreviewProvider {
  static var previews: some View {
    MainTabView()
  }
}
