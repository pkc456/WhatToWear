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
    
    @IBAction func btnRefreshAction(sender: UIBarButtonItem) {
        kolodaView?.reloadData()
    }
    
    @IBAction func btnUploadPhotoAction(sender: UIBarButtonItem)
    {
        let actionSheetController: UIAlertController = UIAlertController(title: nil, message: "Upload photo of T-shirt/shirt or pant", preferredStyle: .ActionSheet)
        
        let cancelActionButton: UIAlertAction = UIAlertAction(title: "Cancel", style: .Cancel) { action -> Void in
        }
        actionSheetController.addAction(cancelActionButton)
        
        let gallaryActionButton: UIAlertAction = UIAlertAction(title: "Choose from gallery", style: .Default)
            { action -> Void in

        }
        actionSheetController.addAction(gallaryActionButton)
        
        let takePhotoActionButton: UIAlertAction = UIAlertAction(title: "Take photo", style: .Default)
            { action -> Void in
                
        }
        actionSheetController.addAction(takePhotoActionButton)
        self.presentViewController(actionSheetController, animated: true, completion: nil)
    }
}

