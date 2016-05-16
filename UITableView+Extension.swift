//
//  UITableView+Extension.swift
//  Tasty
//
//  Created by Vitaliy Kuzmenko on 23/12/14.
//  Copyright (c) 2014 Vitaliy Kuz'menko. All rights reserved.
//

import UIKit

extension UITableView {
    
    func scrollToBottomAnimated(animated: Bool) {
        let row = numberOfRowsInSection(0) - 1
        if row >= 0 {
            let indexPath = NSIndexPath(forRow: row, inSection: 0)
            scrollToIndexPath(indexPath, animated: animated)
        }
    }
    
    func scrollToIndexPath(indexPath: NSIndexPath, animated: Bool) {
        scrollToRowAtIndexPath(indexPath, atScrollPosition: UITableViewScrollPosition.Bottom, animated: animated)
    }
}

