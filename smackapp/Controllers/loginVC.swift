//
//  loginVC.swift
//  smackapp
//
//  Created by Nithin Chakravarthy Dampetla on 1/25/18.
//  Copyright © 2018 Nithin Chakravarthy Dampetla. All rights reserved.
//

import UIKit

class loginVC: UIViewController {
    
    @IBOutlet weak var userName: UITextField!
    
    @IBOutlet weak var passWord: UITextField!
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        // Do any additional setup after loading the view.
    }

    @IBAction func closePressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func createAccPressed(_ sender: Any) {
        
        performSegue(withIdentifier: "toCreateAccountVC", sender: nil)
    }
    
    @IBAction func logInPressed(_ sender: Any) {
        spinner.isHidden = false
        spinner.startAnimating()
        view.endEditing(true)
        
        guard let email = userName.text , userName.text != "" else { return }
        guard let pass = passWord.text , passWord.text != "" else { return }
        AuthService.instance.loginUser(email: email, password: pass) { (success) in
            if success {
                AuthService.instance.findUserByEmail(completion: { (success) in
                    NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
                    self.spinner.stopAnimating()
                    self.spinner.isHidden = true
                    self.dismiss(animated: true, completion: nil)
                })
            }
        }
    }
    
    func setUpView(){
        
        spinner.isHidden = true
        userName.attributedPlaceholder = NSAttributedString(string: "email", attributes: [NSAttributedStringKey.foregroundColor : smackPurplePlaceHolder])
        passWord.attributedPlaceholder = NSAttributedString(string: "password", attributes: [NSAttributedStringKey.foregroundColor : smackPurplePlaceHolder])
        
        
    }
    
    
    
}
