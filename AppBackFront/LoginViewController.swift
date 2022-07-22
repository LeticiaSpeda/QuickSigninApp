//
//  LoginViewController.swift
//  AppBackFront
//
//  Created by Leticia Speda on 21/07/22.
//

import UIKit

final class LoginViewController: UIViewController {
    
    var screen: LoginScreen?
    
    
    override func loadView() {
        self.screen = LoginScreen()
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
    }
    
    
    
}
