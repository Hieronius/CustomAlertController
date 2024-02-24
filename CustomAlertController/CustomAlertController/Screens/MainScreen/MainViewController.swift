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
        rootView.alertButton.isHidden = true
        rootView.backgroundColor = UIColor.white.withAlphaComponent(0.8)
        print("Alert controller has been presented")
        
        rootView.customAlertController.delegate = self
        present(rootView.customAlertController, animated: true)
    }
    
    func customAlertDidTapCancelButton() {
        rootView.alertButton.isHidden = false
        rootView.isCustomAlertVisible = false
        rootView.backgroundColor = .white
        dismiss(animated: true) {
            self.rootView.customAlertController.view.removeFromSuperview()
        }
    }
    
    func mainViewDidTapCustomDeleteButton() {
        
        let attributedString = NSAttributedString(string: "Отменить", attributes: [
            NSAttributedString.Key.foregroundColor: UIColor.gray,
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 17)
        ])
        
        rootView.customAlertController.cancelButton.setAttributedTitle(attributedString, for: .disabled)
        rootView.customAlertController.deleteButton.customTitleLabel.textColor = .gray
        
        rootView.customAlertController.cancelButton.isEnabled = false
        rootView.customAlertController.deleteButton.isEnabled = false
        
        rootView.customAlertController.deleteButton.activityIndicator.startAnimating()
    }
    
}

