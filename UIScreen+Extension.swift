//
//  UIScreen+Extension.swift
//  Tasty
//
//  Created by Vitaliy Kuzmenko on 16/10/14.
//  Copyright (c) 2014 Vitaliy Kuz'menko. All rights reserved.
//

import UIKit

extension UIScreen {
    
    class var size: CGSize {
        return UIScreen.mainScreen().bounds.size
    }
    
    class var width: CGFloat {
        return size.width
    }

    class var height: CGFloat {
        return size.height
    }

}

