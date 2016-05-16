//
//  SharedManager.swift
//  MVCSwift
//
//  Created by Hemen Gohil on 5/6/16.
//  Copyright © 2016 Hemen Gohil. All rights reserved.
//

import UIKit
import SystemConfiguration


let sharedInstance = SharedManager.sharedInstance

class SharedManager: NSObject {
    
    static let sharedInstance = SharedManager() // SHARED OBJECT....

    var objLoginUser = User()
    let deviceType = "iOS"
    var deviceToken : String!

    override init() {
        
        deviceToken = "DEVICE_TOKEN"
        objLoginUser = User() // Logged In user Object....
        
    }
    
    // GENERAL METHODS....
    // Check Internet Connection is Available.
    class func isNetAvailable() -> Bool {
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(sizeofValue(zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)
        let defaultRouteReachability = withUnsafePointer(&zeroAddress) {
            SCNetworkReachabilityCreateWithAddress(nil, UnsafePointer($0))
        }
        var flags = SCNetworkReachabilityFlags()
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) {
            return false
        }
        let isReachable = (flags.rawValue & UInt32(kSCNetworkFlagsReachable)) != 0
        let needsConnection = (flags.rawValue & UInt32(kSCNetworkFlagsConnectionRequired)) != 0
        return (isReachable && !needsConnection)
    }

}
