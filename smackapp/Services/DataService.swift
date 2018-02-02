//
//  DataService.swift
//  smackapp
//
//  Created by Nithin Chakravarthy Dampetla on 1/29/18.
//  Copyright © 2018 Nithin Chakravarthy Dampetla. All rights reserved.
//

import Foundation


class UserDataService {
    
    static let instance = UserDataService()
    
    public private(set) var id = ""
    public private(set) var avatarColor = ""
    public private(set) var avatarName = ""
    public private(set) var email = ""
    public private(set) var name = ""
    
    func setUserData(id : String, avatarColor : String, avatarName : String, email : String, name : String){
        self.id = id
        self.avatarName = avatarName
        self.avatarColor = avatarColor
        self.email = email
        self.name = name
    }
    
    func setAvatarName(avatarName: String){
        self.avatarName = avatarName
    }
    
    func returnUIColor(components: String) -> UIColor {
        let scanner = Scanner(string: components)
        let skipped = CharacterSet(charactersIn: "[], ")
        let comma = CharacterSet(charactersIn: ",")
        
        scanner.charactersToBeSkipped = skipped
        
        var r,g,b,a : NSString?
        
        scanner.scanUpToCharacters(from: comma, into: &r)
        scanner.scanUpToCharacters(from: comma, into: &g)
        scanner.scanUpToCharacters(from: comma, into: &b)
        scanner.scanUpToCharacters(from: comma, into: &a)
        
        let defaultColor = UIColor.lightGray
        guard let rWrapped = r else { return defaultColor}
        guard let gWrapped = g else { return defaultColor}
        guard let bWrapped = b else { return defaultColor}
        guard let aWrapped = a else { return defaultColor}
        
        let rFloat = CGFloat(rWrapped.doubleValue)
        let gFloat = CGFloat(gWrapped.doubleValue)
        let bFloat = CGFloat(bWrapped.doubleValue)
        let aFloat = CGFloat(aWrapped.doubleValue)
        
        let color = UIColor(red: rFloat, green: gFloat, blue: bFloat, alpha: aFloat)
        
        
        return color
    }
    
    func logOutPressed(){
        id = ""
        avatarColor = ""
        avatarName = ""
        email = ""
        name = ""
        AuthService.instance.isLoggedIn = false
        AuthService.instance.authToken = ""
        AuthService.instance.userEmail = ""
        MessageService.instance.clearChannels()
        MessageService.instance.clearMessages()
    }
}
