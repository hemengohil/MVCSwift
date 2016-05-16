//
//  UIImage+Utilites.swift
//  WhatToCook
//
//  Created by Vitaliy Kuzmenko on 20/09/14.
//  Copyright (c) 2014 KuzmenkoFamily. All rights reserved.
//

import UIKit

extension UIImage {
    
    
    convenience init?(color: UIColor) {
        self.init(color: color, size: CGSizeMake(1, 1))
    }
    
    convenience init?(color: UIColor, size: CGSize) {
        
        var rect = CGRectZero
        rect.size = size
        
        UIGraphicsBeginImageContext(size);
        let path = UIBezierPath(rect: rect)
        color.setFill()
        path.fill()
        
        let image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        self.init(CGImage: image.CGImage!)
        
    }
    
    convenience init?(image: UIImage, size: CGSize) {
//        let scale = UIScreen.mainScreen().scale
//        let newSize = CGSizeMake(size.width / scale, size.height / scale)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        image.drawInRect(CGRectMake(0, 0, size.width, size.height))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        self.init(CGImage: newImage.CGImage!)
    }
    
    func resizedImageAspectRatioWithNewWidth(newWidth: CGFloat) -> UIImage {
        let newSize = self.size.aspectRatioForWidth(newWidth)
        return resizedImageWithSize(newSize)
    }
    
    func resizedImageWithSize(newSize: CGSize) -> UIImage {
        let newRect = CGRectIntegral(CGRectMake(0, 0, newSize.width, newSize.height))
        var newImage: UIImage!
        
        let scale = UIScreen.mainScreen().scale
        
        UIGraphicsBeginImageContextWithOptions(newRect.size, false, 0.0);
        newImage = UIImage(CGImage: self.CGImage!, scale: scale, orientation: self.imageOrientation)
        newImage.drawInRect(newRect)
        newImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        let data = UIImageJPEGRepresentation(newImage, 0.9)
        let newI = UIImage(data: data!, scale: UIScreen.mainScreen().scale)
        
        return newI!
    }
    
    /**
    Fill Image with Tint Color
    
    :param: tintColor
    
    :returns: UIImage with Tint Color
    */
    func imageWithTint(tintColor: UIColor) -> UIImage {
        
        let rect = CGRectMake(0, 0, size.width, size.height);
        
        UIGraphicsBeginImageContextWithOptions(rect.size, false, scale)
        
        drawInRect(rect)
        
        let ctx = UIGraphicsGetCurrentContext()
        //CGContextSetBlendMode(ctx, 0)
        
        
        CGContextSetFillColorWithColor(ctx, tintColor.CGColor)
        CGContextFillRect(ctx, rect)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext();
        
        return image;
    }
    
    
}
