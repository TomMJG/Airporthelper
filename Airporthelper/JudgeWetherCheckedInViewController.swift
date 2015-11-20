//
//  JudgeWetherCheckedInViewController.swift
//  UserInterfaceGoldMasterVersion
//
//  Created by Fantask on 15/4/25.
//  Copyright (c) 2015年 Fantask. All rights reserved.
//

import UIKit

//询问是否已经值机 界面
class JudgeWetherCheckedInViewController: UIViewController {
    
    @IBAction func didCheckedIn(sender: UIButton) {
        inOneTap = true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //返回
    @IBAction func backToJudgeWetherCheckedInViewController(segue : UIStoryboardSegue) {
        
    }
    

}