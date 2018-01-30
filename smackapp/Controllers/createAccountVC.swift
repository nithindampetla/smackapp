//
//  createAccountVC.swift
//  smackapp
//
//  Created by Nithin Chakravarthy Dampetla on 1/25/18.
//  Copyright © 2018 Nithin Chakravarthy Dampetla. All rights reserved.
//

import UIKit

class createAccountVC: UIViewController {
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    @IBOutlet weak var usernameTxt: UITextField!
    
    @IBOutlet weak var emailTxt: UITextField!
    
    @IBOutlet weak var passwordTxt: UITextField!
    
    @IBOutlet weak var userImage: UIImageView!
    
    //Variables
    
    var avatarName = "ProfileDefault"
    var avatarColor = "[0.5,0.5,0.5,1]"
    var bgColor : UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        if UserDataService.instance.avatarName != "" {
        userImage.image = UIImage(named: UserDataService.instance.avatarName)
        avatarName = UserDataService.instance.avatarName
            if avatarName.contains("light"){
                userImage.backgroundColor = UIColor.lightGray
            }
        }
    }
    
    @IBAction func createAccountPressed(_ sender: Any) {
        spinner.isHidden = false
        spinner.startAnimating()
        guard let username = usernameTxt.text, usernameTxt.text != "" else { return }
        guard let email = emailTxt.text, emailTxt.text != "" else { return }
        guard let password = passwordTxt.text, passwordTxt.text != "" else { return }
        
        AuthService.instance.registerUser(email: email, password: password) { (success) in
            if success {
                AuthService.instance.loginUser(email: email, password: password, completion: { (success) in
                    if success {
                        AuthService.instance.createUser(name: username, email: email, avatarName: self.avatarName, avatarColor: self.avatarColor, completion: { (success) in
                            if success {
                                self.spinner.stopAnimating()
                                self.spinner.isHidden = true
                                self.performSegue(withIdentifier: "toChanellVc", sender: nil)
                                NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
                            }
                        })
                    }
                })
            }
        }
    }
    
    @IBAction func pickAvatarPressed(_ sender: Any) {
        
        performSegue(withIdentifier: TO_AVATAR_PICKER, sender: nil)
    }
    
    @IBAction func chooseBgColorPressed(_ sender: Any) {
        
        let r = CGFloat(arc4random_uniform(255))/255
        let g = CGFloat(arc4random_uniform(255))/255
        let b = CGFloat(arc4random_uniform(255))/255
        
        bgColor = UIColor(red: r, green: g, blue: b, alpha: 1)
        UIView.animate(withDuration: 0.4){
        self.userImage.backgroundColor = self.bgColor
        }
    }
    
    @IBAction func closeBtnPressed(_ sender: Any) {
        
        performSegue(withIdentifier: "toChanellVc", sender: nil)
    }
    
    func setUpView(){
        
        spinner.isHidden = true
        usernameTxt.attributedPlaceholder = NSAttributedString(string: "username", attributes: [NSAttributedStringKey.foregroundColor : smackPurplePlaceHolder])
        emailTxt.attributedPlaceholder = NSAttributedString(string: "email", attributes: [NSAttributedStringKey.foregroundColor : smackPurplePlaceHolder])
        passwordTxt.attributedPlaceholder = NSAttributedString(string: "password", attributes: [NSAttributedStringKey.foregroundColor : smackPurplePlaceHolder])
        
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap))
        view.addGestureRecognizer(tap)
    }
    
    @objc func handleTap(){
        view.endEditing(true)
    }
    

    
}
