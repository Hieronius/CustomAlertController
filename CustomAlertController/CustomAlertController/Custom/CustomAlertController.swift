import UIKit
import SnapKit

final class CustomAlertController: UIViewController {
    
    // MARK: - Private Properties
    
    private let titleLabel = UILabel()
    private let messageLabel = UILabel()
    private let cancelButton = UIButton()
    private let deleteButton = CustomDeleteButton(type: .system)
    private let activityIndicator = UIActivityIndicatorView(style: .medium)
    
    // MARK: - Initializers
    
    init() {
        super.init(nibName: nil, bundle: nil)
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
    
    private func setupViews() {
        view.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        setupTitleLable()
        setupMessageLabel()
        setupCancelButton()
        setupDeleteButton()
        setupActivityIndicator()
    }
    
    
    private func setupTitleLable() {
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
    
    private func setupMessageLabel() {
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
    
    private func setupCancelButton() {
        cancelButton.setTitle("Отменить", for: .normal)
        cancelButton.setTitleColor(.darkGray, for: .normal)
        
        cancelButton.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
        
        view.addSubview(cancelButton)
        
        cancelButton.snp.makeConstraints { make in
            make.top.equalTo(messageLabel.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.bottom.equalToSuperview().offset(-20)
            make.width.equalTo(100)
            make.height.equalTo(40)
        }
    }
    
    private func setupDeleteButton() {
        deleteButton.setTitle("Удалить", for: .normal)
        deleteButton.setTitleColor(.red, for: .normal)
        
        deleteButton.addTarget(self, action: #selector(deleteButtonTapped), for: .touchUpInside)
        
        view.addSubview(deleteButton)
        
        deleteButton.snp.makeConstraints { make in
            make.top.equalTo(messageLabel.snp.bottom).offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.bottom.equalToSuperview().offset(-20)
            make.width.equalTo(100)
            make.height.equalTo(40)
        }
    }
    
    private func setupActivityIndicator() {
        activityIndicator.hidesWhenStopped = true
        activityIndicator.color = .gray
        deleteButton.addSubview(activityIndicator)
        
        activityIndicator.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(10)
        }
    }
    
    @objc private func cancelButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc private func deleteButtonTapped() {
        cancelButton.isEnabled = false
        deleteButton.isEnabled = false
        deleteButton.setTitleColor(.gray, for: .normal)
        
        activityIndicator.startAnimating()
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) { self.activityIndicator.stopAnimating()
            self.dismiss(animated: true, completion: nil)
        }
    }
}
