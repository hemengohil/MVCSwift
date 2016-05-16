//
//  UINavigationController+Extension.swift
//  Tasty
//
//  Created by Vitaliy Kuzmenko on 14/10/14.
//  Copyright (c) 2014 Vitaliy Kuz'menko. All rights reserved.
//

import UIKit

extension UINavigationBar {
    
    func setTransparent() {
        setBackgroundImage(UIImage(), forBarMetrics: .Default)
        shadowImage = UIImage()
        translucent = true
    }
    
    func setTitleFont(font: UIFont) {
        setTitleFont(font, withColor: UIColor.blackColor())
    }
    
    func setTitleFont(font: UIFont, withColor color: UIColor) {
        var attrs = [String: AnyObject]()
        attrs[NSFontAttributeName] = font
        attrs[NSForegroundColorAttributeName] = color
        
        titleTextAttributes = attrs
    }
    
}

