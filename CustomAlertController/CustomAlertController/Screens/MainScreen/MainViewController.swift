import UIKit

class MainViewController: GenericViewController<MainView> {
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        rootView.alertButton.addTarget(self, action: #selector(alertButtonTapped), for: .touchUpInside)
    }
    
    @objc func alertButtonTapped() {
        print("Button has been tapped")
    }
    
}

