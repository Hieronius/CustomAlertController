import UIKit
import SnapKit

class CustomDeleteButton: UIButton {
    private lazy var activityIndicator = UIActivityIndicatorView(style: .medium)

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureLayout() {
        let spacer = UIView()
        spacer.setContentHuggingPriority(.defaultLow, for: .horizontal)
        spacer.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        
        let stackView = UIStackView(arrangedSubviews: [activityIndicator, spacer, titleLabel!])
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stackView)
        
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    // @objc private func deleteButtonTapped() {
        // Rest of the method remains unchanged

//        deleteButton.activityIndicator.startAnimating()
//        UIView.animate(withDuration: 0.2) {
//            self.deleteButton.layoutIfNeeded()
//        }
//    }
}

