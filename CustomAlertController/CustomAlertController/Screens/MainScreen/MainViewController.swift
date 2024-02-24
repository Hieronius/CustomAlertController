import UIKit

class MainViewController: GenericViewController<MainView>, MainViewDelegate, CustomAlertControllerDelegate {
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rootView.delegate = self
        rootView.customAlertController.delegate = self
    }
    
    // MARK: - Public Methods
    
    func customDeleteButtonDidTapDeleteButton() {
        print("Delete button pressed from CustomDeleteButton")
    }
    
    func mainViewDidTapAlertButton() {
        rootView.customAlertController.view.isHidden = false
        rootView.alertButton.isHidden = true
        print("Button has been tapped")
        
        // implement smooth animation of customAlert
        // Probably should fix constraints
        // present(CustomAlertController(), animated: true)
    }
    
    func mainViewDidTapTestAlertButton() {
        showAlert(title: "Test Alert", message: "Message")
    }
    
    func customAlertDidTapCancelButton() {
        rootView.alertButton.isHidden = false
        rootView.customAlertController.view.isHidden = true
        print("cancel button has been pressed")
        
        // implement smooth animation of customAlert
        // Probably should fix constraints
        // dismiss(animated: true, completion: nil)
    }
    
    func mainViewDidTapCustomDeleteButton() {
        
        print("delete button from main VC has been pressed")
        rootView.customAlertController.cancelButton.isEnabled = false
        rootView.customAlertController.deleteButton.isEnabled = false
        rootView.customAlertController.deleteButton.setTitleColor(.gray, for: .normal)
        
        
        rootView.customAlertController.deleteButton.activityIndicator.startAnimating()
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) { self.rootView.customAlertController.activityIndicator.stopAnimating()
            self.dismiss(animated: true, completion: nil)
        }
    }
    
}

