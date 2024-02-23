import UIKit
import SnapKit

final class MainView: UIView {
    
    // MARK: - Private properties
    
    private var alertButton: UIButton!
    private weak var customAlertController: CustomAlertController!
    
    // MARK: - Initialization
    
    init() {
        super.init(frame: .zero)
        self.backgroundColor = .white
        getAlertButton()
        // setupCustomAlertController()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func getAlertButton() {
        let alertButton = UIButton()
        alertButton.setTitle("Get Alert Controller", for: .normal)
        alertButton.setTitleColor(.white, for: .normal)
        alertButton.backgroundColor = .black
        alertButton.titleLabel?.font = UIFont.systemFont(ofSize: UIFont.systemFontSize)
        
        self.addSubview(alertButton)
        
        // get size of the screen dynamically
        guard let window = UIApplication.shared.windows.first else {
            fatalError("No window found")
        }
        
        let screenWidth = window.bounds.width
        let screenHeight = window.bounds.height
        
        let buttonWidth = screenWidth / 2
        let buttonHeight = screenHeight / 10
        
        let screenCenterX = window.bounds.midX
        let screenCenterY = window.bounds.midY
        
        alertButton.layer.cornerRadius = buttonHeight / 2
        
        alertButton.snp.makeConstraints { make in
            make.width.equalTo(buttonWidth)
            make.height.equalTo(buttonHeight)
            make.centerX.equalTo(screenCenterX)
            make.centerY.equalTo(screenCenterY)
            
        }
    }
    
    private func setupCustomAlertController() {
        
    }
}
