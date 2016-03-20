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
            return numberOfCards
        }
        
        func koloda(koloda: KolodaView, viewForCardAtIndex index: UInt) -> UIView {
            
            let showCaseView =  NSBundle.mainBundle().loadNibNamed("ShirtJeanView",
                owner: self, options: nil)[0] as! ShirtJeanView

//TODO: (pkc456)get count from Database table number of rows
            let randomNumberForShirt = Int(arc4random_uniform(UInt32(numberOfCards/2)) + 1)
            let randomNumberForPant = Int(arc4random_uniform(UInt32(numberOfCards/2)) + 1)
            
            let indexForShirt = String(format : "%i",randomNumberForShirt)
            let indexForPant = String(format : "%i",randomNumberForPant)
            
            showCaseView.imageviewShirt.image = UIImage(named: "shirt_\(indexForShirt)")
            showCaseView.imageviewPant.image = UIImage(named: "pant_\(indexForPant)")
            return showCaseView
        }
        
        func koloda(koloda: KolodaView, viewForCardOverlayAtIndex index: UInt) -> OverlayView? {
            return NSBundle.mainBundle().loadNibNamed("OverlayView",
                owner: self, options: nil)[0] as? OverlayView
        }
}
