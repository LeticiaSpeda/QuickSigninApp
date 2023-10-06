import UIKit

final class LoginViewController: UIViewController {
    var loginScreen: LoginScreen?
    
    override func loadView() {
        self.loginScreen = LoginScreen()
        view = loginScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginScreen?.delegate(self)
        loginScreen?.configTextFieldDelegate(self)
    }
}

extension LoginViewController: LoginScreenProtocol {
    func tappedLoginButton() {
        let controller = HomeViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        //
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        let email = loginScreen?.loginTextField.text ?? ""
        let password = loginScreen?.passwordTextField.text ?? ""
        
        if email.isEmpty && password.isEmpty {
            loginScreen?.sendButton.isEnabled = false
            loginScreen?.sendButton.backgroundColor = .gray
        } else {
            loginScreen?.sendButton.isEnabled = true
            loginScreen?.sendButton.backgroundColor = UIColor(red: 242.0/255.0, green: 19.0/255.0, blue: 123.0/255.0, alpha: 0.50)
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(#function)
        textField.resignFirstResponder()
        return false
    }
    
}
