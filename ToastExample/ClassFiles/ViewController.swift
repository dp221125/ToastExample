//
//  ViewController.swift
//  ToastExample
//
//  Created by Seokho on 2020/01/17.
//  Copyright © 2020 Seokho. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func showToast() {
        self.view.showToast(self.view.makeToast("This is Toast"))
    }
    
}

