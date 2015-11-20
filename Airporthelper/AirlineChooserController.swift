//
//  AirlineChooserController.swift
//  UserInterfaceGoldMasterVersion
//
//  Created by Fantask on 15/4/16.
//  Copyright (c) 2015年 Fantask. All rights reserved.
//

import UIKit

class AirlineChooserController: UIViewController {
    
    @IBOutlet weak var AirlinePicker: UIPickerView!
    
    //设置航空公司名称
    let airlines = ["中国国际航空", "中国南方航空", "中国东方航空", "四川航空", "上海航空", "海南航空"]
    
    func numberOfComponentsInPickerView(pickerView : UIPickerView!) -> Int {
        return 1
    }
    
    func pickerView(pickerView : UIPickerView!, numberOfRowsInComponent component: Int) -> Int {
        return airlines.count
    }
    
    func pickerView(pickerView : UIPickerView!, titleForRow row : Int, forComponent component : Int) -> String {
        return airlines[row]
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
    @IBAction func backToAirlineChooserController(segue : UIStoryboardSegue) {
        
    }
  
    //选择航空公司，并将其作为元素压入目的地数组
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "AirlineHasBeenChosen" {
            destinations.removeAll(keepCapacity: false)
            let index = AirlinePicker.selectedRowInComponent(0)
            var airlineName : String!
            switch index {
            case 0:
                if !destinations.isEmpty {
                    destinations.removeAll(keepCapacity: false)
                }
                 airlineName = "中国国际航空公司"
                 destinations.insert(SC1, atIndex: destinations.count)
                 ifChangeDestination = true
            case 1:
                if !destinations.isEmpty {
                    destinations.removeAll(keepCapacity: false)
                }
                airlineName = "中国南方航空公司"
                destinations.insert(SC2, atIndex: destinations.count)
                ifChangeDestination = true
            case 2:
                if !destinations.isEmpty {
                    destinations.removeAll(keepCapacity: false)
                }
                airlineName = "中国东方航空公司"
                destinations.insert(SC3, atIndex: destinations.count)
                ifChangeDestination = true
            case 3:
                if !destinations.isEmpty {
                    destinations.removeAll(keepCapacity: false)
                }
                airlineName = "四川航空"
                destinations.insert(SC4, atIndex: destinations.count)
                ifChangeDestination = true
            case 4:
                if !destinations.isEmpty {
                    destinations.removeAll(keepCapacity: false)
                }
                airlineName = "上海航空"
                destinations.insert(SC5, atIndex: destinations.count)
                ifChangeDestination = true
            case 5:
                if !destinations.isEmpty {
                    destinations.removeAll(keepCapacity: false)
                }
                airlineName = "海南航空"
                destinations.insert(SC6, atIndex: destinations.count)
                ifChangeDestination = true
            default:
                airlineName = "nil"
            }
            ifAddDestination = true
            ifAddDestinationAtEnd = true
            airline = airlineName
            
            //生成路径
            let getdata = GetDataFromDataModel()
            getdata.totalRouteMake()
        }
    }
    
}
