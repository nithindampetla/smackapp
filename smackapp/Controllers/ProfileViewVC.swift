//
//  ProfileViewVC.swift
//  smackapp
//
//  Created by Nithin Chakravarthy Dampetla on 1/31/18.
//  Copyright © 2018 Nithin Chakravarthy Dampetla. All rights reserved.
//

import UIKit

class ProfileViewVC: UIViewController {

    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var userName: UILabel!
    
    @IBOutlet weak var userEmail: UILabel!
    
    @IBOutlet weak var userImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()

        // Do any additional setup after loading the view.
    }

    @IBAction func closeButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func logoutButtonPressed(_ sender: Any) {
        UserDataService.instance.logOutPressed()
        NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
        dismiss(animated: true, completion: nil)
    }
    
    func setUpView(){
        
        userName.text = UserDataService.instance.name
        userEmail.text = UserDataService.instance.email
        userImage.image = UIImage(named: UserDataService.instance.avatarName)
        userImage.backgroundColor = UserDataService.instance.returnUIColor(components: UserDataService.instance.avatarColor)
        
        
        let closeTouchGesture = UITapGestureRecognizer(target: self, action: #selector(ProfileViewVC.closeTapped(_:)))
        bgView.addGestureRecognizer(closeTouchGesture)
        
    }
    
    @objc func closeTapped(_ recognizer: UITapGestureRecognizer){
        self.dismiss(animated: true, completion: nil)
    }
    
}
