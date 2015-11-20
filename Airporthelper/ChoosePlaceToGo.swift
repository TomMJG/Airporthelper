//
//  ChoosePlaceToGo.swift
//  UserInterfaceGoldMasterVersion
//
//  Created by Fantask on 15/4/16.
//  Copyright (c) 2015年 Fantask. All rights reserved.
//

import UIKit

//"导航"界面
class ChoosePlaceToGo: UIViewController {
    
    //点击饮水按钮，导航到最近的饮水处
    @IBAction func water(sender: UIButton) {
        destinations.removeAll(keepCapacity: false)
        destinations.insert(entityData[findNearestWater()]!, atIndex: destinations.count)
        let getdata = GetDataFromDataModel()
        getdata.totalRouteMake()        //生成路径
    }
    
    //点击卫生间按钮，导航至最近的卫生间
    @IBAction func restroom(sender: UIButton) {
        destinations.removeAll(keepCapacity: false)
        destinations.insert(entityData[findNearestToilet()]!, atIndex: destinations.count)
        let getdata = GetDataFromDataModel()
        getdata.totalRouteMake()        //生成路径
        
    }
    
    //点击停车场按钮，导航至停车场
    @IBAction func parkinglot(sender: UIButton) {
        if currentPosition[2] == 0.0 {
            let alertView = UIAlertView()
            alertView.delegate=self
            alertView.title = "警告"
            alertView.message = "您已经在停车场了！"
            alertView.addButtonWithTitle("知道了")
            alertView.show()
        } else {
            destinations.removeAll(keepCapacity: false)
            destinations.insert(entityData["电梯0-4"]!, atIndex: destinations.count)
            let getdata = GetDataFromDataModel()
            getdata.totalRouteMake()//生成路径
            destinations.removeAll(keepCapacity: false)
            destinations.insert(entityData[findParkinglot()]!, atIndex: destinations.count)
            getdata.totalRouteMake()//生成路径
            
        }
    }
    
    //点击问询处按钮，导航至问询处
    @IBAction func informationdesk(sender: UIButton) {
        destinations.removeAll(keepCapacity: false)
        destinations.insert(entityData[findNearestInformationDesk()]!, atIndex: destinations.count)
        let getdata = GetDataFromDataModel()
        getdata.totalRouteMake()        //生成路径
    }
    
    //在"添加目的地"界面点击饮水
    @IBAction func addWater(sender: UIButton) {
        destinations.insert(entityData[findNearestWater()]!, atIndex: 0)
        let getdata = GetDataFromDataModel()
        getdata.totalRouteMake()        //生成路径
        
    }
   
    //在"添加目的地"界面点击卫生间
    @IBAction func addRestroom(sender: UIButton) {
        destinations.insert(entityData[findNearestToilet()]!, atIndex: 0)
        let getdata = GetDataFromDataModel()
        getdata.totalRouteMake()        //生成路径
    }
    
    //在"添加目的地"界面点击问询处
    @IBAction func addInformationDesk(sender: UIButton) {
        destinations.insert(entityData[findNearestInformationDesk()]!, atIndex: 0)
        let getdata = GetDataFromDataModel()
        getdata.totalRouteMake()        //生成路径
    }
    
    //遍历查找最近的饮水处
    func findNearestWater() -> String {
        var minLength = GetDataFromDataModel().calculateRouteLenth(97)
        var title = ""
        var i = 0
        for item in wateringPlaceDictionary.values {
            i++
            if GetDataFromDataModel().calculateRouteLenth(item.relateroutenode) <= minLength {
                minLength = GetDataFromDataModel().calculateRouteLenth(item.relateroutenode)
                title = item.title
            }
        }
        return title
    }
    
    //遍历查找最近的洗手间
    func findNearestToilet() -> String {
        
        var minLength = GetDataFromDataModel().calculateRouteLenth(97)
        var title = ""
        for item in toiletDictionary.values {
            if GetDataFromDataModel().calculateRouteLenth(item.relateroutenode) <= minLength {
                minLength = GetDataFromDataModel().calculateRouteLenth(item.relateroutenode)
                title = item.title
            }
        }
        return title
    }
    
    //遍历查找最近的问询处
    func findNearestInformationDesk() -> String {
        
        var minLength = GetDataFromDataModel().calculateRouteLenth(93)
        var title = ""
        for item in inquiryDeskDictionary.values {
            if GetDataFromDataModel().calculateRouteLenth(item.relateroutenode) <= minLength {
                if currentPosition[2] != 0 {
                    if item.z == Int(currentPosition[2]) {
                        minLength = GetDataFromDataModel().calculateRouteLenth(item.relateroutenode)
                        title = item.title
                    }
                } else {
                    minLength = GetDataFromDataModel().calculateRouteLenth(item.relateroutenode)
                    title = item.title
                }
            }
        }
        return title
    }
    
    //查找最近的前往停车场的电梯
    func findParkinglot() -> String {
        
        var title = parkElevator.title

        var title1 : NSString = title
        var title2 : NSString = title
        title1 = title1.substringToIndex(2)
        title2 = title2.substringFromIndex(3)
        title = (title1 as String) + "0"
        title = title + (title2 as String)
        
        return title
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func backToChoosePlaceToGo(segue : UIStoryboardSegue) {
        
    }
    
    //如果选择"安检口"，则只导航至安检口，不再继续前往登记口
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "GoToSafetyCheck" {
            goToSafety = true
        }
    }
}

