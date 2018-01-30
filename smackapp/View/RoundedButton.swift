//
//  RoundedButton.swift
//  smackapp
//
//  Created by Nithin Chakravarthy Dampetla on 1/29/18.
//  Copyright © 2018 Nithin Chakravarthy Dampetla. All rights reserved.
//

import UIKit


@IBDesignable
class RoundedButton: UIButton {

    @IBInspectable var cornerRadius : CGFloat = 3.0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    
    override func awakeFromNib() {
        self.setVIew()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        self.setVIew()
    }
    
    
    
    func setVIew(){
        self.layer.cornerRadius = cornerRadius
    }


}
