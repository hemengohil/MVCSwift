//
//  NSNotificationCenter+Extension.swift
//  Tasty
//
//  Created by Vitaliy Kuzmenko on 08/01/15.
//  Copyright (c) 2015 Vitaliy Kuz'menko. All rights reserved.
//

import UIKit

extension NSNotificationCenter {
    
    class func postNotificationName(name: String) {
        let nc = defaultCenter()
        nc.postNotificationName(name, object: nil)
    }
    
    class func postNotificationName(name: String, userInfo: [NSObject : AnyObject]?) {
        let nc = defaultCenter()
        nc.postNotificationName(name, object: nil, userInfo: userInfo)
    }
    
}
