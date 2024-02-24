import UIKit

class MainViewController: GenericViewController<MainView>, MainViewDelegate, CustomAlertControllerDelegate {
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rootView.delegate = self
    }
    
    // MARK: - Public Methods
    
    func mainViewDidTapAlertButton() {
        rootView.presentCustomAlert()
        rootView.alertButton.isHidden = false
        print("Alert controller has been presented")
        
        rootView.customAlertController.delegate = self
        present(rootView.customAlertController, animated: true)
    }
    
    func mainViewDidTapTestAlertButton() {
        showAlert(title: "Test Alert", message: "Message")
    }
    
    func customAlertDidTapCancelButton() {
        self.rootView.alertButton.isHidden = false
        self.rootView.isCustomAlertVisible = false
        dismiss(animated: true) {
            self.rootView.customAlertController.view.removeFromSuperview()
        }
    }
    
    func mainViewDidTapCustomDeleteButton() {
        rootView.customAlertController.cancelButton.isEnabled = false
        rootView.customAlertController.deleteButton.isEnabled = false
        rootView.customAlertController.deleteButton.setTitleColor(.gray, for: .normal)
        
        
        rootView.customAlertController.deleteButton.activityIndicator.startAnimating()
    }
    
}

