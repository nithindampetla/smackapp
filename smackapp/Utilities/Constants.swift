//
//  Constants.swift
//  smackapp
//
//  Created by Nithin Chakravarthy Dampetla on 1/26/18.
//  Copyright © 2018 Nithin Chakravarthy Dampetla. All rights reserved.
//

import Foundation

typealias CompletionHandler = (_ Success: Bool) -> ()

//URL Constants

let BASE_URL = "https://chattychatnithin.herokuapp.com/v1/"
let URL_REGISTER = "\(BASE_URL)account/register"
let URL_LOGIN = "\(BASE_URL)account/login"
let URL_USER_ADD = "\(BASE_URL)user/add"

//Header
let HEADER = [
    "Content-Type" : "application/json; charset=utf-8"
]

//Segues

let TO_AVATAR_PICKER = "toAvatarPicker"
let TO_LOGIN = "toLogIn"
let TO_CREATE_ACCOUNT = "toCreateAccountVC"
let UNWIND = "toChanellVc"
