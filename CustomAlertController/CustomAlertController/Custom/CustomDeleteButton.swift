import UIKit
import SnapKit

class CustomDeleteButton: UIButton {
    
    // MARK: - Public Properties
    
    lazy var activityIndicator = UIActivityIndicatorView(style: .medium)
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
        customTitleLabel.textColor = .red
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods

    func configureLayout() {
        let spacer = UIView()
        spacer.setContentHuggingPriority(.defaultLow, for: .horizontal)
        spacer.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        
         let stackView = UIStackView(arrangedSubviews: [activityIndicator, spacer, customTitleLabel])
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(stackView)
        
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        // Add a tap gesture recognizer to the deleteButton
        let tapGesture = UITapGestureRecognizer(target: targetObject, action: actionSelector)
        addGestureRecognizer(tapGesture)
        isUserInteractionEnabled = true
        
    }
    
    @objc func deleteButtonTapped() {
            // Handle the delete button tap event
            print("Delete button tapped")
        }
    
}

