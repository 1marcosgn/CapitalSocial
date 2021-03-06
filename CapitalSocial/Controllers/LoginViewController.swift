//
//  LoginViewController.swift
//  CapitalSocial
//
//  Created by Marcos Garcia on 12/24/18.
//  Copyright © 2018 Marcos Garcia. All rights reserved.
//

import UIKit
import QRCodeReader
import AVFoundation
import QRCodeReader

class LoginViewController: UIViewController, QRCodeReaderViewControllerDelegate {

    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var registerButton: UIButton!
    
    lazy var readerVC: QRCodeReaderViewController = {
        let builder = QRCodeReaderViewControllerBuilder {
            $0.reader = QRCodeReader(metadataObjectTypes: [.qr], captureDevicePosition: .back)
        }
        
        return QRCodeReaderViewController(builder: builder)
    }()
    
    
    @IBAction func openQRReader(_ sender: Any) {
        if QRCodeReader.isAvailable() {
            displayQRCodeReader()
        } else {
            let dict = ["error":["title":"Error", "message": "QRCodeReader No Soportado"]]
            self.displayErrorAlertWith(dict)
        }

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.activityIndicator.isHidden = true
        //registerButton.layer.borderColor = UIColor.init(red: 255.0/255.0, green: 117.0/255.0, blue: 188.0/255.0, alpha: 1.0).cgColor
        registerButton.layer.borderColor = Colors.pinkLigthColorCdmx.cgColor
    }
    
    @IBAction func performLogIn(_ sender: Any) {
        
        if (self.userTextField.text?.count)! > 0 &&
            (self.passwordTextField.text?.count)! > 0 {
            logIn()
        } else {
            let dict = ["error":["title":"Error", "message": "Ingrese usuario y contraseña"]]
            self.displayErrorAlertWith(dict)
        }
    }
}

extension LoginViewController {
    
    func logIn() {
        activityIndicator.isHidden = false
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

/// Use this extension to handle QR Logic
extension LoginViewController {
    
    func displayQRCodeReader() {
        // Retrieve the QRCode content
        // By using the delegate pattern
        readerVC.delegate = self
        
        // Or by using the closure pattern
        readerVC.completionBlock = { (result: QRCodeReaderResult?) in
            //print(result)
            self.passwordTextField.text = result?.value
            
            if (self.userTextField.text?.count)! > 0 {
                self.logIn()
            }
        }
        
        // Presents the readerVC as modal form sheet
        readerVC.modalPresentationStyle = .formSheet
        present(readerVC, animated: true, completion: nil)
    }
    
    // MARK: - QRCodeReaderViewController Delegate Methods
    func reader(_ reader: QRCodeReaderViewController, didScanResult result: QRCodeReaderResult) {
        reader.stopScanning()
        
        dismiss(animated: true, completion: nil)
    }
    
    func readerDidCancel(_ reader: QRCodeReaderViewController) {
        reader.stopScanning()
        
        dismiss(animated: true, completion: nil)
    }
}
