//
//  AvatarCell.swift
//  smackapp
//
//  Created by Nithin Chakravarthy Dampetla on 1/30/18.
//  Copyright © 2018 Nithin Chakravarthy Dampetla. All rights reserved.
//

import UIKit

class AvatarCell: UICollectionViewCell {
    
    @IBOutlet weak var avatarImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpView() 
    }
    
    func setUpView(){
        self.layer.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
    }
    
    
}
