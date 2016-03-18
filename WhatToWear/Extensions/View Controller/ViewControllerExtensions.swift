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
            return UIImageView(image: UIImage(named: "Card_like_\(index + 1)"))
        }
        
        func koloda(koloda: KolodaView, viewForCardOverlayAtIndex index: UInt) -> OverlayView? {
            return NSBundle.mainBundle().loadNibNamed("OverlayView",
                owner: self, options: nil)[0] as? OverlayView
        }
}
