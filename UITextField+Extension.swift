//
//  UITextField+Extension.swift
//  WhatToCook
//
//  Created by Vitaliy Kuzmenko on 12/10/14.
//  Copyright (c) 2014 KuzmenkoFamily. All rights reserved.
//

import UIKit

extension UITextField {
    
    var selectedRange: NSRange {
        let start = selectedTextRange?.start
        let end = selectedTextRange?.end
        let loc = offsetFromPosition(beginningOfDocument, toPosition: start!)
        let len = offsetFromPosition(start!, toPosition: end!)
    
        return NSMakeRange(loc, len)
    }

    var rangeForFullText: NSRange {
        let loc = 0
        let len = offsetFromPosition(beginningOfDocument, toPosition: endOfDocument)
        return NSMakeRange(loc, len)
    }

}
