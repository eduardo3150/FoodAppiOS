import UIKit
import Combine

class ViewController: UIViewController {
    var viewModel: MainViewModelProtocol?

    @IBOutlet weak var titleLabel: UILabel!
    
    var cancellables: Set<AnyCancellable> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.getRandomListRecipes()
        viewModel?
            .recipesPublished
            .sink(receiveValue: { [weak self] response in
            self?.titleLabel.text = response.recipes.first?.title
            }).store(in: &cancellables)
        
    }
}

