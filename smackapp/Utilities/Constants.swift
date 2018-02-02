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
let URL_FIND_USER_BY_EMAIL = "\(BASE_URL)user/byEmail/"
let URL_GET_CHANNELS = "\(BASE_URL)channel"
let URL_GET_MESSAGES = "\(BASE_URL)message/byChannel"



//Header
let HEADER = [
    "Content-Type" : "application/json; charset=utf-8"
]

let BEARER = [
    "Authorization" : "Bearer \(AuthService.instance.authToken)",
    "Content-Type" : "application/json; charset=utf-8"
]

// Notification Constants

let NOTIF_USER_DATA_DID_CHANGE = Notification.Name("notifUserDataChanged")
let NOTIF_CHANNELS_LOADED = Notification.Name("notifChannelsLoaded")
let NOTIF_CHANNEL_SELECTED = Notification.Name("notifChannelSelected")

//Colors

let smackPurplePlaceHolder = #colorLiteral(red: 0.2588235294, green: 0.3294117647, blue: 0.7254901961, alpha: 0.5)
//Segues

let TO_AVATAR_PICKER = "toAvatarPicker"
let TO_LOGIN = "toLogIn"
let TO_CREATE_ACCOUNT = "toCreateAccountVC"
let UNWIND = "toChanellVc"
