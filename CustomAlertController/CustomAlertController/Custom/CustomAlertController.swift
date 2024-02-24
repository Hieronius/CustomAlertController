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
        setupViews()
    }
    
    // MARK: - Public Methods
    
    func setupViews() {
        view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
         setupTitleLable()
        setupMessageLabel()
        setupCancelButton()
         setupDeleteButton()
          setupActivityIndicator()
    }
    
    func setupTitleLable() {
        titleLabel.text = "Удалить папку \"Непрочитанные\"?"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 17)
        titleLabel.textColor = .black
        titleLabel.textAlignment = .center
        
        view.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.centerX.equalToSuperview()
        }
    }
    
    func setupMessageLabel() {
        messageLabel.text = "Это не затронет чаты, которые в ней находятся"
        messageLabel.font = UIFont.systemFont(ofSize: 14)
        messageLabel.textColor = .black
        messageLabel.textAlignment = .center
        messageLabel.numberOfLines = 0
        
        view.addSubview(messageLabel)
        
        messageLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
    }
    
    func setupCancelButton() {
        cancelButton.setTitle("Отменить", for: .normal)
        cancelButton.setTitleColor(.darkGray, for: .normal)
        
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
    
    func setupDeleteButton() {
        deleteButton.titleLabel?.text = "Удалить"
        deleteButton.setTitleColor(.red, for: .normal)
        view.addSubview(deleteButton)
        
        deleteButton.snp.makeConstraints { make in
            make.top.equalTo(messageLabel.snp.bottom).offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.bottom.equalToSuperview().offset(-20)
            make.width.equalTo(100)
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
    
    // MARK: Actions
    
    @objc func cancelButtonTapped() {
        delegate?.customAlertDidTapCancelButton()
    }
    
}

