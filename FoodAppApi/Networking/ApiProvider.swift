import Foundation
import Alamofire

class ApiProvider: ApiProviderProtocol {
    let BASE_URL = "https://api.spoonacular.com"
    let API_KEY = "b1ebb44a352442728ec8ca17a2fb8ab9"
    func getRandomRecipes() -> DataResponsePublisher<RecipeMain> {
        AF.request("\(BASE_URL)/recipes/random?apiKey=\(API_KEY)&number=10", method: .get, encoding:  JSONEncoding.default)
            .validate(statusCode: 200..<300)
            .publishDecodable(type: RecipeMain.self)
    }
}
