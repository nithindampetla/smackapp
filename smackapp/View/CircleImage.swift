//
//  CircleImage.swift
//  smackapp
//
//  Created by Nithin Chakravarthy Dampetla on 1/30/18.
//  Copyright © 2018 Nithin Chakravarthy Dampetla. All rights reserved.
//

import UIKit

class CircleImage: UIImageView {

    override func awakeFromNib() {
        super.awakeFromNib()
        self.setUpView()
    }
    
    func setUpView(){
        self.layer.cornerRadius = self.frame.width/2
        self.clipsToBounds = true
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        self.setUpView()
    }

}
