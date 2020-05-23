//
//  LoginViewController.swift
//  MehulJadavPractical
//
//  Created by Mehul Jadav on 22/05/20.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var txtEmail             : SkyFloatingLabelTextField!
    @IBOutlet weak var txtPassword          : SkyFloatingLabelTextField!
    @IBOutlet weak var btlShowPass          : UIButton!
    @IBOutlet weak var btlLogin             : UIButton!
    
    private var viewModel = UserViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        self.setView()
    }

}

//MARK:- Other methods
extension LoginViewController {
    
    func setView() {
        AppUtility.default.applySkyscannerTheme(textField: self.txtEmail)
        AppUtility.default.applySkyscannerTheme(textField: self.txtPassword)
        btlLogin.layer.cornerRadius = 25
        btlLogin.layer.masksToBounds = true
    }
    
    
}

//MARK:- IBAction Methods.
extension LoginViewController {
    
    @IBAction func btnClickOnShowPass(sender: UIButton) {
        self.btlShowPass.isSelected = !(sender.isSelected)
        self.txtPassword.isSecureTextEntry = !self.btlShowPass.isSelected
    }
    
    @IBAction func btnClickOnLogin(sender: UIButton) {
        
//        self.redirectToHome()
//        return
        
        if self.txtEmail.text?.isEmail == false || self.txtEmail.text?.isValid == false {
            //ISMessages.show("Please enter valid email.");
            self.alertMessage(message: "Please enter valid email.")
        }else if self.txtPassword.text?.isValid == false {
            //ISMessages.show("Please enter password.");
            self.alertMessage(message: "Please enter password.")
        }else {
            self.signIn()
        }
        
    }
    
    @IBAction func btnClickOnForgotPass(sender: UIButton) {
    }
    
    func alertMessage(message : String) {
        let alert = UIAlertController(title: "My App", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
}

//MARK:- Service call Methods.
extension LoginViewController {
    func signIn() {
        
        self.viewModel.signIn(email: self.txtEmail.text ?? "", password: self.txtPassword.text ?? "") { (success) in
            if success == true {
                self.redirectToHome()
            }
        }
        
    }
    
    func redirectToHome(){
        
        let objTabbarVC = MainTabVC(nibName: "MainTabVC", bundle: nil)
        objTabbarVC.modalPresentationStyle = .fullScreen
        self.present(objTabbarVC, animated: true, completion: nil)
        
//        let navDashboradVC :UINavigationController  = UINavigationController(rootViewController: objTabbarVC)
//        navDashboradVC.isNavigationBarHidden = true
//        AppUtility.default.navigationController = navDashboradVC
//        appDelegate.window?.rootViewController = navDashboradVC
//        appDelegate.window?.makeKeyAndVisible()
        
    }
}
