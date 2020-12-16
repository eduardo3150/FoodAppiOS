import Foundation
import Alamofire

protocol ApiProviderProtocol {
    func getRandomRecipes() -> DataResponsePublisher<RecipeMain>
}
