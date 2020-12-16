import Foundation
import Swinject
import SwinjectStoryboard
import SwinjectAutoregistration

extension SwinjectStoryboard {
    @objc class func setup() {
        defaultContainer.storyboardInitCompleted(ViewController.self) { r, c in
            c.viewModel = r.resolve(MainViewModelProtocol.self)
        }
        defaultContainer.autoregister(MainViewModelProtocol.self, initializer: MainViewModel.init)
        
        defaultContainer.autoregister(ApiProviderProtocol.self, initializer: ApiProvider.init)
    }
}
