import UIKit
import SnapKit

class CustomDeleteButton: UIButton {
    
    // MARK: - Public Properties
    
    var activityIndicator = UIActivityIndicatorView(style: .medium)
    
    let customTitleLabel = UILabel()
    var targetObject: Any?
    var actionSelector: Selector?
    
    // MARK: - Initialization
    
    init(title: String, targetObject: Any?, actionSelector: Selector) {
        super.init(frame: .zero)
        self.targetObject = targetObject
        self.actionSelector = actionSelector
        configureLayout()
        customTitleLabel.text = title
        customTitleLabel.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        customTitleLabel.textColor = .red
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Methods
    
    func configureLayout() {
    
        let stackView = UIStackView(arrangedSubviews: [activityIndicator, customTitleLabel])
           stackView.axis = .horizontal
            stackView.spacing = 20
        addSubview(stackView)
        
        stackView.snp.makeConstraints { make in
        make.center.equalToSuperview() // Center the stack view within the button
            
        make.leading.equalTo(customTitleLabel.snp.leading) // Align the leading edge of the stack view with the custom title label
    }
        
         // activityIndicator.startAnimating()
        
        
        
        // Add a tap gesture recognizer to the deleteButton
        let tapGesture = UITapGestureRecognizer(target: targetObject, action: actionSelector)
        addGestureRecognizer(tapGesture)
        isUserInteractionEnabled = true
        
    }
}

