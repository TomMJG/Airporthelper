//
//  GetDataFromDataModel.swift
//  UserInterfaceGoldMasterVersion
//
//  Created by Fantask on 4/26/15.
//  Copyright (c) 2015 Fantask. All rights reserved.
//


//import UIKit
import AVFoundation

//从程序数据库中获取数据、计算路径
class GetDataFromDataModel: UIViewController {
   
    var audioPlayer : AVAudioPlayer? = nil
    
    var start = 0
    var end = 0

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func pause() {      //起延时作用
        for var i = 0; i<100; ++i {
            
        }
    }
    
    //初始化数据
    func initdata() {
        var i = 1
        while i <= 255 {
            fatherNodeFromStart.append(0)
            fatherNodeFromEnd.append(0)
            distanceFromStart.append(0)
            distanceFromEnd.append(0)
            i++
        }
        
    }
    
    //查找区号
    func getAreaNumber() -> Int {
        switch currentPosition[2]{
        case 0.0:
            return 42
        case 1.0:
            for (areaNumber, area) in areaDictionary1 {
                
                switch (currentPosition[0],currentPosition[1]) {
                case (Double(area.leftUpX)...Double(area.rightBoX), Double(area.leftUpY)...Double(area.rightBoY)):
                    if area.number < 25 {
                        return area.number
                    }
                default:
                    break
                }
                
            }
            for (areaNumber, area) in areaDictionary2 {
                switch (currentPosition[0],currentPosition[1]) {
                case (Double(area.leftUpX1)...Double(area.rightBoX1), Double(area.leftUpY1)...Double(area.rightBoY1)):
                    if area.number < 25 {
                        return area.number
                    }
                case (Double(area.leftUpX2)...Double(area.rightBoX2), Double(area.leftUpY2)...Double(area.rightBoY2)):
                    if area.number < 25 {
                        return area.number
                    }
                default:
                    if currentPosition[0] * currentPosition[0] + (currentPosition[1]-1270) * (currentPosition[1]-1270) <= 391 * 391 {
                        return 16
                    } else if (currentPosition[0]-1928) * (currentPosition[0]-1928) + (currentPosition[1]-1270) * (currentPosition[1]-1270) <= 391 * 391 {
                        return 18
                    } else {
                        break
                    }
                    
                    
                }
            }
            
            for (areaNumber, area) in areaDictionary4 {
                switch (currentPosition[0],currentPosition[1]) {
                case (Double(area.leftUpX)...Double(area.rightBoX), Double(area.leftUpY)...Double(area.rightBoY)):
                    if area.number < 25 {
                        return area.number
                    }
                default:
                    if area.number < 25 {
                        if currentPosition[0] < 900 {
                            return 19
                        } else {
                            return 21
                        }
                    }
                }
                
            }
            
        case 2.0:
            
            for(areaNumber, area) in areaDictionary1 {
                switch (currentPosition[0], currentPosition[1]) {
                case (Double(area.leftUpX)...Double(area.rightBoX), Double(area.leftUpY)...Double(area.rightBoY)):
                    if area.number > 24 && area.number != 42 {
                        return area.number
                    }
                default:
                    break
                }
            }
            
            for(areaNumber, area) in areaDictionary3 {
                
                switch (currentPosition[0], currentPosition[1]) {
                case (Double(area.leftUpX1)...Double(area.rightBoX1), Double(area.leftUpY1)...Double(area.rightBoY1)):
                    if area.number > 24 {
                        return area.number
                    }
                case (Double(area.leftUpX2)...Double(area.rightBoX2), Double(area.leftUpY2)...Double(area.rightBoY2)):
                    if area.number > 24 {
                        return area.number
                    }
                default:
                    var a = 0
                }
            }
            
            for(areaNumber, area) in areaDictionary4 {
                switch (currentPosition[0], currentPosition[1]) {
                case (Double(area.leftUpX)...Double(area.rightBoX), Double(area.leftUpY)...Double(area.rightBoY)):
                    if area.number > 24 {
                        return area.number
                    }
                default:
                    if currentPosition[0] * currentPosition[0] + (currentPosition[1]-1270) * (currentPosition[1]-1270) > 391 * 391 {
                        if currentPosition[0] <= 391  && currentPosition[1] < 1661 {
                            return 36
                        } else {
                            if (currentPosition[0]-1928) * (currentPosition[0]-1928) + (currentPosition[1]-1270) * (currentPosition[1]-1270) > 391 * 391 {
                                if currentPosition[0] >=  1304  && currentPosition[1] < 1661 {
                                    return 38
                                }
                            }
                        }
                    }
                }
            }
            
            for (areaNumber, area) in areaDictionary5 {
                switch (currentPosition[0], currentPosition[1]) {
                case (Double(area.leftUpX)...Double(area.rightBoX), Double(area.leftUpY)...Double(area.rightBoY)):
                    if area.number > 24 {
                        return area.number
                    }
                default :
                    if currentPosition[0] * currentPosition[0] + (currentPosition[1]-1270) * (currentPosition[1]-1270) < 391 * 391 {
                        return 33
                    } else {
                        return 35
                    }
                }
            }
            
        default:

            return -1;
        }
        
        return -1;
    }
    
    
    //寻找附近的点，遍历当前区域与相邻区域
    func findNearby() -> [String] {
        var entityString = [String]()
        let currentArea = getAreaNumber()
        entityString += findEntityInArea(currentArea)
       
        if currentArea == 16 {
        
            for neararea in areaNumber16.nearAreaArray {
                entityString += findEntityInArea(neararea)
            }
       
        } else if currentArea == 18 {
       
            for neararea in areaNumber18.nearAreaArray {
                entityString += findEntityInArea(neararea)
            }
      
        } else if currentArea == 27 {
      
            for neararea in areaNumber27.nearAreaArray {
                entityString += findEntityInArea(neararea)
            }
      
        } else if currentArea == 25 {
      
            for neararea in areaNumber25.nearAreaArray {
                entityString += findEntityInArea(neararea)
            }
     
        } else if currentArea == 19 {
     
            for neararea in areaNumber19.nearAreaArray {
                entityString += findEntityInArea(neararea)
            }
      
        } else if currentArea == 33 {
      
            for neararea in areaNumber33.nearAreaArray {
                entityString += findEntityInArea(neararea)
            }
      
        } else if currentArea == 35 {
      
            for neararea in areaNumber35.nearAreaArray {
                entityString += findEntityInArea(neararea)
            }
      
        } else if currentArea == 36 {
       
            for neararea in areaNumber36.nearAreaArray {
                entityString += findEntityInArea(neararea)
            }
      
        } else if currentArea == 38 {
       
            for neararea in areaNumber38.nearAreaArray {
                entityString += findEntityInArea(neararea)
            }
       
        } else if currentArea == 21 {
     
            for neararea in areaNumber21.nearAreaArray {
                entityString += findEntityInArea(neararea)
            }
        
        } else if currentArea == 42{
            
        } else {
         
            for (areaNumber, area) in areaDictionary1 {
                if areaNumber == currentArea{
                    for nearArea in area.nearAreaArray {
                        entityString += findEntityInArea(nearArea)
                    }
                }
        
            }
        }
        
        return entityString
    }
    
    //某个区域内的entity
    func findEntityInArea(areanum : Int) -> [String] {
        let currentArea = areanum
        var routeNode = [String]()
        var xdistance : Double = 0.0
        var ydistance : Double = 0.0
        if currentArea == 16 {
            for entity in areaNumber16.includeEntityArray {
                xdistance = Double(entity.x) - currentPosition[0]
                ydistance = Double(entity.y) - currentPosition[1]
                if xdistance * xdistance + ydistance * ydistance < 3000000 {   //找附近 附近范围
                    routeNode.insert(entity.title, atIndex: routeNode.count)
                }            }
            for area in areaNumber16.nearAreaArray {
                
            }
        } else if currentArea == 18 {
            for entity in areaNumber18.includeEntityArray {
                xdistance = Double(entity.x) - currentPosition[0]
                ydistance = Double(entity.y) - currentPosition[1]
                if xdistance * xdistance + ydistance * ydistance < 3000000 {
                    routeNode.insert(entity.title, atIndex: routeNode.count)
                }
            }
        } else if currentArea == 25 {
            for entity in areaNumber25.includeEntityArray {
                xdistance = Double(entity.x) - currentPosition[0]
                ydistance = Double(entity.y) - currentPosition[1]
                if xdistance * xdistance + ydistance * ydistance < 3000000 {
                    routeNode.insert(entity.title, atIndex: routeNode.count)
                }
                
            }
        } else if currentArea == 27 {
            for entity in areaNumber27.includeEntityArray{
                xdistance = Double(entity.x) - currentPosition[0]
                ydistance = Double(entity.y) - currentPosition[1]
                if xdistance * xdistance + ydistance * ydistance < 3000000 {
                    routeNode.insert(entity.title, atIndex: routeNode.count)
                }
            }
        } else if currentArea == 19 {
            for entity in areaNumber19.includeEntityArray{
                xdistance = Double(entity.x) - currentPosition[0]
                ydistance = Double(entity.y) - currentPosition[1]
                if xdistance * xdistance + ydistance * ydistance < 3000000 {
                    routeNode.insert(entity.title, atIndex: routeNode.count)
                }
                
            }
        } else if currentArea == 21 {
            for entity in areaNumber21.includeEntityArray {
                xdistance = Double(entity.x) - currentPosition[0]
                ydistance = Double(entity.y) - currentPosition[1]
                if xdistance * xdistance + ydistance * ydistance < 3000000 {
                    routeNode.insert(entity.title, atIndex: routeNode.count)
                }
            }
        } else if currentArea == 33 {
            for entity in areaNumber33.includeEntityArray {
                xdistance = Double(entity.x) - currentPosition[0]
                ydistance = Double(entity.y) - currentPosition[1]
                if xdistance * xdistance + ydistance * ydistance < 3000000 {
                    routeNode.insert(entity.title, atIndex: routeNode.count)
                }
            }
        } else if currentArea == 35 {
            for entity in areaNumber35.includeEntityArray {
                xdistance = Double(entity.x) - currentPosition[0]
                ydistance = Double(entity.y) - currentPosition[1]
                if xdistance * xdistance + ydistance * ydistance < 3000000 {
                    routeNode.insert(entity.title, atIndex: routeNode.count)
                }
            }
        } else if currentArea == 36 {
            for entity in areaNumber36.includeEntityArray {
                xdistance = Double(entity.x) - currentPosition[0]
                ydistance = Double(entity.y) - currentPosition[1]
                if xdistance * xdistance + ydistance * ydistance < 3000000 {
                    routeNode.insert(entity.title, atIndex: routeNode.count)
                }
            }
        } else if currentArea == 38 {
            for entity in areaNumber38.includeEntityArray {
                xdistance = Double(entity.x) - currentPosition[0]
                ydistance = Double(entity.y) - currentPosition[1]
                if xdistance * xdistance + ydistance * ydistance < 3000000 {
                    routeNode.insert(entity.title, atIndex: routeNode.count)
                }
            }
        } else {
            for (areaNumber, area) in areaDictionary1 {
                if areaNumber == currentArea {
                    for entity in area.includeEntityArray {
                        xdistance = Double(entity.x) - currentPosition[0]
                        ydistance = Double(entity.y) - currentPosition[1]
                        if xdistance * xdistance + ydistance * ydistance < 3000000 {
                            routeNode.insert(entity.title, atIndex: routeNode.count)
                        }
                    }
                }
            }
        }
        
        return routeNode
    }
    
    
    //找到离当前位置距离最近的路径点
    
    func findNearRouteNode() -> Int {
        
        let currentArea = getAreaNumber()
        var nearRouteNode = (title:"", subtitle:"", description:"", x:0, y:0, z:0, relatenode:0, Secondrelatenode: 0)
        var distance = 100000000.0
        var xdistance = 0.0
        var ydistance = 0.0
        var nodeNumber = 0
        var otherNodeNumber = 0
        var otherdistance = 0.0
        nodeNumber = findNearRouteNodeOneArea(currentArea)
        if nodeNumber != 0 {
            xdistance = Double(nodeData[nodeNumber]!.xPosition) - currentPosition[0]
            ydistance = Double(nodeData[nodeNumber]!.yPosition) - currentPosition[1]
            distance = xdistance * xdistance + ydistance * ydistance
        }
            
        for (area, neararea) in nearAreaDictionary {
            if area == currentArea {
                for nearAreaNum in neararea {
                    if (nearAreaNum > 0) {
                        otherNodeNumber = findNearRouteNodeOneArea(nearAreaNum)
                        xdistance = Double(nodeData[otherNodeNumber]!.xPosition) - currentPosition[0]
                        ydistance = Double(nodeData[otherNodeNumber]!.yPosition) - currentPosition[1]
                        otherdistance = xdistance * xdistance + ydistance * ydistance
                        if otherdistance < distance {
                            nodeNumber = otherNodeNumber
                        }
                    }
                    
                }
            }
        }
        
        return nodeNumber
        
        
    }
    
    func findNearRouteNodeOneArea(areaNum : Int) -> Int {
        
        let currentArea = areaNum
        var nearRouteNode = (title:"", subtitle:"", description:"", x:0, y:0, z:0, relatenode:0, Secondrelatenode: 0)
        var distance = 100000000.0
        var xdistance = 0.0
        var ydistance = 0.0
        var nodeNumber = 0
        if currentArea == 16 {
            for arrayelement in areaNumber16.includeNodeArray {
                xdistance = Double(nodeData[arrayelement]!.xPosition) - currentPosition[0]
                ydistance = Double(nodeData[arrayelement]!.yPosition) - currentPosition[1]
                if xdistance * xdistance + ydistance * ydistance < distance   {
                    distance = xdistance * xdistance + ydistance * ydistance
                    nodeNumber = nodeData[arrayelement]!.number
                }
            }
        } else if currentArea == 18 {
            for arrayelement in areaNumber18.includeNodeArray {
                xdistance = Double(nodeData[arrayelement]!.xPosition) - currentPosition[0]
                ydistance = Double(nodeData[arrayelement]!.yPosition) - currentPosition[1]
                if xdistance * xdistance + ydistance * ydistance < distance {
                    distance = xdistance * xdistance + ydistance * ydistance
                    nodeNumber = nodeData[arrayelement]!.number
                }
            }
        } else if currentArea == 25 {
            for arrayelement in areaNumber25.includeNodeArray {
                xdistance = Double(nodeData[arrayelement]!.xPosition) - currentPosition[0]
                ydistance = Double(nodeData[arrayelement]!.yPosition) - currentPosition[1]
                if xdistance * xdistance + ydistance * ydistance < distance {
                    distance = xdistance * xdistance + ydistance * ydistance
                    nodeNumber = nodeData[arrayelement]!.number
                }
            }
        } else if currentArea == 27 {
            for arrayelement in areaNumber27.includeNodeArray {
                xdistance = Double(nodeData[arrayelement]!.xPosition) - currentPosition[0]
                ydistance = Double(nodeData[arrayelement]!.yPosition) - currentPosition[1]
                if xdistance * xdistance + ydistance * ydistance < distance {
                    distance = xdistance * xdistance + ydistance * ydistance
                    nodeNumber = nodeData[arrayelement]!.number
                }
            }
        } else if currentArea == 19 {
            for arrayelement in areaNumber19.includeNodeArray {
                xdistance = Double(nodeData[arrayelement]!.xPosition) - currentPosition[0]
                ydistance = Double(nodeData[arrayelement]!.yPosition) - currentPosition[1]
                if xdistance * xdistance + ydistance * ydistance < distance {
                    distance = xdistance * xdistance + ydistance * ydistance
                    nodeNumber = nodeData[arrayelement]!.number
                }
            }
        } else if currentArea == 21  {
            for arrayelement in areaNumber21.includeNodeArray {
                xdistance = Double(nodeData[arrayelement]!.xPosition) - currentPosition[0]
                ydistance = Double(nodeData[arrayelement]!.yPosition) - currentPosition[1]
                if xdistance * xdistance + ydistance * ydistance < distance {
                    distance = xdistance * xdistance + ydistance * ydistance
                    nodeNumber = nodeData[arrayelement]!.number
                }
            }
        } else if currentArea == 33 {
            for arrayelement in areaNumber33.includeNodeArray{
                xdistance = Double(nodeData[arrayelement]!.xPosition) - currentPosition[0]
                ydistance = Double(nodeData[arrayelement]!.yPosition) - currentPosition[1]
                if xdistance * xdistance + ydistance * ydistance < distance {
                    distance = xdistance * xdistance + ydistance * ydistance
                    nodeNumber = nodeData[arrayelement]!.number
                }
            }
        } else if currentArea == 35 {
            for arrayelement in areaNumber35.includeNodeArray {
                xdistance = Double(nodeData[arrayelement]!.xPosition) - currentPosition[0]
                ydistance = Double(nodeData[arrayelement]!.yPosition) - currentPosition[1]
                if xdistance * xdistance + ydistance * ydistance < distance {
                    distance = xdistance * xdistance + ydistance * ydistance
                    nodeNumber = nodeData[arrayelement]!.number
                }
            }
        } else if currentArea == 36 {
            for arrayelement in areaNumber36.includeNodeArray {
                xdistance = Double(nodeData[arrayelement]!.xPosition) - currentPosition[0]
                ydistance = Double(nodeData[arrayelement]!.yPosition) - currentPosition[1]
                if xdistance * xdistance + ydistance * ydistance < distance {
                    distance = xdistance * xdistance + ydistance * ydistance
                    nodeNumber = nodeData[arrayelement]!.number
                }
            }
        } else if currentArea == 38 {
            for arrayelement in areaNumber38.includeNodeArray {
                xdistance = Double(nodeData[arrayelement]!.xPosition) - currentPosition[0]
                ydistance = Double(nodeData[arrayelement]!.yPosition) - currentPosition[1]
                if xdistance * xdistance + ydistance * ydistance < distance {
                    distance = xdistance * xdistance + ydistance * ydistance
                    nodeNumber = nodeData[arrayelement]!.number
                }
            }
        } else if currentArea == 42 {
            for arrayelement in areaNumber42.includeNodeArray {
                xdistance = Double(nodeData[arrayelement]!.xPosition) - currentPosition[0]
                ydistance = Double(nodeData[arrayelement]!.yPosition) - currentPosition[1]
                if xdistance * xdistance + ydistance * ydistance < distance {
                    distance = xdistance * xdistance + ydistance * ydistance
                    nodeNumber = nodeData[arrayelement]!.number
                }
            }
        }
        else {
            for (areaNumber, area) in areaDictionary1 {
                if areaNumber == currentArea {
                    for arrayelement in area.includeNodeArray {
                        xdistance = Double(nodeData[arrayelement]!.xPosition) - currentPosition[0]
                        ydistance = Double(nodeData[arrayelement]!.yPosition) - currentPosition[1]
                        if xdistance * xdistance + ydistance * ydistance < distance {
                            distance = xdistance * xdistance + ydistance * ydistance
                            nodeNumber = nodeData[arrayelement]!.number
                        }
                    }
                }
            }
        }
        
        return nodeNumber
        
    }
    
    //两个路径点之间进行路径规划
    func unitRouteMake() {
        
        route.removeAll(keepCapacity: false)
        
        var flagwhich = 0
        var ifend = false
        let queuestart1 =  NSQueue()
        let queuestart2 = NSQueue()
        let queueend1 = NSQueue()
        let queueend2 = NSQueue()
        let queuestore = NSQueue()
        var currentRange = 0
        let addRange = 200
        var meetNode = 0
        var ifstartelec = false
        var ifendelec = false
        
        for (key, value) in elevatorDictionary {
            if value.relateroutenode == start {
                ifstartelec = true
            }
        }
        for (key, value) in elevatorDictionary {
            if value.relateroutenode == end {
                ifendelec = true
            }
        }
        
        if (ifendelec == true && ifstartelec == true) {
            
            route.append(start)
            route.append(end)
            
        } else {
        
            queuestart1.enqueue(start)
            queueend1.enqueue(end)
            queuestore.enqueue(start)
            queuestore.enqueue(end)
            fatherNodeFromStart[nodeData[start]!.number] = start
            fatherNodeFromEnd[nodeData[end]!.number] = end
        
            while ifend == false {
                currentRange += addRange
                if flagwhich == 0 {
                    flagwhich = 1
                    while queuestart1.count() != 0 {
                        if ifend == true {
                            break
                        }
                        var ifNeedInsert = false
                        let node = queuestart1.dequeue()
                        if(fatherNodeFromEnd[node] != 0) {   //处理点到达终点
                            ifend = true
                            meetNode = node
                            break
                        }
                        if nodeData[node]!.left != 0 {
                            if fatherNodeFromStart[nodeData[nodeData[node]!.left]!.number] == 0 {  //处理左边
                                if distanceFromStart[nodeData[node]!.number] + nodeData[node]!.xPosition - nodeData[nodeData[node]!.left]!.xPosition < currentRange {
                                    queuestart2.enqueue(nodeData[node]!.left)
                                    queuestore.enqueue(nodeData[node]!.left)
                                    fatherNodeFromStart[nodeData[nodeData[node]!.left]!.number] = node
                                    distanceFromStart[nodeData[nodeData[node]!.left]!.number] = distanceFromStart[nodeData[node]!.number] + abs(nodeData[node]!.xPosition - nodeData[nodeData[node]!.left]!.xPosition + nodeData[node]!.yPosition - nodeData[nodeData[node]!.left]!.yPosition)
                                } else {
                                    ifNeedInsert = true
                                }
                            }
                        }
                        if nodeData[node]!.right != 0 {
                            if fatherNodeFromStart[nodeData[nodeData[node]!.right]!.number] == 0 {  //处理右边
                                if distanceFromStart[nodeData[node]!.number] - nodeData[node]!.xPosition + nodeData[nodeData[node]!.right]!.xPosition < currentRange {
                                    queuestart2.enqueue(nodeData[node]!.right)
                                    queuestore.enqueue(nodeData[node]!.right)
                                    fatherNodeFromStart[nodeData[nodeData[node]!.right]!.number] = node
                                    distanceFromStart[nodeData[nodeData[node]!.right]!.number] = distanceFromStart[nodeData[node]!.number] - nodeData[node]!.xPosition + nodeData[nodeData[node]!.right]!.xPosition
                                } else {
                                    ifNeedInsert = true
                                }
                            }
                        }
                        if nodeData[node]!.bottom != 0 {
                            if fatherNodeFromStart[nodeData[nodeData[node]!.bottom]!.number] == 0 {
                                if distanceFromStart[nodeData[node]!.number] + nodeData[nodeData[node]!.bottom]!.yPosition - nodeData[node]!.yPosition < currentRange {   //在处理范围内
                                    queuestart2.enqueue(nodeData[node]!.bottom)
                                    queuestore.enqueue(nodeData[node]!.bottom)
                                    fatherNodeFromStart[nodeData[nodeData[node]!.bottom]!.number] = node
                                    distanceFromStart[nodeData[nodeData[node]!.bottom]!.number] = distanceFromStart[nodeData[node]!.number] + nodeData[nodeData[node]!.bottom]!.yPosition - nodeData[node]!.yPosition
                                } else {
                                    ifNeedInsert = true
                                }
                            }
                        }
                        if nodeData[node]!.top != 0 {
                            if fatherNodeFromStart[nodeData[nodeData[node]!.top]!.number] == 0{
                                if distanceFromStart[nodeData[node]!.number] - nodeData[nodeData[node]!.top]!.yPosition + nodeData[node]!.yPosition < currentRange {   //在处理范围内
                                    queuestart2.enqueue(nodeData[node]!.top)
                                    queuestore.enqueue(nodeData[node]!.top)
                                    fatherNodeFromStart[nodeData[nodeData[node]!.top]!.number] = node
                                    distanceFromStart[nodeData[nodeData[node]!.top]!.number] = distanceFromStart[nodeData[node]!.number] - nodeData[nodeData[node]!.top]!.yPosition + nodeData[node]!.yPosition
                                } else {
                                    ifNeedInsert = true
                                }
                            }
                        }
                        if ifNeedInsert == true {
                            queuestart2.enqueue(node)
                        }
                    
                    
                    }
                    while queueend1.count() != 0 {
                        if ifend == true {
                            break
                        }
                        var ifNeedInsert = false
                        let node = queueend1.dequeue()
                        if fatherNodeFromStart[node] != 0 {   //处理点到达终点
                            ifend = true
                            meetNode = node
                            break
                        }
                        if nodeData[node]!.left != 0 {
                            if fatherNodeFromEnd[nodeData[nodeData[node]!.left]!.number] == 0 {  //处理左边
                                if distanceFromEnd[nodeData[node]!.number] + nodeData[node]!.xPosition - nodeData[nodeData[node]!.left]!.xPosition < currentRange {
                                    queueend2.enqueue(nodeData[node]!.left)
                                    queuestore.enqueue(nodeData[node]!.left)
                                    fatherNodeFromEnd[nodeData[nodeData[node]!.left]!.number] = node
                                    distanceFromEnd[nodeData[nodeData[node]!.left]!.number] = distanceFromEnd[nodeData[node]!.number] + nodeData[node]!.xPosition - nodeData[nodeData[node]!.left]!.xPosition
                                } else {
                                    ifNeedInsert = true
                                }
                            }
                        }
                        if nodeData[node]!.right != 0 {
                            if fatherNodeFromEnd[nodeData[nodeData[node]!.right]!.number] == 0 {  //处理右边
                                if distanceFromEnd[nodeData[node]!.number] - nodeData[node]!.xPosition + nodeData[nodeData[node]!.right]!.xPosition < currentRange {
                                    queueend2.enqueue(nodeData[node]!.right)
                                    queuestore.enqueue(nodeData[node]!.right)
                                    fatherNodeFromEnd[nodeData[nodeData[node]!.right]!.number] = node
                                    distanceFromEnd[nodeData[nodeData[node]!.right]!.number] = distanceFromEnd[nodeData[node]!.number] - nodeData[node]!.xPosition + nodeData[nodeData[node]!.right]!.xPosition
                                } else {
                                    ifNeedInsert = true
                                }
                            }
                        }
                        if nodeData[node]!.bottom != 0 {
                            if fatherNodeFromEnd[nodeData[nodeData[node]!.bottom]!.number] == 0 {
                                if distanceFromEnd[nodeData[node]!.number] + nodeData[nodeData[node]!.bottom]!.yPosition - nodeData[node]!.yPosition < currentRange {   //在处理范围内
                                    queueend2.enqueue(nodeData[node]!.bottom)
                                    queuestore.enqueue(nodeData[node]!.bottom)
                                    fatherNodeFromEnd[nodeData[nodeData[node]!.bottom]!.number] = node
                                    distanceFromEnd[nodeData[nodeData[node]!.bottom]!.number] = distanceFromEnd[nodeData[node]!.number] + nodeData[nodeData[node]!.bottom]!.yPosition - nodeData[node]!.yPosition
                                } else {
                                    ifNeedInsert = true
                                }
                            }
                        }
                        if nodeData[node]!.top != 0 {
                            if fatherNodeFromEnd[nodeData[nodeData[node]!.top]!.number] == 0 {
                                if distanceFromEnd[nodeData[node]!.number] - nodeData[nodeData[node]!.top]!.yPosition + nodeData[node]!.yPosition < currentRange {   //在处理范围内
                                    queueend2.enqueue(nodeData[node]!.top)
                                    queuestore.enqueue(nodeData[node]!.top)
                                    fatherNodeFromEnd[nodeData[nodeData[node]!.top]!.number] = node
                                    distanceFromEnd[nodeData[nodeData[node]!.top]!.number] = distanceFromEnd[nodeData[node]!.number] - nodeData[nodeData[node]!.top]!.yPosition + nodeData[node]!.yPosition
                                } else{
                                    ifNeedInsert = true
                                }
                            }
                        }
                        if ifNeedInsert == true {
                            queueend2.enqueue(node)
                        }
                    }
                
                } else {
                    flagwhich = 0
                    if ifend == true {
                        break
                    }
                    while queuestart2.count() != 0 {
                        var ifNeedInsert = false
                        let node = queuestart2.dequeue()
                        if fatherNodeFromEnd[node] != 0 {   //处理点到达终点
                            ifend = true
                            meetNode = node
                            break
                        }
                        if nodeData[node]!.left != 0 {
                            if fatherNodeFromStart[nodeData[nodeData[node]!.left]!.number] == 0 {  //处理左边
                                if distanceFromStart[nodeData[node]!.number] + nodeData[node]!.xPosition - nodeData[nodeData[node]!.left]!.xPosition < currentRange {
                                    queuestart1.enqueue(nodeData[node]!.left)
                                    queuestore.enqueue(nodeData[node]!.left)
                                    fatherNodeFromStart[nodeData[nodeData[node]!.left]!.number] = node
                                    distanceFromStart[nodeData[nodeData[node]!.left]!.number] = distanceFromStart[nodeData[node]!.number] + nodeData[node]!.xPosition - nodeData[nodeData[node]!.left]!.xPosition
                                } else {
                                    ifNeedInsert = true
                                }
                            }
                        }
                        if nodeData[node]!.right != 0 {
                            if fatherNodeFromStart[nodeData[nodeData[node]!.right]!.number] == 0 {  //处理右边
                                if distanceFromStart[nodeData[node]!.number] - nodeData[node]!.xPosition + nodeData[nodeData[node]!.right]!.xPosition < currentRange {
                                    queuestart1.enqueue(nodeData[node]!.right)
                                    queuestore.enqueue(nodeData[node]!.right)
                                    fatherNodeFromStart[nodeData[nodeData[node]!.right]!.number] = node
                                    distanceFromStart[nodeData[nodeData[node]!.right]!.number] = distanceFromStart[nodeData[node]!.number] - nodeData[node]!.xPosition + nodeData[nodeData[node]!.right]!.xPosition
                                } else {
                                    ifNeedInsert = true
                                }
                            }
                        }
                        if nodeData[node]!.bottom != 0 {
                            if fatherNodeFromStart[nodeData[nodeData[node]!.bottom]!.number] == 0 {
                                if distanceFromStart[nodeData[node]!.number] + nodeData[nodeData[node]!.bottom]!.yPosition - nodeData[node]!.yPosition < currentRange {   //在处理范围内
                                    queuestart1.enqueue(nodeData[node]!.bottom)
                                    queuestore.enqueue(nodeData[node]!.bottom)
                                    fatherNodeFromStart[nodeData[nodeData[node]!.bottom]!.number] = node
                                    distanceFromStart[nodeData[nodeData[node]!.bottom]!.number] = distanceFromStart[nodeData[node]!.number] + nodeData[nodeData[node]!.bottom]!.yPosition - nodeData[node]!.yPosition
                                } else {
                                    ifNeedInsert = true
                                }
                            }
                        }
                        if nodeData[node]!.top != 0 {
                            if fatherNodeFromStart[nodeData[nodeData[node]!.top]!.number] == 0 {
                                if distanceFromStart[nodeData[node]!.number] - nodeData[nodeData[node]!.top]!.yPosition + nodeData[node]!.yPosition < currentRange {   //在处理范围内
                                    queuestart1.enqueue(nodeData[node]!.top)
                                    queuestore.enqueue(nodeData[node]!.top)
                                    fatherNodeFromStart[nodeData[nodeData[node]!.top]!.number] = node
                                    distanceFromStart[nodeData[nodeData[node]!.top]!.number] = distanceFromStart[nodeData[node]!.number] - nodeData[nodeData[node]!.top]!.yPosition + nodeData[node]!.yPosition
                                } else{
                                    ifNeedInsert = true
                                }
                            }
                        }
                        if ifNeedInsert == true {
                            queuestart1.enqueue(node)
                        }
                    
                    
                    }
                    while queueend2.count() != 0 {
                        if ifend {
                            break
                        }
                        var ifNeedInsert = false
                        let node = queueend2.dequeue()
                        if fatherNodeFromStart[node] != 0 {   //处理点到达终点
                            ifend = true
                            meetNode = node
                            break
                        }
                        if nodeData[node]!.left != 0 {
                            if fatherNodeFromEnd[nodeData[nodeData[node]!.left]!.number] == 0 {  //处理左边
                                if distanceFromEnd[nodeData[node]!.number] + nodeData[node]!.xPosition - nodeData[nodeData[node]!.left]!.xPosition < currentRange {
                                    queueend1.enqueue(nodeData[node]!.left)
                                    queuestore.enqueue(nodeData[node]!.left)
                                    fatherNodeFromEnd[nodeData[nodeData[node]!.left]!.number] = node
                                    distanceFromEnd[nodeData[nodeData[node]!.left]!.number] = distanceFromEnd[nodeData[node]!.number] + nodeData[node]!.xPosition - nodeData[nodeData[node]!.left]!.xPosition
                                } else {
                                    ifNeedInsert = true
                                }
                            }
                        }
                        if nodeData[node]!.right != 0 {
                            if fatherNodeFromEnd[nodeData[nodeData[node]!.right]!.number] == 0 {  //处理右边
                                if distanceFromEnd[nodeData[node]!.number] - nodeData[node]!.xPosition + nodeData[nodeData[node]!.right]!.xPosition < currentRange {
                                    queueend1.enqueue(nodeData[node]!.right)
                                    queuestore.enqueue(nodeData[node]!.right)
                                    fatherNodeFromEnd[nodeData[nodeData[node]!.right]!.number] = node
                                    distanceFromEnd[nodeData[nodeData[node]!.right]!.number] = distanceFromEnd[nodeData[node]!.number] - nodeData[node]!.xPosition + nodeData[nodeData[node]!.right]!.xPosition
                                } else {
                                    ifNeedInsert = true
                                }
                            }
                        }
                        if nodeData[node]!.bottom != 0 {
                            if fatherNodeFromEnd[nodeData[nodeData[node]!.bottom]!.number] == 0 {
                                if distanceFromEnd[nodeData[node]!.number] + nodeData[nodeData[node]!.bottom]!.yPosition - nodeData[node]!.yPosition < currentRange {   //在处理范围内
                                    queueend1.enqueue(nodeData[node]!.bottom)
                                    queuestore.enqueue(nodeData[node]!.bottom)
                                    fatherNodeFromEnd[nodeData[nodeData[node]!.bottom]!.number] = node
                                    distanceFromEnd[nodeData[nodeData[node]!.bottom]!.number] = distanceFromEnd[nodeData[node]!.number] + nodeData[nodeData[node]!.bottom]!.yPosition - nodeData[node]!.yPosition
                                } else {
                                    ifNeedInsert = true
                                }
                            }
                        }
                        if nodeData[node]!.top != 0 {
                            if fatherNodeFromEnd[nodeData[nodeData[node]!.top]!.number] == 0 {
                                if distanceFromEnd[nodeData[node]!.number] - nodeData[nodeData[node]!.top]!.yPosition + nodeData[node]!.yPosition < currentRange {   //在处理范围内
                                    queueend1.enqueue(nodeData[node]!.top)
                                    queuestore.enqueue(nodeData[node]!.top)
                                    fatherNodeFromEnd[nodeData[nodeData[node]!.top]!.number] = node
                                    distanceFromEnd[nodeData[nodeData[node]!.top]!.number] = distanceFromEnd[nodeData[node]!.number] - nodeData[nodeData[node]!.top]!.yPosition + nodeData[node]!.yPosition
                                } else {
                                    ifNeedInsert = true
                                }
                            }
                        }
                        if ifNeedInsert == true {
                            queueend1.enqueue(node)
                        }
                    
                    }
                }
            }
        
            var current = fatherNodeFromStart[meetNode]
            while current != start {
                route.insert(current, atIndex: 0)
                current = fatherNodeFromStart[current]
            }
            route.insert(current, atIndex: 0)
            current = meetNode
            while current != end {
                route.append(current)
                current = fatherNodeFromEnd[current]
            }
            route.append(end)
        }
        fatherNodeFromEnd.removeAll(keepCapacity: false)
        fatherNodeFromStart.removeAll(keepCapacity: false)
        distanceFromEnd.removeAll(keepCapacity: false)
        distanceFromStart.removeAll(keepCapacity: false)
        
    }
    
    
    //totalRouteMake 生成总共的路径（通过多次调用unitRouteMake，再将其生成的路径链接起来）
    //route存储unitroutemake结果
    //pathroute存储路径上必经的entity结果
    //preroute 存储所有中间点
    func totalRouteMake() {
        if destinations.count > 0 {
            totalRoute.removeAll(keepCapacity: false)
            preroute.removeAll(keepCapacity: false)
            let nearnode = findNearRouteNode()
            if nearnode == 0 {
                let alertView = UIAlertView()
                alertView.delegate=self
                alertView.title = "出错啦!"
                alertView.message = "还没有找到您的位置哦"
                alertView.addButtonWithTitle("知道了")
                alertView.show()
                destinations.removeAll(keepCapacity: false)
                return
            }
            if destinations.count == 1 {  //如果目的点只有一个  直接调用unitRouteMake
                var i = 0
                let findInterNode = Line()
                findInterNode.setStartPathPoing(nodeData[nearnode]!)
                findInterNode.setEndPathPoing(nodeData[destinations[0].6]!)
                pathRoute.removeAll(keepCapacity: false)
                baLaLa(findInterNode)
                var j = 0
                while j < pathRoute.count {
                    preroute.append( pathRoute[j] )
                    j++
                }
            } else {
                let findInterNode = Line()
                findInterNode.setStartPathPoing(nodeData[nearnode]!)
                findInterNode.setEndPathPoing(nodeData[destinations[0].6]!)
                pathRoute.removeAll(keepCapacity: false)
                baLaLa(findInterNode)
                var j = 0
                while j < pathRoute.count {
                    preroute.append( pathRoute[j] )
                    j++
                }
                var i = 0
                while i < destinations.count - 1 {
                    let findInterNode = Line()
                    findInterNode.setStartPathPoing(nodeData[destinations[i].6]!)
                    findInterNode.setEndPathPoing(nodeData[destinations[i+1].6]!)
                    pathRoute.removeAll(keepCapacity: false)
                    baLaLa(findInterNode)
                    var j = 0
                    while j < pathRoute.count {
                        preroute.append( pathRoute[j] )
                        j++
                    }
                    i++
                }
            }
        
            var k = 0
            var m = 0
            while k < preroute.count - 1 {
                m = 0
                start = preroute[k]
                end = preroute[k+1]
                initdata()
                unitRouteMake()
                while m < route.count {
                    totalRoute.append(route[m])
                    m++
                }
                k++
            }
        
            for var i = 0; i < totalRoute.count - 1; i++ {
                
                if totalRoute[i] == totalRoute[i+1] {
                    totalRoute.removeAtIndex(i)
                
                }
            }
        }
        print(totalRoute)
    }
    
    
    
    //计算生成的路径长度
    func calculateRouteLenth(numberOfEntity : Int) -> Int {
        var length:Int = 0
        lengthRoute.removeAll(keepCapacity: false)
        let nearnode = findNearRouteNode()
        let findInterNode = Line()
        if nearnode == 0 {
            return -1
        }
        findInterNode.setStartPathPoing(nodeData[nearnode]!)
        findInterNode.setEndPathPoing(nodeData[numberOfEntity]!)
        pathRoute.removeAll(keepCapacity: false)
        baLaLa(findInterNode)
        var j = 0
        while j < pathRoute.count {
            lengthRoute.append( pathRoute[j] )
            j++
        }
        
        var k = 0
        var m = 0
        while  k < lengthRoute.count - 1 {
            m = 0
            start = lengthRoute[k]
            end = lengthRoute[k+1]
            initdata()
            unitRouteMake()
            if route.count == 1 {
                length = 0
            }
            while m < route.count - 1 {
                length += abs(nodeData[route[m+1]]!.xPosition - nodeData[route[m]]!.xPosition + nodeData[route[m+1]]!.yPosition - nodeData[route[m]]!.yPosition)
                m++
            }
            k++
        }
        return length
    }
    
    
    //导航纠偏
    func judgeGoWrong () {
        currentDistance = 10000000 //最短的距离
        var distance : Double = 0        //中转的值
        var distancex :Double = 0
        var distancey :Double = 0
        var nearestPoint : Int = 0      //第几个点距离最近
        var nodeTestNumber : Int = 0
        
        if totalRoute.count == 1 {
            distancex = (currentPosition[0] - Double(nodeData[totalRoute[0]]!.xPosition)) * (currentPosition[0] - Double(nodeData[totalRoute[0]]!.xPosition))
            distancey = (currentPosition[1] - Double(nodeData[totalRoute[0]]!.yPosition)) * (currentPosition[1] - Double(nodeData[totalRoute[0]]!.yPosition))
            distance = distancex + distancey
            if distance < 10000 {
                totalRoute.removeAll(keepCapacity: false)
            }
        }
        
        if totalRoute.count >= 2 {
            if totalRoute.count >= 4 {
                for var i = 0; i<4; ++i {
                    if nodeData[totalRoute[i]]!.zPosition == Int (currentPosition[2]) {
                        nodeTestNumber++;
                    } else {
                        break
                    }
                }
            } else {
                for var i = 0; i<totalRoute.count; ++i {
                    if nodeData[totalRoute[i]]!.zPosition == Int (currentPosition[2]) {
                        nodeTestNumber++;
                    } else {
                        break
                    }
                }
            }
            
           for var i : Int = 0; i <= nodeTestNumber - 1; i++ {
                distancex = (currentPosition[0] - Double(nodeData[totalRoute[i]]!.xPosition)) * (currentPosition[0] - Double(nodeData[totalRoute[i]]!.xPosition))
                distancey = (currentPosition[1] - Double(nodeData[totalRoute[i]]!.yPosition)) * (currentPosition[1] - Double(nodeData[totalRoute[i]]!.yPosition))
                distance = distancex + distancey
                if (currentDistance > distance) {
                    currentDistance = distance
                    nearestPoint = nearestPoint + 1
                }
            }

             if currentDistance > 80000 && currentDistance < 10000000 {
                let alertView = UIAlertView()
                alertView.delegate=self
                alertView.title = "重新规划"
                alertView.message = "您偏离正确路线过多，将会帮您重新规划路线"
                alertView.addButtonWithTitle("确定")
                if notificationModeRow == 0 {
                    playBgMusic()
                }
                alertView.show()
                totalRouteMake()
            //重新规划路径
            }
            else if currentDistance >= 45000 && currentDistance <= 80000 {
                if ifHasAlert == false {
                    let alertView = UIAlertView()
                    alertView.delegate=self
                    alertView.title = "警告"
                    alertView.message = "您已偏离正确路线"
                    alertView.addButtonWithTitle("知道了")
                    if notificationModeRow == 0 {
                        playBgMusic()
                    }
                    alertView.show()
                    ifHasAlert = true
                } else {
                    timeStop++
                    if timeStop == 60 {
                        let alertView = UIAlertView()
                        alertView.delegate = self
                        alertView.title = "警告"
                        alertView.message = "您已偏离正确路线"
                        alertView.addButtonWithTitle("知道了")
                        if notificationModeRow == 0 {
                            playBgMusic()
                        }
                        alertView.show()
                        ifHasAlert = true
                        timeStop = 0
                    }
                }
                for var j = 0;j < (nearestPoint - 1); j++ {
                    
                    totalRoute.removeAtIndex(j)
                    
                    let num = totalRoute[j]
                    for item in elevatorDictionary.values {
                        if num == item.relateroutenode {
                            if j + 1 < totalRoute.count {
                                if totalRoute[j+1] != totalRoute[j] {
                                for item2 in elevatorDictionary.values {
                                    
                                        if totalRoute[j + 1] == item2.relateroutenode {
                                            var floor: Int = item2.z
                                            if floor == 0 {
                                                floor = -1
                                            }
                                            let alertView = UIAlertView()
                                            alertView.delegate = self
                                            alertView.title = "提示"
                                            alertView.message = "请乘坐电梯前往机场 \(floor) 层"
                                            alertView.addButtonWithTitle("好")
                                            alertView.show()
                                        }
                                }
                                }
                            }
                        }
                    }
                    
                }
                
            } else {
                if(nearestPoint > 0) {
                    
                    for var j = 0; j < (nearestPoint - 1); j++ {
                        
                        totalRoute.removeAtIndex(j)
                        
                        let num = totalRoute[j]
                        for item in elevatorDictionary.values {
                            if num == item.relateroutenode {
                                if j + 1 < totalRoute.count {
                                    if( totalRoute[j+1] != totalRoute[j]) {
                                          for item2 in elevatorDictionary.values {
                                        
                                            if totalRoute[j + 1] == item2.relateroutenode {
                                                var floor: Int = item2.z
                                                if floor == 0 {
                                                    floor = -1
                                                }
                                                let alertView = UIAlertView()
                                                alertView.delegate = self
                                                alertView.title = "提示"
                                                alertView.message = "请乘坐电梯前往机场 \(floor) 层"
                                                alertView.addButtonWithTitle("好")
                                                alertView.show()
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        
                    }
                    
                } else {
                    
                    totalRoute.removeAtIndex(0)
                    
                }
            }

        }
    }
    
    
    //返回生成的路径中点的X值
    func returnTotalRouteX() -> [Int] {
        var routeX = [Int]()
        for item in totalRoute{
            routeX.append(nodeData[item]!.xPosition)
        }
        return routeX
    }
    
    //返回生成的路径中点的个数
    func returnTotalRouteCount() -> Int {
        return totalRoute.count
    }
    
    //返回生成的路径中点的Y值
    func returnTotalRouteY() -> [Int]{
        var routeY = [Int]()
        for item in totalRoute {
            routeY.append(nodeData[item]!.yPosition)
        }
        return routeY
    }
    
    //返回生成的路径中点的层数
    func returnTotalRouteFloor() -> [Int] {
        var floor = [Int]()
        for item in totalRoute {
            floor.append(nodeData[item]!.zPosition)
        }
        return floor
    }
    
    //返回当前位置的X值
    func returnCurrentPositionX() -> Double {
        return currentPosition[0]
    }
    
    //返回当前位置的Y值
    func returnCurrentPositionY() -> Double {
        return currentPosition[1]
    }
    
    //返回当前位置的层数
    func returnCurrentFloor() -> Double {
        return currentPosition[2]
    }
    
    //返回当前手机屏幕的宽
    func returnFrameX() -> CGFloat {
        return frameX
    }
    
    //返回当前手机屏幕的高
    func returnFrameY() -> CGFloat {
        return frameY
    }
    
    //返回当前地图视图的缩放程度
    func returnZoom() -> Double {
        return zoom
    }
    
    //返回当前楼层的最后一个目的点的x坐标
    func returnLatestCurrentFloorDestinationX() -> Int {
        
        var i = Int()
        for i = 0; i < destinations.count; ++i {
            if destinations[i].5 != Int(currentPosition[2]) {
                break
            }
        }
        
        if i > 0 {
            return Int(destinations[i - 1].3)
        } else {
            return 0
        }

    }
    
    //返回当前楼层的最后一个目的点的y坐标
    func returnLatestCurrentFloorDestinationY() -> Int {
        
        var i = Int()
        for i = 0; i < destinations.count; ++i {
            if destinations[i].5 != Int(currentPosition[2]) {
                break
            }
        }
        
        if i > 0 {
            return Int(destinations[i - 1].4)
        } else {
            return 0
        }

    }
    
    //播放声音提示
    func playBgMusic() {
        AudioServicesPlaySystemSound(1106)
        audioPlayer?.play()
    }
}
