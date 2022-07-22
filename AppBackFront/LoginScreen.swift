//
//  LoginScreen.swift
//  AppBackFront
//
//  Created by Leticia Speda on 21/07/22.
//

import UIKit

class LoginScreen: UIView {

    
    //MARK: - Componets
    private lazy var subImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "BGLogin")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    
    private lazy var logoApp: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Logo")
        image.clipsToBounds = true
        image.layer.cornerRadius = 20
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var appLabel: UILabel = {
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
    
    
    private lazy var loginTextField: UITextField = {
        let tf = UITextField()
        tf.attributedPlaceholder = NSAttributedString(string: "Login",attributes:
        [NSAttributedString.Key.foregroundColor:
         UIColor.white.withAlphaComponent(1.0)])
        tf.textColor = UIColor.white
        tf.layer.borderWidth = 1.0
        tf.layer.borderColor = UIColor.white.cgColor
        tf.clipsToBounds = true
        tf.layer.cornerRadius = 12
        tf.borderStyle = .roundedRect
        tf.keyboardType = .emailAddress
        tf.autocorrectionType = .no
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.backgroundColor = UIColor(red: 40/255,
                                     green: 40/255,
                                     blue: 40/255,
                                     alpha: 0.7)
        return tf
    }()
    
    private lazy var passwordTextField: UITextField = {
        let tf = UITextField()
        tf.attributedPlaceholder = NSAttributedString(string: "Password",attributes:
        [NSAttributedString.Key.foregroundColor:
         UIColor.white.withAlphaComponent(1.0)])
        tf.textColor = UIColor.white
        tf.layer.borderWidth = 1.0
        tf.layer.borderColor = UIColor.white.cgColor
        tf.clipsToBounds = true
        tf.layer.cornerRadius = 12
        tf.borderStyle = .roundedRect
        tf.keyboardType = .emailAddress
        tf.autocorrectionType = .no
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.backgroundColor = UIColor(red: 40/255,
                                     green: 40/255,
                                     blue: 40/255,
                                     alpha: 0.7)
        
        return tf
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

    private lazy var sendButton: UIButton = {
        let button = UIButton()
        button.setTitle("Enviar", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.cornerRadius = 10
        button.titleLabel?.textAlignment = .center
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(red: 242.0/255.0, green: 19.0/255.0,
                                         blue: 123.0/255.0, alpha: 0.50)
        button.layer.borderWidth = 1.0
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
        view.layer.borderColor = UIColor(red: 255/255, green: 0/255, blue: 192/255, alpha: 1.0).cgColor
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
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Helpers
    
    private func commonInit() {
        configureHierarchy()
        configureConstrainsts()
    }
    private func configureHierarchy() {
        addSubview(subImageView)
        addSubview(logoApp)
        addSubview(appLabel)
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
            
            logoApp.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor,
                                         constant: 55),
            logoApp.heightAnchor.constraint(equalToConstant: 108),
            logoApp.widthAnchor.constraint(equalToConstant: 108),
            logoApp.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            appLabel.topAnchor.constraint(equalTo: logoApp.bottomAnchor,
                                          constant: 20),
            appLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            descriptionApp.topAnchor.constraint(equalTo: appLabel.bottomAnchor,
                                                constant: 10),
            descriptionApp.leadingAnchor.constraint(equalTo: leadingAnchor,
                                                    constant: 10),
            descriptionApp.trailingAnchor.constraint(equalTo: trailingAnchor,
                                                     constant: -10),
            
            loginTextField.topAnchor.constraint(equalTo: descriptionApp.bottomAnchor,
                                                constant: 32),
            loginTextField.leadingAnchor.constraint(equalTo: leadingAnchor,
                                                    constant: 20),
            loginTextField.trailingAnchor.constraint(equalTo: trailingAnchor,
                                                     constant: -20),
            
            passwordTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor,
                                                constant: 11),
            passwordTextField.leadingAnchor.constraint(equalTo: leadingAnchor,
                                                    constant: 20),
            passwordTextField.trailingAnchor.constraint(equalTo: trailingAnchor,
                                                     constant: -20),
            
            recoverPasswordButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 14),
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
            
            dividendorView.topAnchor.constraint(equalTo: sendButton.bottomAnchor, constant: 48),
            dividendorView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 64),
            dividendorView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -64),
            dividendorView.heightAnchor.constraint(equalToConstant: 1.0),
            
            signInMetamaskView.topAnchor.constraint(equalTo: dividendorView.bottomAnchor, constant: 48),
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

