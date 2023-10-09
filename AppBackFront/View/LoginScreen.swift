import UIKit

protocol LoginScreenProtocol: AnyObject {
    func tappedLoginButton()
}

final class LoginScreen: UIView {
    private weak var delegate: LoginScreenProtocol?
    
    //MARK: - Componets
    private lazy var subImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "BGLogin")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var logoApp: UIImageView = {
        let image = UIImage(named: "logo")
        let imageView = UIImageView(image: image)
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 20
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var nameAppLabel: UILabel = {
        let label = UILabel()
        label.text = "BackFront Academy"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 26)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var descriptionApp: UILabel = {
        let label = UILabel()
        label.text = "O marketplace de NFTs da BackFront Academy"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor.white.withAlphaComponent(0.6)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private(set) lazy var loginTextField: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(
            string: "Login",
            attributes:[
                NSAttributedString.Key.foregroundColor: UIColor.white.withAlphaComponent(1.0)
            ]
        )
        textField.textColor = UIColor.white
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.white.cgColor
        textField.clipsToBounds = true
        textField.layer.cornerRadius = 12
        textField.borderStyle = .roundedRect
        textField.keyboardType = .emailAddress
        textField.autocorrectionType = .no
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor(
            red: 40/255,
            green: 40/255,
            blue: 40/255,
            alpha: 0.7
        )
        return textField
    }()
    
    private(set) lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(
            string: "Password",
            attributes: [
                NSAttributedString.Key.foregroundColor:UIColor.white.withAlphaComponent(1.0)
            ])
        textField.textColor = UIColor.white
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.white.cgColor
        textField.clipsToBounds = true
        textField.layer.cornerRadius = 12
        textField.borderStyle = .roundedRect
        textField.keyboardType = .emailAddress
        textField.autocorrectionType = .no
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor(
            red: 40/255,
            green: 40/255,
            blue: 40/255,
            alpha: 0.7
        )
        return textField
    }()
    
    private lazy var recoverPasswordButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Recuperar senha", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.setTitleColor(UIColor.white, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var subLoginview: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "gradient")
        image.clipsToBounds = true
        image.layer.cornerRadius = 10
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private(set) lazy var sendButton: UIButton = {
        let button = UIButton()
        button.setTitle("Logar", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.cornerRadius = 10
        button.titleLabel?.textAlignment = .center
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .gray
        button.layer.borderWidth = 1.0
        button.isEnabled = false
        button.addTarget(self, action: #selector(tappedLoginButton), for: .touchUpInside)
        button.layer.borderColor = UIColor.white.cgColor
        return button
    }()
    
    private lazy var dividendorView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var signInMetamaskView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.layer.cornerRadius = 8
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor(
            red: 255/255,
            green: 0/255,
            blue: 192/255,
            alpha: 1.0
        ).cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var signInMetamaskImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Metamask")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var signInMetamaskLabel: UILabel = {
        let label = UILabel()
        label.text = "Entrar com a Metamask"
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: - Construtor
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
//        backgroundColor = #colorLiteral(red: 0.5710227273, green: 0.06407853923, blue: 0.4594097599, alpha: 0.98)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Helpers
    private func commonInit() {
        actionsButton()
        configureHierarchy()
        configureConstrainsts()
    }
    
    @objc func tappedLoginButton() {
        delegate?.tappedLoginButton()
    }
    
    func delegate(_ delegate: LoginScreenProtocol?) {
        self.delegate = delegate
    }
    
    func configTextFieldDelegate(_ delegate: UITextFieldDelegate) {
        loginTextField.delegate = delegate
        passwordTextField.delegate = delegate
    }
    
    private func actionsButton() {
//        sendButton.addTarget(self, action: #selector(tappedLoginButton), for: .touchUpInside)
    }
    
    private func configureHierarchy() {
        addSubview(subImageView)
        addSubview(logoApp)
        addSubview(nameAppLabel)
        addSubview(descriptionApp)
        addSubview(loginTextField)
        addSubview(passwordTextField)
        addSubview(recoverPasswordButton)
        addSubview(subLoginview)
        addSubview(sendButton)
        addSubview(dividendorView)
        addSubview(signInMetamaskView)
        signInMetamaskView.addSubview(signInMetamaskImageView)
        signInMetamaskView.addSubview(signInMetamaskLabel)
    }
    
    private func configureConstrainsts() {
        NSLayoutConstraint.activate([
            subImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            subImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            subImageView.topAnchor.constraint(equalTo: topAnchor),
            subImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            logoApp.topAnchor.constraint(
                equalTo: safeAreaLayoutGuide.topAnchor,
                constant: 55
            ),
            logoApp.heightAnchor.constraint(equalToConstant: 108),
            logoApp.widthAnchor.constraint(equalToConstant: 108),
            logoApp.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            nameAppLabel.topAnchor.constraint(equalTo: logoApp.bottomAnchor,
                                              constant: 20),
            nameAppLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            descriptionApp.topAnchor.constraint(
                equalTo: nameAppLabel.bottomAnchor,
                constant: 10
            ),
            descriptionApp.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: 10
            ),
            descriptionApp.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: -10
            ),
            
            loginTextField.topAnchor.constraint(
                equalTo: descriptionApp.bottomAnchor,
                constant: 32
            ),
            loginTextField.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: 20
            ),
            loginTextField.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: -20
            ),
            
            passwordTextField.topAnchor.constraint(
                equalTo: loginTextField.bottomAnchor,
                constant: 11
            ),
            passwordTextField.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: 20
            ),
            passwordTextField.trailingAnchor.constraint(equalTo: trailingAnchor,
                                                        constant: -20),
            
            recoverPasswordButton.topAnchor.constraint(
                equalTo: passwordTextField.bottomAnchor,
                constant: 14
            ),
            recoverPasswordButton.trailingAnchor.constraint(equalTo: loginTextField.trailingAnchor),
            recoverPasswordButton.heightAnchor.constraint(equalToConstant: 16),
            
            sendButton.topAnchor.constraint(equalTo: recoverPasswordButton.bottomAnchor, constant: 36),
            sendButton.leadingAnchor.constraint(equalTo: passwordTextField.leadingAnchor),
            sendButton.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor),
            sendButton.heightAnchor.constraint(equalToConstant: 41),
            
            
            subLoginview.leadingAnchor.constraint(equalTo: sendButton.leadingAnchor),
            subLoginview.trailingAnchor.constraint(equalTo: sendButton.trailingAnchor),
            subLoginview.topAnchor.constraint(equalTo: sendButton.topAnchor),
            subLoginview.bottomAnchor.constraint(equalTo: sendButton.bottomAnchor),
            
            dividendorView.topAnchor.constraint(
                equalTo: sendButton.bottomAnchor,
                constant: 48
            ),
            dividendorView.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: 64
            ),
            dividendorView.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: -64
            ),
            dividendorView.heightAnchor.constraint(equalToConstant: 1.0),
            
            signInMetamaskView.topAnchor.constraint(
                equalTo: dividendorView.bottomAnchor,
                constant: 48
            ),
            signInMetamaskView.leadingAnchor.constraint(equalTo: sendButton.leadingAnchor),
            signInMetamaskView.trailingAnchor.constraint(equalTo: sendButton.trailingAnchor),
            signInMetamaskView.heightAnchor.constraint(equalToConstant: 41),
            
            signInMetamaskImageView.leadingAnchor.constraint(equalTo: signInMetamaskView.leadingAnchor, constant: 53),
            signInMetamaskImageView.centerYAnchor.constraint(equalTo: signInMetamaskView.centerYAnchor),
            signInMetamaskImageView.heightAnchor.constraint(equalToConstant: 20),
            signInMetamaskImageView.widthAnchor.constraint(equalToConstant: 20),
            
            signInMetamaskLabel.leadingAnchor.constraint(equalTo: signInMetamaskImageView.trailingAnchor, constant: 18),
            signInMetamaskLabel.centerYAnchor.constraint(equalTo: signInMetamaskView.centerYAnchor)
        ])
    }
}

extension HomeViewController: HomeScreenProtocol {
    func tappedOneButton() {
        NotificationCenter.default.post(name: Notification.Name("One"), object: UIColor.orange)
        dismiss(animated: true)
    }
    
    func tappedTwoButton() {
        NotificationCenter.default.post(name: Notification.Name("Two"), object: UIColor.yellow)
        dismiss(animated: true)
    }
}
