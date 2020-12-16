import Foundation
import Combine

protocol MainViewModelProtocol {
    func getRandomListRecipes()
    var recipesPublished: Published<RecipeMain>.Publisher { get }
}

class MainViewModel: MainViewModelProtocol {
    private let apiProvider: ApiProviderProtocol
    
    @Published private var recipes: RecipeMain = RecipeMain(recipes: [])
    
    var recipesPublished: Published<RecipeMain>.Publisher { $recipes }
    
    private var cancellables: Set<AnyCancellable> = []

    init(apiProvider: ApiProviderProtocol) {
        self.apiProvider = apiProvider
    }
    
    func getRandomListRecipes() {
         apiProvider
            .getRandomRecipes()
            .result()
            .sink { [weak self] response in
                switch response {
                case .success(let value):
                    self?.recipes = value
                case .failure(let error):
                    print(error)
                }
            }.store(in: &cancellables)
    }
}
