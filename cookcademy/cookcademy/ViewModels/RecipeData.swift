//
//  RecipeData.swift
//  cookcademy
//
//  Created by pitel on 11/12/23.
//

import Foundation

class RecipeData: ObservableObject {
    @Published var recipes = Recipe.testRecipes
    
    /*
     Variable below to filter favorite recipe
     */
    var favoriteRecipes: [Recipe] {
        recipes.filter { $0.isFavorite }
      }
    
    /*
     This function to save data to system directory
     */
    
    func saveRecipes() {
        do {
          let encodedData = try JSONEncoder().encode(recipes)
          try encodedData.write(to: recipesFileURL)
        }
        catch {
          fatalError("An error occurred while saving recipes: \(error)")
        }
      }
    
    /*
     Function to load data from system files.
     */
    
    func loadRecipes() {
        guard let data = try? Data(contentsOf: recipesFileURL) else { return }
        do {
          let savedRecipes = try JSONDecoder().decode([Recipe].self, from: data)
          recipes = savedRecipes
        }
        catch {
          fatalError("An error occurred while loading recipes: \(error)")
        }
      }
    
    /*
     The variable below crate a URL/ Path to save data to IOS device.
     */
    
    private var recipesFileURL: URL {
        do {
            let documentsDirectory = try FileManager.default.url(for:
                    .documentDirectory, in: .userDomainMask, appropriateFor: nil,
            create: true)
            return documentsDirectory.appendingPathComponent("recipeData")
        }
        catch {
            fatalError("An error occurred while getting the url: \(error)")
        }
    }
    
    func recipes(for category: MainInformation.Category) -> [Recipe] {
        var filteredRecipes = [Recipe]()
        for recipe in recipes {
            if recipe.mainInformation.category == category {
                filteredRecipes.append(recipe)
            }
        }
        return filteredRecipes
    }
    
    func add(recipe: Recipe) {
        if recipe.isValid {
            recipes.append(recipe)
            saveRecipes()
        }
      }
    
    func index(of recipe: Recipe) -> Int? {
        for i in recipes.indices {
            if recipes[i].id == recipe.id {
                return i
            }
        }
      return nil
    }
}
