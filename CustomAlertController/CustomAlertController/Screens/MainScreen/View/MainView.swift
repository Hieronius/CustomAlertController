import UIKit
import SnapKit

protocol MainViewDelegate: AnyObject {
    func mainViewDidTapAlertButton()
    func mainViewDidTapTestAlertButton()
    func mainViewDidTapCustomDeleteButton()
}

final class MainView: UIView {
    
    // MARK: - Public Properties
    
    weak var delegate: MainViewDelegate?
    
    var testAlertButton: UIButton!
    
    var alertButton: UIButton!
    
    var customAlertController: CustomAlertController!
    
    var isCustomAlertVisible = false
    
    // MARK: - Initialization
    
    init() {
        super.init(frame: .zero)
        self.backgroundColor = .white
        getTestAlertButton()
        getAlertButton()
        customAlertController = CustomAlertController(deleteButton: CustomDeleteButton(title: "Удалить", targetObject: self, actionSelector: #selector(customDeleteButtonTapped)))
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
    
    func getTestAlertButton() {
        testAlertButton = UIButton()
        testAlertButton.setTitle("Get Alert", for: .normal)
        testAlertButton.setTitleColor(.white, for: .normal)
        testAlertButton.backgroundColor = .black
        testAlertButton.titleLabel?.font = UIFont.systemFont(ofSize: UIFont.systemFontSize)
        
         self.addSubview(testAlertButton)
        
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
        
        testAlertButton.layer.cornerRadius = buttonHeight / 2
        
        testAlertButton.snp.makeConstraints { make in
            make.width.equalTo(buttonWidth)
            make.height.equalTo(buttonHeight)
            make.centerX.equalTo(screenCenterX)
            make.centerY.equalTo(screenCenterY - 110)
            
        }
        
        testAlertButton.addTarget(self, action: #selector(testAlertButtonTapped), for: .touchUpInside)
    }
    
    func getAlertButton() {
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
    
    @objc func alertButtonTapped() {
        delegate?.mainViewDidTapAlertButton()
    }
    
    @objc func testAlertButtonTapped() {
        delegate?.mainViewDidTapTestAlertButton()
    }
    
    @objc func customDeleteButtonTapped() {
        delegate?.mainViewDidTapCustomDeleteButton()
    }
}
