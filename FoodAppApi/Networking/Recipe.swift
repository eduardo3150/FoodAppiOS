import Foundation

struct Recipe: Decodable {
    let title: String
    let readyInMinutes: Int
}

struct RecipeMain: Decodable {
    let recipes: [Recipe]
}
