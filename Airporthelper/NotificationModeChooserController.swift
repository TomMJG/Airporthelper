//
//  NotificationModeChooserController.swift
//  UserInterfaceGoldMasterVersion
//
//  Created by Fantask on 15/4/22.
//  Copyright (c) 2015年 Fantask. All rights reserved.
//

import UIKit

//选择提示方式界面
class NotificationModeChooserController: UIViewController {
    
    @IBOutlet weak var NotificationModePicker: UIPickerView!
    
    @IBAction func setNotificationMode(sender: UIButton) {
        
        let mode = NotificationModePicker.selectedRowInComponent(0)
        
        switch mode {
        case 0:
            notificationModeRowName = "声音"
            notificationModeRow = 0
        
        default:
            notificationModeRowName = "无"
            notificationModeRow = 1
        }
        
    }
    
    let notificationModes = ["声音", "无"]
    
    func numberOfComponentsInPickerView(NotificationModePicker : UIPickerView!) -> Int {
        return 1
    }
    
    func pickerView(NotificationModePicker : UIPickerView!, numberOfRowsInComponent component: Int) -> Int {
        return notificationModes.count
    }
    
    func pickerView(NotificationModePicker : UIPickerView!, titleForRow row : Int, forComponent component : Int) -> String {
        return notificationModes[row]
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        NotificationModePicker.selectRow(notificationModeRow, inComponent: 0, animated: false)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
