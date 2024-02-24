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
    var deleteButton: CustomDeleteButton!
    
    let activityIndicator = UIActivityIndicatorView(style: .medium)
    
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
        
        setupAlertControllerSize()
        setupViews()
        
    }
    
    // MARK: - Public Methods
    
    func setupViews() {
        setupAlertControllerAppearance()
        setupTitleLable()
        setupMessageLabel()
        setupHorizontalSeparatorLine()
        setupCancelButton()
        setupVerticalSeparatorLine()
        setupDeleteButton()
        setupActivityIndicator()
    }
    
    // Remove code from initialization and call this func instead
    func setupAlertControllerSize() {
        let screenWidth = UIScreen.main.bounds.width
        let alertWidth = screenWidth - 40
        let alertHeight = 200
        
        view.frame = CGRect(x: 20, y: (Int(UIScreen.main.bounds.height) - alertHeight) / 2, width: Int(alertWidth), height: alertHeight)
    }
    
    // Remove code from initialization and call this func instead
    func setupAlertControllerAppearance() {
        view.backgroundColor = .white
        view.layer.cornerRadius = 13
        view.layer.masksToBounds = true
    }
    
    func setupTitleLable() {
        titleLabel.text = "Удалить папку \"Непрочитанные\"?"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 17)
        titleLabel.textColor = .black
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 2
        
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
        let separatorLine = UIView()
        separatorLine.backgroundColor = .lightGray
        
        view.addSubview(separatorLine)
        
        separatorLine.snp.makeConstraints { make in
            make.top.equalTo(messageLabel.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(1)
        }
    }
    
    func setupCancelButton() {
        let attributedString = NSAttributedString(string: "Отменить", attributes: [
            NSAttributedString.Key.foregroundColor: UIColor.black,
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 17) // Change the font size as needed
        ])
        cancelButton.setAttributedTitle(attributedString, for: .normal)
        
        view.addSubview(cancelButton)
        
        cancelButton.snp.makeConstraints { make in
            make.top.equalTo(messageLabel.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.bottom.equalToSuperview().offset(-20)
            make.width.equalTo(100)
            make.height.equalTo(40)
        }
        
        cancelButton.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
    }
    
    func setupVerticalSeparatorLine() {
        let separatorLine = UIView()
        separatorLine.backgroundColor = .lightGray
        
        view.addSubview(separatorLine)
        
        separatorLine.snp.makeConstraints { make in
            make.top.equalTo(cancelButton.snp.top)
            make.bottom.equalTo(cancelButton.snp.bottom)
            make.leading.equalTo(cancelButton.snp.trailing)
            make.width.equalTo(1)
        }
    }
    
    func setupDeleteButton() {
        deleteButton.titleLabel?.text = "Удалить"
        deleteButton.setTitleColor(.red, for: .normal)
        view.addSubview(deleteButton)
        
        deleteButton.snp.makeConstraints { make in
            make.top.equalTo(messageLabel.snp.bottom).offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.bottom.equalToSuperview().offset(-20)
            make.width.equalTo(150)
            make.height.equalTo(40)
        }
    }
    
    func setupActivityIndicator() {
        activityIndicator.hidesWhenStopped = true
        activityIndicator.color = .gray
        
        deleteButton.addSubview(activityIndicator)
        
        activityIndicator.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
        }
    }
    
    // MARK: - Actions
    
    @objc func cancelButtonTapped() {
        delegate?.customAlertDidTapCancelButton()
    }
    
}

