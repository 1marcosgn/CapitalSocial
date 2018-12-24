//
//  LoginViewController.swift
//  CapitalSocial
//
//  Created by Marcos Garcia on 12/24/18.
//  Copyright © 2018 Marcos Garcia. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func performLogIn(_ sender: Any) {
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        
        let model = LogInViewModel.init()
        model.requestAccessWith(user: userTextField.text!, password: passwordTextField.text!) { (response) in
            
            if let responseObject = response {
                if responseObject["token"] is NSNull {
                    DispatchQueue.main.async { [unowned self] in
                        self.activityIndicator.stopAnimating()
                        self.displayErrorAlertWith(responseObject)
                    }
                } else {
                    DispatchQueue.main.async { [unowned self] in
                        self.activityIndicator.stopAnimating()
                        model.updateUserWith(responseObject)
                        self.dismissLogInViewController()
                    }
                }
            }
        }
    }
}


extension LoginViewController {
    
    func dismissLogInViewController() {
        dismiss(animated: true, completion: nil)
    }
    
    func displayErrorAlertWith(_ info:[String: Any]) {
        
        let errorDictionary = info["error"] as? [String: String]
        
        let alert = UIAlertController(title: errorDictionary?["title"],
                                      message: errorDictionary?["message"],
                                      preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            switch action.style{
            case .default:
                print("default")
                
            case .cancel:
                print("cancel")
                
            case .destructive:
                print("destructive")
            }}))
        self.present(alert, animated: true, completion: nil)
    }
}

