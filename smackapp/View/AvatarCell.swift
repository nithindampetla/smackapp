//
//  AvatarCell.swift
//  smackapp
//
//  Created by Nithin Chakravarthy Dampetla on 1/30/18.
//  Copyright © 2018 Nithin Chakravarthy Dampetla. All rights reserved.
//

import UIKit


enum AvatarType {
    case dark
    case light
}
class AvatarCell: UICollectionViewCell {
    
    @IBOutlet weak var avatarImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpView() 
    }
    
    func configureCell(index: Int, type: AvatarType){
        if type == AvatarType.dark {
            self.layer.backgroundColor = UIColor.lightGray.cgColor
            avatarImage.image = UIImage(named: "dark\(index)")
        }else{
            self.layer.backgroundColor = UIColor.gray.cgColor
            avatarImage.image = UIImage(named: "light\(index)")
        }
    }
    
    func setUpView(){
        self.layer.backgroundColor = UIColor.lightGray.cgColor
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
    }
    
    
}
