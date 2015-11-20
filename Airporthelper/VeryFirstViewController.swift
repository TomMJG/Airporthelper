//
//  ViewController.swift
//  test
//
//  Created by Fantask on 15/4/29.
//  Copyright (c) 2015年 Fantask. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, QRCodeReaderViewControllerDelegate {
        
    @IBOutlet weak var button: UIButton!
    @IBAction func button(sender: UIButton) {
        mapViewOffSet()
    }
    
    @IBOutlet weak var mapButton: UIButton!
    @IBOutlet weak var label: UILabel!
    
    //当前位置在地图上的图标📍
    var current = NAPinAnnotation()
    
    //存储当前屏幕上目的点的图标📍
    var destinationPin = [NAPinAnnotation()]
    
    
    //二维码扫描
    lazy var reader = QRCodeReaderViewController(metadataObjectTypes: [AVMetadataObjectTypeQRCode])

    //取消导航
    @IBAction func cancelNavigation(sender: UIButton) {
        destinations.removeAll(keepCapacity: false)
        totalRoute.removeAll(keepCapacity: false)
        inOneTap = false
        isFollowing = false
        isFirstTimeFollow = true
    }
    @IBOutlet weak var cancelNavigationOutlet: UIButton!
    
    //增加中转点
    @IBAction func addDestinations(sender: UIButton) {
        isInsertingMiddleDestination = true
    }
    @IBOutlet weak var addDestinationsOutlet: UIButton!
    
    @IBOutlet weak var currentPositionLabel: UILabel!
    //打开二维码扫描
    @IBAction func QRScannerButton(sender: UIButton) {
        if QRCodeReader.supportsMetadataObjectTypes() {
            reader.modalPresentationStyle = .FormSheet
            reader.delegate               = self
            
            reader.completionBlock = { (result: String?) in
                twoDimension = result!
                if(twoDimension != "") {
                    var twoDimensionArray = twoDimension.componentsSeparatedByString(",")

                    if (twoDimensionArray[0] as NSString ).doubleValue != 0.0 && (twoDimensionArray[0] as NSString ).doubleValue <= 1928.0 {
                        if (twoDimensionArray[1] as NSString ).doubleValue != 0.0 && (twoDimensionArray[1] as NSString ).doubleValue <= 1928.0 {
                            if twoDimensionArray[2] == "0.0" || twoDimensionArray[2] == "1.0" || twoDimensionArray[2] == "2.0" {
                                let num1:Double? = (twoDimensionArray[0] as NSString ).doubleValue;
                                let num2:Double? = (twoDimensionArray[1] as NSString ).doubleValue;
                                let num3:Double? = (twoDimensionArray[2] as NSString ).doubleValue;
                                currentPosition[0] = num1!
                                currentPosition[1] = num2!
                                currentPosition[2] = num3!
                            } else {
                                let alertView = UIAlertView()
                                alertView.delegate=self
                                alertView.title = "出错啦!"
                                alertView.message = "这个二维码不正确哦"
                                alertView.addButtonWithTitle("知道了")
                                alertView.show()
                            }
                        } else {
                            let alertView = UIAlertView()
                            alertView.delegate=self
                            alertView.title = "出错啦!"
                            alertView.message = "这个二维码不正确哦"
                            alertView.addButtonWithTitle("知道了")
                            alertView.show()
                        }
                    } else {
                        let alertView = UIAlertView()
                        alertView.delegate=self
                        alertView.title = "出错啦!"
                        alertView.message = "这个二维码不正确哦"
                        alertView.addButtonWithTitle("知道了")
                        alertView.show()
                    }
                    

                }

            }
            presentViewController(reader, animated: true, completion: nil)
        }
        else {
            let alert = UIAlertController(title: "Error", message: "Reader not supported by the current device", preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "OK", style: .Cancel, handler: nil))
            
            presentViewController(alert, animated: true, completion: nil)
        }
    }
    
    //显示地图
    @IBOutlet weak var mapView: NAMapView!
    
    //返回地图界面
    @IBAction func backVeryFirst(segue : UIStoryboardSegue) {
        
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        if isFirstTime {
            NSThread.sleepForTimeInterval(2.0)//首次启动延长2秒，以加长启动画面显示时间
            isFirstTime = false
        }
        self.mapView.bounces = true
        self.mapView.minimumZoomScale = 0.3
        self.mapView.maximumZoomScale = 2.0
        self.mapView.frame = self.view.bounds
        self.mapView.backgroundColor  = UIColor(red: 0, green: 0.475, blue: 0.761, alpha: 1.0)
        self.mapView.displayMap(UIImage(named: "wait"))
        currentmap = 3

        //初始化地图
        self.mapView.zoomScale = 0.3
        frameX = self.mapView.frame.width
        frameY = self.mapView.frame.height
        self.mapView.addCurrentAnnotation(current, animated: false)
        self.mapView.bouncesZoom = true
        
        //初始化json，定时获取当前位置
        let json = HTTPNJSON()
        json.doTimer()
        timerFire(doTimerCheck())
        
        self.mapView.userInteractionEnabled = true
        self.view.addSubview(button)
        button.hidden = true
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    //设置NSTimer 刷新地图信息
    func doTimerCheck() -> NSTimer {
        let timerCheck = NSTimer.scheduledTimerWithTimeInterval(1.0 , target: self, selector: "timerFire:", userInfo: nil, repeats:true);
        timerCheck.tolerance = 0.1
        return timerCheck
    }
    
    
    
    //对 导航navigation() 执行计时器
    func timerFire(timerCheck: NSTimer) {
        
        var previousTime : String = "00"        //设置时间矫正
        var currentTime : String = "01"
        var getData = GetDataFromDataModel()
        let formatter = NSDateFormatter();
        formatter.dateFormat = "ss"
        let strNow = formatter.stringFromDate(NSDate())
        
        if previousTime != currentTime {
            
            previousTime = currentTime
            currentTime = strNow
            navigation()
            
        } else {
            timerFire(timerCheck)       //出错则重置
        }
    }

    //更新地图信息
    func navigation() {
        
        //进行导航
        navigating()
        
        //判断旅客是否走偏
         let getdata = GetDataFromDataModel()
         getdata.judgeGoWrong()
    }
    
    
    

    //二维码函数
    func reader(reader: QRCodeReaderViewController, didScanResult result: String) {
        self.dismissViewControllerAnimated(true, completion: { [unowned self] () -> Void in

            })
    }
    
    func readerDidCancel(reader: QRCodeReaderViewController) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    //偏移地图，尽量对准旅客
    func mapViewOffSet() {
        if(currentPosition[0] >= 0){

            var offSetX = currentPosition[0]*zoom - Double(frameX)/2
            var offSetY = currentPosition[1]*zoom - Double(frameY)/2
            if( offSetX < 0) {
                offSetX = 0
            }
            if(( offSetX + Double(frameX) ) > zoom*1928) {
                offSetX = 1928*zoom - Double(frameX)
            }
            if( offSetY < 0 && (1928-currentPosition[1])*zoom > Double(frameY/2)){
                offSetY = 0
            }
            if(zoom == 0.3){
                if(currentPosition[1]>1928/2){
                    offSetY = 1928*zoom - Double(frameY) + 108
                }
                else{
                    offSetY = 0
                }
            }
//            else if(currentPosition[1]*zoom + Double(frameY/2) > 1928*zoom && (1928-currentPosition[1])*zoom + Double(frameY/2) < 1928*zoom) {
//                    offSetY = 1928*zoom - Double(frameY) + 108
//            }
            
            let haha : Double = 1928 * zoom
            if (currentPosition[1]*zoom + Double(frameY/2) > haha) {
                if (1928 - currentPosition[1])*zoom + Double(frameY/2) < haha {
                    offSetY = 1928*zoom - Double(frameY) + 108
                }
            }
            
            let offPoint:CGPoint = CGPointMake(CGFloat(offSetX), CGFloat(offSetY))
            self.mapView.setContentOffset(offPoint, animated: true)
        }
    }
    

    
    //设置屏幕常亮
    func setScreenLight(status : Bool) {
        UIApplication.sharedApplication().idleTimerDisabled = status
    }
    
    //设置屏幕跟随
    func setScreenFollow(status : Bool) {
        isFollowing = status
    }
    
    func navigating() {
        //检测是否正在导航，决定是否显示“取消导航”按钮和距离提示框
        if destinations.isEmpty {
            cancelNavigationOutlet.hidden = true
            addDestinationsOutlet.hidden = true
            label.hidden=true
            mapButton.hidden = false
            currentPositionLabel.hidden = false
        } else {
            mapButton.hidden = true
            cancelNavigationOutlet.hidden = false
            addDestinationsOutlet.hidden = false
            label.hidden=false
            currentPositionLabel.hidden = true
            if isFirstTimeFollow {
                isFollowing = true
                isFirstTimeFollow = false
            }
        }
        
        //更新地图
        if currentPosition[2] == 0.0 {
            self.mapView.changemap(UIImage(named: "B1"))
            currentmap = 0
            self.mapView.removeAnnotations()
            if isFollowing || isFirstTimeB1 {
                mapViewOffSet()
                isFirstTimeB1 = false
                isFirstTimeF1 = true
                isFirstTimeF2 = true
            } else {
                button.hidden = false
            }
        } else if (currentPosition[2] == 1.0) {
            self.mapView.changemap(UIImage(named: "F1"))
            currentmap = 1
            if isFollowing || isFirstTimeF1 {
                mapViewOffSet()
                isFirstTimeB1 = true
                isFirstTimeF1 = false
                isFirstTimeF2 = true
            } else {
                button.hidden = false
            }
        } else if(currentPosition[2] == 2.0){
            self.mapView.changemap(UIImage(named: "F2"))
            currentmap = 2
            if isFollowing || isFirstTimeF2 {
                mapViewOffSet()
                isFirstTimeB1 = true
                isFirstTimeF1 = true
                isFirstTimeF2 = false
            } else {
                button.hidden = false
            }
        } else{
            self.mapView.changemap(UIImage(named: "wait"))
            currentmap = 3
            if isFollowing {
                mapViewOffSet()
            }
        }
        
        
        //在地图上更新当前位置
        self.mapView.removeCurrentAnnotation(current)
        let currentPin: NAPinAnnotation = NAPinAnnotation(point: CGPointMake(CGFloat(currentPosition[0]), CGFloat(currentPosition[1])))
        current = currentPin
        self.mapView.addCurrentAnnotation(current, animated: false)
        
        zoom = Double(self.mapView.zoomScale)
        self.mapView.addshowRouteView()
        
        if currentPosition[2] == 0.0 && currentPosition[1] < 1190.0 {
            if ifHasAlert2 == false {
                let alertView = UIAlertView()
                alertView.delegate=self
                alertView.title = "警告！"
                alertView.message = "您已经离开本机场！"
                alertView.addButtonWithTitle("知道了")
                alertView.show()
                ifHasAlert2 = true
            } else {
                timeStop2++
                if timeStop2 == 30 {
                    let alertView = UIAlertView()
                    alertView.delegate = self
                    alertView.title = "警告！"
                    alertView.message = "您已经离开本机场！"
                    alertView.addButtonWithTitle("知道了")
                    alertView.show()
                    ifHasAlert2 = true
                    timeStop2 = 0
                }
            }
        }
        
        if currentPosition[2] == 0.0 {
            if currentPosition[0] * currentPosition[0] + (currentPosition[1] - 1270) * (currentPosition[1] - 1270) <= 391 * 391 {
                
                if ifHasAlert2 == false {
                    let alertView = UIAlertView()
                    alertView.delegate=self
                    alertView.title = "警告！"
                    alertView.message = "您已经离开本机场！"
                    alertView.addButtonWithTitle("知道了")
                    alertView.show()
                    ifHasAlert2 = true
                } else {
                    timeStop2++
                    if timeStop2 == 30 {
                        let alertView = UIAlertView()
                        alertView.delegate = self
                        alertView.title = "警告！"
                        alertView.message = "您已经离开本机场！"
                        alertView.addButtonWithTitle("知道了")
                        alertView.show()
                        ifHasAlert2 = true
                        timeStop2 = 0
                    }
                }
                
            }
            
            if (currentPosition[0] - 1928) * (currentPosition[0] - 1928) + (currentPosition[1] - 1270) * (currentPosition[1] - 1270) <= 391 * 391 {
                
                if ifHasAlert2 == false {
                    let alertView = UIAlertView()
                    alertView.delegate=self
                    alertView.title = "警告！"
                    alertView.message = "您已经离开本机场！"
                    alertView.addButtonWithTitle("知道了")
                    alertView.show()
                    ifHasAlert2 = true
                } else {
                    timeStop2++
                    if timeStop2 == 30 {
                        let alertView = UIAlertView()
                        alertView.delegate = self
                        alertView.title = "警告！"
                        alertView.message = "您已经离开本机场！"
                        alertView.addButtonWithTitle("知道了")
                        alertView.show()
                        ifHasAlert2 = true
                        timeStop2 = 0
                    }
                }
                
            }
        }
        
        
        //在地图上更新destination点的图标
        for item in destinationPin {
            self.mapView.removeCurrentAnnotation(item)
        }
        destinationPin.removeAll(keepCapacity: false)
        for item in destinations {
            if(item.5 == Int(currentPosition[2])) {
                let singleDestinationPin: NAPinAnnotation = NAPinAnnotation(point: CGPointMake(CGFloat(item.3), CGFloat(item.4)))
                singleDestinationPin.title = item.0
                singleDestinationPin.subtitle = item.1
                destinationPin.append(singleDestinationPin)
            }
        }
        
        for item in destinationPin {
            self.mapView.addAnnotation(item, animated: false)
        }
        
        
        
        //地图偏移
        if isFollowing {
            mapViewOffSet()
        }
        
        
        let getdata = GetDataFromDataModel()
        getdata.pause()
        
        
        //检测当前位置和destination距离，距离过小则说明已到达该目的点，将其从目的点数组中删除
        var i = 0
        let destinationCount = destinations.count
        for(i=0; i<destinations.count; ++i){
            if(destinations[i].5 == Int(currentPosition[2])){
                let distancex = (destinations[i].3 - Int(currentPosition[0]))*(destinations[i].3 - Int(currentPosition[0]))
                let distancey = (destinations[i].4 - Int(currentPosition[1]))*(destinations[i].4 - Int(currentPosition[1]))
                let distance = distancex + distancey
            
                if(distance < 8000){
                    destinations.removeAtIndex(i)
                    if(destinations.count == 0) {
                        let alertView = UIAlertView()
                        alertView.delegate=self
                        alertView.title = "到啦!"
                        alertView.message = "您已到达目的地！"
                        alertView.addButtonWithTitle("确定")
                        if notificationModeRow == 0 {
                            let audioPlayer : AVAudioPlayer? = nil
                            AudioServicesPlaySystemSound(1106)
                            audioPlayer?.play()
                        }
                        alertView.show()
                        totalRoute.removeAll(keepCapacity: false)
                        isFirstTimeFollow = true
                        
                    }
                }
            }
        }
        

        if (destinationCount != destinations.count) {
            let newRoute = GetDataFromDataModel()
            newRoute.totalRouteMake()
        }
        
        distance()
        showDistance()
        //在地图上重新画出规划路线
        self.mapView.setNeedsDisplay()
        
        

    }
    
    func distance() {    //算出到目的地的距离
        
        //两个向量，用于判断当前位置到下一路径点的距离
        var vector1 = [0.0, 0.0]
        var vector2 = [0.0, 0.0]
        //当前位置到下一路径点的距离
        var curDistance : Double = 0.0
        //用于判断角度
        var vectorMultiply : Double = 0.0
        //两个路径点间的距离
        var twoDistance : Double = 0.0
        
        totalDistance = 0.0
        
        if totalRoute.count > 1 {
            curDistance = 0.0
            vector1 = [Double(nodeData[totalRoute[0]]!.xPosition) - currentPosition[0], Double(nodeData[totalRoute[0]]!.yPosition) - currentPosition[1]]
            vector2 = [Double(nodeData[totalRoute[1]]!.xPosition) - currentPosition[0], Double(nodeData[totalRoute[1]]!.yPosition) - currentPosition[1]]
            vectorMultiply = vector1[0] * vector2[0] + vector1[1] * vector2[1]
            if vectorMultiply > 0 {
                twoDistance = (currentPosition[0] - Double(nodeData[totalRoute[0]]!.xPosition)) * (currentPosition[0] - Double(nodeData[totalRoute[0]]!.xPosition))
                twoDistance += (currentPosition[1] - Double(nodeData[totalRoute[0]]!.yPosition)) * (currentPosition[1] - Double(nodeData[totalRoute[0]]!.yPosition))
                curDistance += sqrt(twoDistance) * 0.2
                
                for var i = 0; i < totalRoute.count - 1; i++ {
                    twoDistance = Double(nodeData[totalRoute[i]]!.xPosition - nodeData[totalRoute[i+1]]!.xPosition) * Double(nodeData[totalRoute[i]]!.xPosition - nodeData[totalRoute[i+1]]!.xPosition)
                    twoDistance += Double(nodeData[totalRoute[i]]!.yPosition - nodeData[totalRoute[i+1]]!.yPosition) * Double(nodeData[totalRoute[i]]!.yPosition - nodeData[totalRoute[i+1]]!.yPosition)
                    totalDistance += sqrt(twoDistance) * 0.2
                }
                totalDistance += curDistance
            } else {
                twoDistance = (currentPosition[0] - Double(nodeData[totalRoute[1]]!.xPosition)) * (currentPosition[0] - Double(nodeData[totalRoute[1]]!.xPosition))
                twoDistance += (currentPosition[1] - Double(nodeData[totalRoute[1]]!.yPosition)) * (currentPosition[1] - Double(nodeData[totalRoute[1]]!.yPosition))
                curDistance += sqrt(twoDistance) * 0.2
                
                for var i = 1; i < totalRoute.count - 1; i++ {
                    twoDistance = Double(nodeData[totalRoute[i]]!.xPosition - nodeData[totalRoute[i+1]]!.xPosition) * Double(nodeData[totalRoute[i]]!.xPosition - nodeData[totalRoute[i+1]]!.xPosition)
                    twoDistance += Double(nodeData[totalRoute[i]]!.yPosition - nodeData[totalRoute[i+1]]!.yPosition) * Double(nodeData[totalRoute[i]]!.yPosition - nodeData[totalRoute[i+1]]!.yPosition)
                    totalDistance += sqrt(twoDistance) * 0.2
                }
                totalDistance += curDistance
            }
        }
    }
    
    func showDistance() {   //显示距离显示框
        if(totalRoute.count<=1) {
            label.text = "即将到达目的地"
        }
        else {
            label.text = " 距离" + String(stringInterpolationSegment: Int(totalDistance)) + "米，约" + String(stringInterpolationSegment: Int(totalDistance/83 + 1)) + "分钟  "
        }
        
        label.backgroundColor = UIColor.clearColor()
        label.textColor = UIColor.yellowColor()
        label.layer.cornerRadius = 10
        label.layer.borderWidth = 2
        label.layer.borderColor = UIColor.yellowColor().CGColor
        label.textAlignment = NSTextAlignment.Center
        label.numberOfLines = 1
        label.adjustsFontSizeToFitWidth = true
        self.view.addSubview(label)
    }
}
