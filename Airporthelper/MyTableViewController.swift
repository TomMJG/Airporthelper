//
//  MyTableViewController.swift
//  UserInterfaceGoldMasterVersion
//
//  Created by papageno on 15/8/12.
//  Copyright (c) 2015年 Xu_Alex. All rights reserved.
//

import UIKit

//
class MyTableViewController: UITableViewController {
    
    @IBOutlet weak var idleSwitch: UISwitch!
    @IBOutlet weak var followSwitch: UISwitch!
    
    //设置屏幕常亮开关
    @IBAction func changeStatus(sender: UISwitch) {
        let idle = idleSwitch.on.boolValue
        ViewController().setScreenLight(idle)
        
        if idleSwitch.on {
            isSwitchOn = true
        } else {
            isSwitchOn = false
        }
    }
    
    //设置屏幕跟随开关
    @IBAction func changeFollowStatus(sender: UISwitch) {
        let follow = followSwitch.on.boolValue
        ViewController().setScreenFollow(follow)
        
        if followSwitch.on {
            isFollowing = true
        } else {
            isFollowing = false
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        idleSwitch.on = false
        followSwitch.on = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}