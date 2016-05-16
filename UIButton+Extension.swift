//
//  Extension.swift
//  WhatToCook
//
//  Created by Vitaliy Kuzmenko on 11/10/14.
//  Copyright (c) 2014 KuzmenkoFamily. All rights reserved.
//

import UIKit

extension UIButton {
    
    func setBackgroundColor(color: UIColor, forState state: UIControlState) {
        let image = UIImage(color: UIColor.lightGrayColor())
        setBackgroundImage(image, forState: state)
    }
    
}

