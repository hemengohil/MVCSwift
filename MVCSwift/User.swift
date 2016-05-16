//
//  User.swift
//  MVCSwift
//
//  Created by Hemen Gohil on 5/6/16.
//  Copyright © 2016 Hemen Gohil. All rights reserved.
//

import UIKit

let kUserId = "userId"
let kUserName = "userName"
let kUserAddress = "userAddress"
let kUserProfilePicURL = "userProfilePicURL"

class User: NSObject {

    var userId : String!
    var userName : String!
    var userAddress : String!
    var userProfilePicURL : String!

    override init() {
        
    }

    init(data: NSDictionary) {
        userId = data.valueForKey(kUserId) as! String
        userName = data.valueForKey(kUserName) as! String
        userAddress = data.valueForKey(kUserAddress) as! String
        userProfilePicURL = data.valueForKey(kUserProfilePicURL) as! String
    }

    override var description: String {
        print("UserId : \(userId)\n" +
            "UserName : \(userName)\n" +
            "UserAddress : \(userAddress)\n" +
        "UserProfilePic : \(userProfilePicURL)\n")
        
        return "UserId : \(userId)" +
            "UserName : \(userName)" +
            "UserAddress : \(userAddress)"
    }

}
