import UIKit
import SnapKit

protocol CustomAlertControllerDelegate: AnyObject {
    func customAlertDidTapCancelButton()
}

final class CustomAlertController: UIViewController {
    
    // MARK: - Public Properties
    
    weak var delegate: CustomAlertControllerDelegate?
    
    let titleLabel = UILabel()
    let messageLabel = UILabel()
    let cancelButton = UIButton()
    let verticalSeparatorLine = UIView()
    let horizontalSeparatorLine = UIView()
    let activityIndicator = UIActivityIndicatorView(style: .medium)
    var deleteButton: CustomDeleteButton!
    
    // MARK: - Initializers
    
    init(deleteButton: CustomDeleteButton) {
        super.init(nibName: nil, bundle: nil)
        self.deleteButton = deleteButton
        modalPresentationStyle = .overCurrentContext
        modalTransitionStyle = .crossDissolve
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        
    }
    
    // MARK: - Public Methods
    
    func setupViews() {
        setupAlertController()
        setupTitleLable()
        setupMessageLabel()
        setupHorizontalSeparatorLine()
        setupCancelButton()
        setupVerticalSeparatorLine()
        setupDeleteButton()
    }
    
    func setupAlertController() {
        let screenWidth = UIScreen.main.bounds.width
        let alertWidth = screenWidth - 40
        let alertHeight = 200
        
        view.frame = CGRect(x: 20, y: (Int(UIScreen.main.bounds.height) - alertHeight) / 2, width: Int(alertWidth), height: alertHeight)
        
        view.backgroundColor = UIColor.white.withAlphaComponent(0.8)
        view.layer.cornerRadius = 13
        view.layer.masksToBounds = true
    }
    
    func setupTitleLable() {
        titleLabel.text = "Удалить папку \"Непрочитанные\"?"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 17)
        titleLabel.textColor = .black
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 1
        
        view.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.centerX.equalToSuperview()
        }
    }
    
    func setupMessageLabel() {
        messageLabel.text = "Это не затронет чаты, которые в ней находятся"
        messageLabel.font = UIFont.systemFont(ofSize: 14)
        messageLabel.textColor = .gray
        messageLabel.textAlignment = .center
        messageLabel.numberOfLines = 2
        
        view.addSubview(messageLabel)
        
        messageLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
    }
    
    func setupHorizontalSeparatorLine() {
        horizontalSeparatorLine.backgroundColor = UIColor.lightGray.withAlphaComponent(0.5)
        
        view.addSubview(horizontalSeparatorLine)
        
        horizontalSeparatorLine.snp.makeConstraints { make in
            make.top.equalTo(messageLabel.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(1)
        }
    }
    
    func setupCancelButton() {
        let attributedString = NSAttributedString(string: "Отменить", attributes: [
            NSAttributedString.Key.foregroundColor: UIColor.black,
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 17)
        ])
        cancelButton.setAttributedTitle(attributedString, for: .normal)
        
        view.addSubview(cancelButton)
        
        cancelButton.snp.makeConstraints { make in
            make.top.equalTo(messageLabel.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().offset(-10)
            make.width.equalTo(130)
            make.height.equalTo(30)
        }
        
        cancelButton.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
    }
    
    func setupVerticalSeparatorLine() {
        verticalSeparatorLine.backgroundColor = UIColor.lightGray.withAlphaComponent(0.5)
        
        view.addSubview(verticalSeparatorLine)
        
        verticalSeparatorLine.snp.makeConstraints { make in
            make.top.equalTo(cancelButton.snp.top).offset(-10)
            make.bottom.equalTo(cancelButton.snp.bottom).offset(10)
            make.leading.equalTo(cancelButton.snp.trailing)
            make.width.equalTo(1)
        }
        
    }
    
    func setupDeleteButton() {
        deleteButton.titleLabel?.text = "Удалить"
        view.addSubview(deleteButton)
        
        deleteButton.snp.makeConstraints { make in
            
            make.top.equalTo(cancelButton.snp.top)
            make.trailing.equalToSuperview().offset(-20)
            make.leading.equalTo(verticalSeparatorLine).offset(20)
            make.bottom.equalToSuperview().offset(-10)
            make.width.equalTo(130)
            make.height.equalTo(30)
        }
        
        deleteButton.customTitleLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-20)
        }
        
        deleteButton.activityIndicator.snp.makeConstraints { make in
            make.trailing.equalTo(deleteButton.customTitleLabel.snp.leading).offset(-10)
        }

    }
    
    // MARK: - Actions
    
    @objc func cancelButtonTapped() {
        delegate?.customAlertDidTapCancelButton()
    }
    
}

