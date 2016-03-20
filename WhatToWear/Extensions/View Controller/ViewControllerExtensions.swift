//
//  ViewControllerExtensions.swift
//  WhatToWear
//
//  Created by Pardeep on 18/03/16.
//  Copyright © 2016 www.programmingcrew.in. All rights reserved.
//

import Foundation
import Koloda


var numberOfCards :UInt = 6

//MARK: KolodaViewDelegate
extension ViewController: KolodaViewDelegate {
    
    func koloda(koloda: KolodaView, didSwipedCardAtIndex index: UInt, inDirection direction: SwipeResultDirection) {
        if index >= 3 {
            kolodaView.reloadData()
        }
    }
    
    func koloda(kolodaDidRunOutOfCards koloda: KolodaView) {
        kolodaView.resetCurrentCardNumber()
    }
    
}

//MARK: KolodaViewDataSource
extension ViewController: KolodaViewDataSource {
        
        func koloda(kolodaNumberOfCards koloda:KolodaView) -> UInt {
            print(numberOfCards)
            return numberOfCards
        }
        
        func koloda(koloda: KolodaView, viewForCardAtIndex index: UInt) -> UIView {
//            let combinedImage = UIImage.combine(UIImage(named: "Card_like_\(index + 2)")!, UIImage(named: "Card_like_\(index + 1)")!)

//            let combinedImage = UIImage.imageByCombiningImage(UIImage(named: "Card_like_\(index + 1)")!, withImage: UIImage(named: "Card_like_\(index + 1)")!)

//            return UIImageView(image: combinedImage)
            
            return UIImageView(image: UIImage(named: "Card_like_\(index + 1)"))
        }
        
        func koloda(koloda: KolodaView, viewForCardOverlayAtIndex index: UInt) -> OverlayView? {
            return NSBundle.mainBundle().loadNibNamed("OverlayView",
                owner: self, options: nil)[0] as? OverlayView
        }
}

//MARK:- UIImage
extension UIImage {
    
    class func imageByCombiningImage(firstImage: UIImage, withImage secondImage: UIImage) -> UIImage {
        
        let newImageWidth  = max(firstImage.size.width,  secondImage.size.width )
        let newImageHeight = max(firstImage.size.height, secondImage.size.height)
        let newImageSize = CGSize(width : newImageWidth, height: newImageHeight)
        
        
        UIGraphicsBeginImageContextWithOptions(newImageSize, false, UIScreen.mainScreen().scale)
        
        let firstImageDrawX  = round((newImageSize.width  - firstImage.size.width  ) / 2)
        let firstImageDrawY  = round((newImageSize.height - firstImage.size.height ) / 2)
        
        let secondImageDrawX = round((newImageSize.width  - secondImage.size.width ) / 2)
        let secondImageDrawY = round((newImageSize.height - secondImage.size.height) / 2)
        
        firstImage .drawAtPoint(CGPoint(x: firstImageDrawX,  y: firstImageDrawY))
        secondImage.drawAtPoint(CGPoint(x: secondImageDrawX, y: secondImageDrawY))
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        
        return image
    }
    
    class func combine(images: UIImage...) -> UIImage {
        var contextSize = CGSizeZero
        
        for image in images {
            contextSize.width = max(contextSize.width, image.size.width)
            contextSize.height = max(contextSize.height, image.size.height)
        }
        
        UIGraphicsBeginImageContextWithOptions(contextSize, false, UIScreen.mainScreen().scale)
        
        for image in images {
            let originX = (contextSize.width - image.size.width) / 2
            let originY = (contextSize.height - image.size.height) / 2
            
            image.drawInRect(CGRectMake(originX, originY, image.size.width, image.size.height))
        }
        
        let combinedImage = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        return combinedImage
    }
}
