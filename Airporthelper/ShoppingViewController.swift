//
//  shoppingViewController.swift
//  UserInterfaceGoldMasterVersion
//
//  Created by Fantask on 15/4/16.
//  Copyright (c) 2015年 Fantask. All rights reserved.
//

import UIKit

//分类界面
class ShoppingViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //点击不同的图标button，会跳转至不同的具体商店TableView
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "specialties" {
            storeCategoryName = "特产"
        }
        if segue.identifier == "clothes" {
            storeCategoryName = "服饰"
        }
        if segue.identifier == "books" {
            storeCategoryName = "图书"
        }
        if segue.identifier == "stores" {
            storeCategoryName = "便利店"
        }
    }
    
    @IBAction func backToShoppingViewController(segue : UIStoryboardSegue) {
        
    }
    
}

