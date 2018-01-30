//
//  ChannelVc.swift
//  smackapp
//
//  Created by Nithin Chakravarthy Dampetla on 1/24/18.
//  Copyright © 2018 Nithin Chakravarthy Dampetla. All rights reserved.
//

import UIKit

class ChannelVc: UIViewController {

    @IBOutlet weak var loginBtn: UIButton!
    @IBAction func prepareForUnWind(segue: UIStoryboardSegue){}
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.revealViewController().rearViewRevealWidth = self.view.frame.size.width - 60
        
        
    }
    
    
    @IBAction func loginBtnClicked(_ sender: Any) {
        
        performSegue(withIdentifier: "toLogIn", sender: nil)
    }
    

}
