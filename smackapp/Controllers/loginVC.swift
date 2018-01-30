//
//  loginVC.swift
//  smackapp
//
//  Created by Nithin Chakravarthy Dampetla on 1/25/18.
//  Copyright © 2018 Nithin Chakravarthy Dampetla. All rights reserved.
//

import UIKit

class loginVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func closePressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func createAccPressed(_ sender: Any) {
        
        performSegue(withIdentifier: "toCreateAccountVC", sender: nil)
    }
    
    
}
