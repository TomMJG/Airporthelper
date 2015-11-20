//
//  LuggageCheckInController.swift
//  UserInterfaceGoldMasterVersion
//
//  Created by Fantask on 15/4/16.
//  Copyright (c) 2015年 Fantask. All rights reserved.
//

import UIKit

//行李托运界面，只显示，导航过程中暂不区分，若机场提供自助值机终端，则激活此功能
class LuggageCheckInController: UIViewController {
    
    @IBAction func cancel(sender: UIButton) {
        if destinations.count > 0 {
            destinations.removeLast()  //清除目的地数组的最后一个项
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "LuggageNotChecked" {
            isGonnaChackInLuggage = false       //不托运
        } else if segue.identifier == "LuggageChecked" {
            isGonnaChackInLuggage = true        //托运
        }
    }
    
}