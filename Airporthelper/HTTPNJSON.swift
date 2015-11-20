//
//  ViewController.swift
//  Mayday_Mayday
//
//  Created by Fantask on 15/4/17.
//  Copyright (c) 2015年 Fantask. All rights reserved.
//

import UIKit
import Foundation

//用于定位器中的循环
var previousTime : String = "00"
var currentTime : String = "01"
var getData = GetDataFromDataModel()


class HTTPNJSON: UIViewController {
    
    
    //定义一个定时器
    func doTimer() -> NSTimer {
        let timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "timerFireMethod:", userInfo: nil, repeats:true);
        timer.tolerance = 0.1
        return timer
    }

    
    
    //对 getAxis() 执行计时器
    func timerFireMethod(timer: NSTimer) {
        
        var previousTime : String = "00"
        var currentTime : String = "01"
        var getData = GetDataFromDataModel()
        let formatter = NSDateFormatter();
        formatter.dateFormat = "ss"
        let strNow = formatter.stringFromDate(NSDate())
        
        if previousTime != currentTime {
            
            previousTime = currentTime
            currentTime = strNow
            getAxis()

        } else {
            timerFireMethod(timer)
        }
        
    }
    
    //获取当前位置
    func getAxis() {
        let url :String = "http://172.20.10.9:8001/loc"
        
        NSURLConnection.sendAsynchronousRequest(NSURLRequest(URL : NSURL(string: url)!), queue:NSOperationQueue()) { (resp : NSURLResponse?, data : NSData?, error : NSError?) -> Void in
            if let d = data {
               
                let jsonObject : AnyObject! = try? NSJSONSerialization.JSONObjectWithData(d, options: NSJSONReadingOptions.MutableContainers)
                //解析json数据
                
                if let locationArray = jsonObject as? NSArray {
                    if let xAxis = locationArray[0] as? NSNumber {          //x坐标
                        if let yAxis = locationArray[1] as? NSNumber {      //y坐标
                            if let zAxis = locationArray[2] as? NSNumber {  //z坐标
                                
                                dispatch_sync(dispatch_get_main_queue(), { () -> Void in
                                    
                                    currentPosition[0] = xAxis.doubleValue * 1928
                                    currentPosition[1] = (1 - yAxis.doubleValue) * 1928
                                    currentPosition[2] = zAxis.doubleValue
                                    
                                })
                            }
                        }
                    }
                }
                
            }
        }
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        timerFireMethod(doTimer())
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}