import UIKit
import SnapKit

protocol MainViewDelegate: AnyObject {
    func mainViewDidTapAlertButton()
    func mainViewDidTapCustomDeleteButton()
}

final class MainView: UIView {
    
    // MARK: - Public Properties
    
    weak var delegate: MainViewDelegate?
    
    var alertButton: UIButton!
    
    var customAlertController: CustomAlertController!
    
    var isCustomAlertVisible = false
    
    // MARK: - Initializers
    
    init() {
        super.init(frame: .zero)
        self.backgroundColor = .white
        getAlertButton()
        customAlertController = CustomAlertController(deleteButton: CustomDeleteButton(title: "    Удалить", targetObject: self, actionSelector: #selector(customDeleteButtonTapped)))
        presentCustomAlert()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Methods
    
    func presentCustomAlert() {
        guard let customAlertController = customAlertController else {
            print("Custom alert controller is not initialized")
            return
        }
        
        if !isCustomAlertVisible {
            guard let window = UIApplication.shared.windows.first else {
                print("No window found")
                return
            }
            
            window.addSubview(customAlertController.view)
            
            customAlertController.view.snp.makeConstraints { make in
                make.center.equalToSuperview()
                make.width.equalToSuperview().multipliedBy(0.8)
            }
            isCustomAlertVisible = true
        }
    }
    
    // MARK: - Private Methods
    
    private func getAlertButton() {
        alertButton = UIButton()
        alertButton.setTitle("Get Alert Controller", for: .normal)
        alertButton.setTitleColor(.white, for: .normal)
        alertButton.backgroundColor = .black
        alertButton.titleLabel?.font = UIFont.systemFont(ofSize: UIFont.systemFontSize)
        
        self.addSubview(alertButton)
        
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
        
        alertButton.addTarget(self, action: #selector(alertButtonTapped), for: .touchUpInside)
    }
    
    // MARK: - Actions
    
    @objc private func alertButtonTapped() {
        delegate?.mainViewDidTapAlertButton()
    }
    
    @objc private func customDeleteButtonTapped() {
        delegate?.mainViewDidTapCustomDeleteButton()
    }
}
