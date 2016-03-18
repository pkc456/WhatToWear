//
//  ViewController.swift
//  WhatToWear
//
//  Created by Pardeep on 15/03/16.
//  Copyright © 2016 www.programmingcrew.in. All rights reserved.
//

import UIKit
import Koloda

class ViewController: UIViewController {
    @IBOutlet weak var kolodaView: KolodaView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK:- Set UI and delegates
    func setUI(){
        kolodaView.dataSource = self
        kolodaView.delegate = self
    }

    //MARK: IBActions methods
    @IBAction func btnLikeAction(sender: UIButton) {
        kolodaView?.swipe(SwipeResultDirection.Right)
    }
    
    @IBAction func btnDislikeAction(sender: UIButton) {
        kolodaView?.swipe(SwipeResultDirection.Left)
    }
    
    @IBAction func btnUndoAction(sender: UIBarButtonItem) {
        kolodaView?.revertAction()
    }
}

