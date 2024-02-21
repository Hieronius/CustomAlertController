import UIKit
import SnapKit

final class MenuView: UIView {
    
    // MARK: - Private Properties
    
    private weak var alertButton: UIButton?
    // private weak var customAlertController:
    
    // MARK: - Initialization
    
    init() {
        super.init(frame: .zero)
        print("View is on the screen")
        alertButton = getAlertButton()
        // setupCustomAlertController()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    
    private func getAlertButton() -> UIButton {
        let button = UIButton()
        button.setTitle("Get Alert Controller", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        button.titleLabel?.font = UIFont.systemFont(ofSize: UIFont.systemFontSize)
        
        // get size of the screen dynamically
        guard let window = UIApplication.shared.windows.first else {
            fatalError("No window found")
        }
        
        let screenWidth = window.bounds.width
        let screenHeight = window.bounds.height
        
        let buttonWidth = screenWidth / 5
        let buttonHeight = screenHeight / 5
        
        button.snp.makeConstraints { make in
            make.width.equalTo(buttonWidth)
            make.height.equalTo(buttonHeight)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        print("correct button")
        return button
    }
    
    private func setupCustomAlertController() {
        
    }
}
