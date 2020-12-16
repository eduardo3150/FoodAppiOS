import Foundation

protocol MainViewModelProtocol {
    func getRecipes() -> String
}

class MainViewModel: MainViewModelProtocol {
    let apiProvider: ApiProviderProtocol
    
    init(apiProvider: ApiProviderProtocol) {
        self.apiProvider = apiProvider
    }
    
    func getRecipes() -> String {
        apiProvider.getRecipes()
    }
}
