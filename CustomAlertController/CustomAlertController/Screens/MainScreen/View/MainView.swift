import UIKit

final class MenuView: UIView {
    
    // MARK - Private Properties
    
    private weak var alertButton: UIButton?
    // private weak var customAlertController:
    
    init() {
        super.init(frame: .zero)
        // setupAlertButton()
        // setupCustomAlertController()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
