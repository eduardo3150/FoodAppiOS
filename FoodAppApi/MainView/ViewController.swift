import UIKit

class ViewController: UIViewController {
    var viewModel: MainViewModelProtocol?

    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = viewModel?.getRecipes()
    }
}

