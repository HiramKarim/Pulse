//
//  LoginVC.swift
//  PulseApp
//
//  Created by Hiram Castro on 18/01/21.
//

import UIKit

class LoginVC: UIViewController {
    
    //MARK: - PROPERTIES
    
    private let iconImage: UIImageView = {
        let icon = UIImageView()
        icon.image = UIImage(systemName: "bubble.right")
        icon.tintColor = .white
        return icon
    }()
    
    lazy var emailContainerView: InputContainerView = {
        return InputContainerView(image: UIImage(systemName: "envelope")!,
                                  textfield: emailTextField)
    }()
    
    lazy var passwordContainerView: InputContainerView = {
        return InputContainerView(image: UIImage(systemName: "lock")!,
                                  textfield: passwordTextField)
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton(type: UIButton.ButtonType.system)
        button.setTitle("Log In", for: .normal)
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.setTitleColor(.systemBlue, for: .normal)
        button.backgroundColor = .white
        button.setHeight(height: 50)
        button.isEnabled = false
        button.alpha = 0.5
        return button
    }()
    
    private let emailTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Email"
        tf.textColor = .white
        tf.textContentType = .emailAddress
        tf.attributedPlaceholder = NSAttributedString(string:"Email", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        
        return tf
    }()
    
    private let passwordTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Password"
        tf.isSecureTextEntry = true
        tf.textColor = .white
        tf.textContentType = .password
        tf.attributedPlaceholder = NSAttributedString(string:"Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        
        return tf
    }()
    
    private let createAccountLinkButton: UIButton = {
        let button = UIButton(type: UIButton.ButtonType.system)
        
        let attributeTitle = NSMutableAttributedString(string: "Don't have an account?",
                                                       attributes: [.font: UIFont.systemFont(ofSize: 16),
                                                                    .foregroundColor: UIColor.white])
        attributeTitle.append(NSAttributedString(string: " Sign Up",
                                                 attributes: [.font: UIFont.boldSystemFont(ofSize: 16),
                                                              .foregroundColor: UIColor.white]))
        
        button.setAttributedTitle(attributeTitle, for: .normal)
        
        return button
    }()
    
    var loginVM = LoginVM()
    
    //MARK: - LIFE CYCLE
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    //MARK: - HELPERS
    
    @objc func checkFormStatus() {
        if loginVM.formIsValid {
            loginButton.isEnabled = true
            loginButton.alpha = 1
        } else {
            loginButton.isEnabled = false
            loginButton.alpha = 0.5
        }
    }
    
    @objc func textDidChange(sender: UITextField) {
        if sender == emailTextField {
            loginVM.email = sender.text
        } else {
            loginVM.password = sender.text
        }
        checkFormStatus()
    }
    
    func configureUI() {
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.barStyle = .black
        
        configureGradientLayerOnView()
        
        //UI ELEMENTS
        self.view.addSubview(iconImage)
        iconImage.centerX(inView: self.view)
        iconImage.anchor(top: self.view.safeAreaLayoutGuide.topAnchor,
                         paddingTop: 32,
                         width: 120,
                         height: 120)
        
        let stack = UIStackView(arrangedSubviews: [emailContainerView, passwordContainerView, loginButton])
        stack.axis = .vertical
        stack.spacing = 16
        
        self.view.addSubview(stack)
        
        stack.anchor(top: iconImage.bottomAnchor,
                     left: self.view.leadingAnchor,
                     right: self.view.trailingAnchor,
                     paddingTop: 32,
                     paddingLeft: 32,
                     paddingRight: 32)
        
        self.view.addSubview(createAccountLinkButton)
        createAccountLinkButton.centerX(inView: self.view)
        createAccountLinkButton.anchor(bottom: self.view.safeAreaLayoutGuide.bottomAnchor,
                                       paddingBottom: 20)
        createAccountLinkButton.addTarget(self, action: #selector(goToSignupButtonPressed), for: .touchUpInside)
        
        emailTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        loginButton.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        
        self.hideKeyboardWhenTappedAround()
    }
    
    func configureGradientLayerOnView() {
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.systemTeal.cgColor, UIColor.systemBlue.cgColor]
        gradient.locations = [0 , 1]
        view.layer.addSublayer(gradient)
        gradient.frame = self.view.frame
    }
    
    //MARK: - SELECTOR
    @objc func goToSignupButtonPressed() {
        navigationController?.pushViewController(SignupVC(), animated: true)
    }
    
    @objc func handleLogin() {
        
    }
}
