//
//  Line.swift
//  UserInterfaceGoldMasterVersion
//
//  Created by Fantask on 15/4/27.
//  Copyright (c) 2015年 Fantask. All rights reserved.
//

import Foundation

//两点间路径类
class Line {
    //起点
    var startPathPoint = (xPosition: Int(), yPosition: Int(), zPosition: Int(), top: Int(), bottom: Int(), left: Int(), right: Int(), number: Int(), inSafeArea : Bool())
    //终点
    var endPathPoint = (xPosition: Int(), yPosition: Int(), zPosition: Int(), top: Int(), bottom: Int(), left: Int(), right: Int(), number: Int(), inSafeArea : Bool())
    
    //set
    func setStartPathPoing(startPathPoint : (xPosition: Int, yPosition: Int, zPosition: Int, top: Int, bottom: Int, left: Int, right: Int, number: Int, inSafeArea : Bool)) {
        self.startPathPoint = startPathPoint
    }
    
    func setEndPathPoing(endPathPoint : (xPosition: Int, yPosition: Int, zPosition: Int, top: Int, bottom: Int, left: Int, right: Int, number: Int, inSafeArea : Bool)) {
        self.endPathPoint = endPathPoint
    }
    
    //设置可达性
    func getReachable() -> Bool {
   
        if startPathPoint.inSafeArea {
   
            return true
   
        } else if !startPathPoint.inSafeArea && endPathPoint.inSafeArea {
   
            return false
   
        } else {
  
            return true
   
        }
   
    }
    
}

//起始点到各个电梯的直线距离平方
var currentEls1 : Int = 0
var currentEls2 : Int = 0
var currentEls3 : Int = 0
var currentEls4 : Int = 0
var currentEls5 : Int = 0
var currentEls6 : Int = 0
var currentEls7 : Int = 0
var currentEls8 : Int = 0

//起始点到各个安检口的距离的平方
var currentSc1 : Int = 0
var currentSc2 : Int = 0
var currentSc3 : Int = 0

//起始点是否在第16区（四分之一圆内）
func inSixteen(currentPosition : [Int]) -> Bool {
 
    if currentPosition[0] * currentPosition[0] + (currentPosition[1] - 1270) * (currentPosition[1] - 1270) <= 391 * 391 {
 
        return true
 
    } else {
  
        return false
   
    }
    
}

//起始点是否在第18区（四分之一圆内）
func inEighteen(currentPosition : [Int]) -> Bool {
 
    if (currentPosition[0] - 1928) * (currentPosition[0] - 1928) + (currentPosition[1] - 1270) * (currentPosition[1] - 1270) <= 391 * 391 {
  
        return true
  
    } else {
  
        return false
   
    }
    
}

//起始点是否在第33区（四分之一圆内）
func inThirtyThree(currentPosition : [Int]) -> Bool {

    
    if currentPosition[0] * currentPosition[0] + (currentPosition[1] - 1270) * (currentPosition[1] - 1270) <= 391 * 391 {
        
        return true
        
    } else {
        
        return false
        
    }
    
}

//起始点是否在第35区（四分之一圆内）
func inThirtyfive(currentPosition : [Int]) -> Bool {

    if (currentPosition[0] - 1928) * (currentPosition[0] - 1928) + (currentPosition[1] - 1270) * (currentPosition[1] - 1270) <= 391 * 391 {
        
        return true
        
    } else {
        
        return false
        
    }
    
}

//寻找电梯方法
func findNearestElevator(currentPosition : [Int], finalPosition : [Int]) -> (title : String, subtitle : String, description : String, x : Int, y : Int, z : Int, relateroutenode : Int, Secondrelateroutenode : Int, image : String) {
    
    switch currentPosition[2] {
    case 0:     //当起点在停车场时
        //判断所在区域，选择电梯
        if finalPosition[0] >= 964 && finalPosition[1] <= 155 {
            
            return ZELS4
            
        } else if finalPosition[0] < 964 && finalPosition[1] <= 155 {
            
            return ZELS3
            
        } else {
            currentEls1 = (currentPosition[0] - pathPoint207.xPosition) * (currentPosition[0] - pathPoint207.xPosition) + (currentPosition[1] - pathPoint207.yPosition) * (currentPosition[1] - pathPoint207.yPosition)
            currentEls2 = (currentPosition[0] - pathPoint213.xPosition) * (currentPosition[0] - pathPoint213.xPosition) + (currentPosition[1] - pathPoint213.yPosition) * (currentPosition[1] - pathPoint213.yPosition)
            currentEls3 = (currentPosition[0] - pathPoint199.xPosition) * (currentPosition[0] - pathPoint199.xPosition) + (currentPosition[1] - pathPoint199.yPosition) * (currentPosition[1] - pathPoint199.yPosition)
            currentEls4 = (currentPosition[0] - pathPoint201.xPosition) * (currentPosition[0] - pathPoint201.xPosition) + (currentPosition[1] - pathPoint201.yPosition) * (currentPosition[1] - pathPoint201.yPosition)
            
            if currentEls1 < currentEls2 && currentEls1 < currentEls3 && currentEls1 < currentEls4 {
                
                return ZELS1
                
            } else if currentEls2 < currentEls1 && currentEls2 < currentEls3 && currentEls2 < currentEls4 {
                
                return ZELS2
                
            } else if (currentEls3 < currentEls2 && currentEls3 < currentEls1 && currentEls3 < currentEls4) {
                
                return ZELS3
                
            } else {
                
                return ZELS4
                
            }
        }
        
    case 1:     //当起点在1楼时
        switch finalPosition[2] {
        case 0:     //当终点在停车场时
            currentEls1 = (currentPosition[0] - pathPoint98.xPosition) * (currentPosition[0] - pathPoint98.xPosition) + (currentPosition[1] - pathPoint98.yPosition) * (currentPosition[1] - pathPoint98.yPosition)
            currentEls2 = (currentPosition[0] - pathPoint110.xPosition) * (currentPosition[0] - pathPoint110.xPosition) + (currentPosition[1] - pathPoint110.yPosition) * (currentPosition[1] - pathPoint110.yPosition)
            currentEls3 = (currentPosition[0] - pathPoint74.xPosition) * (currentPosition[0] - pathPoint74.xPosition) + (currentPosition[1] - pathPoint74.yPosition) * (currentPosition[1] - pathPoint74.yPosition)
            currentEls4 = (currentPosition[0] - pathPoint76.xPosition) * (currentPosition[0] - pathPoint76.xPosition) + (currentPosition[1] - pathPoint76.yPosition) * (currentPosition[1] - pathPoint76.yPosition)
            
            if currentEls1 < currentEls2 && currentEls1 < currentEls3 && currentEls1 < currentEls4 {
                
                return FELS1
                
            } else if currentEls2 < currentEls1 && currentEls2 < currentEls3 && currentEls2 < currentEls4 {
                
                return FELS2
                
            } else if currentEls3 < currentEls2 && currentEls3 < currentEls1 && currentEls3 < currentEls4 {
                
                return FELS3
                
            } else {
                
                return FELS4
                
            }
            
        case 2:     //当终点在2楼时
            currentEls1 = (currentPosition[0] - pathPoint98.xPosition) * (currentPosition[0] - pathPoint98.xPosition) + (currentPosition[1] - pathPoint98.yPosition) * (currentPosition[1] - pathPoint98.yPosition)
            currentEls2 = (currentPosition[0] - pathPoint110.xPosition) * (currentPosition[0] - pathPoint110.xPosition) + (currentPosition[1] - pathPoint110.yPosition) * (currentPosition[1] - pathPoint110.yPosition)
            currentEls3 = (currentPosition[0] - pathPoint74.xPosition) * (currentPosition[0] - pathPoint74.xPosition) + (currentPosition[1] - pathPoint74.yPosition) * (currentPosition[1] - pathPoint74.yPosition)
            currentEls4 = (currentPosition[0] - pathPoint76.xPosition) * (currentPosition[0] - pathPoint76.xPosition) + (currentPosition[1] - pathPoint76.yPosition) * (currentPosition[1] - pathPoint76.yPosition)
            currentEls5 = (currentPosition[0] - pathPoint42.xPosition) * (currentPosition[0] - pathPoint42.xPosition) + (currentPosition[1] - pathPoint42.yPosition) * (currentPosition[1] - pathPoint42.yPosition)
            currentEls6 = (currentPosition[0] - pathPoint45.xPosition) * (currentPosition[0] - pathPoint45.xPosition) + (currentPosition[1] - pathPoint45.yPosition) * (currentPosition[1] - pathPoint45.yPosition)
            currentEls7 = (currentPosition[0] - pathPoint2.xPosition) * (currentPosition[0] - pathPoint2.xPosition) + (currentPosition[1] - pathPoint2.yPosition) * (currentPosition[1] - pathPoint2.yPosition)
            currentEls8 = (currentPosition[0] - pathPoint13.xPosition) * (currentPosition[0] - pathPoint13.xPosition) + (currentPosition[1] - pathPoint13.yPosition) * (currentPosition[1] - pathPoint13.yPosition)
            
            
            if currentEls1 < currentEls2 && currentEls1 < currentEls3 && currentEls1 < currentEls4 && currentEls1 < currentEls5 && currentEls1 < currentEls6 && currentEls1 < currentEls7 && currentEls1 < currentEls8 && !inSixteen(currentPosition) {
                
                return FELS1
                
            } else if currentEls2 < currentEls1 && currentEls2 < currentEls3 && currentEls2 < currentEls4 && currentEls2 < currentEls5 && currentEls2 < currentEls6 && currentEls2 < currentEls7 && currentEls2 < currentEls8 && !inEighteen(currentPosition) {
                
                return FELS2
                
            } else if currentEls3 < currentEls2 && currentEls3 < currentEls1 && currentEls3 < currentEls4 && currentEls3 < currentEls5 && currentEls3 < currentEls6 && currentEls3 < currentEls7 && currentEls3 < currentEls8 || inSixteen(currentPosition) {
                
                return FELS3
                
            } else if currentEls4 < currentEls2 && currentEls4 < currentEls3 && currentEls4 < currentEls1 && currentEls4 < currentEls5 && currentEls4 < currentEls6 && currentEls4 < currentEls7 && currentEls4 < currentEls8 || inEighteen(currentPosition) {
                
                return FELS4
                
            } else if currentEls5 < currentEls2 && currentEls5 < currentEls3 && currentEls5 < currentEls4 && currentEls5 < currentEls1 && currentEls5 < currentEls6 && currentEls5 < currentEls7 && currentEls5 < currentEls8 {
                
                return FELS5
                
            } else if currentEls6 < currentEls2 && currentEls6 < currentEls3 && currentEls6 < currentEls4 && currentEls6 < currentEls5 && currentEls6 < currentEls1 && currentEls6 < currentEls7 && currentEls6 < currentEls8 {
                
                return FELS6
                
            } else if currentEls7 < currentEls2 && currentEls7 < currentEls3 && currentEls7 < currentEls4 && currentEls7 < currentEls5 && currentEls7 < currentEls6 && currentEls7 < currentEls1 && currentEls7 < currentEls8 {
                
                return FELS7
                
            } else {
                
                return FELS8
                
            }
        default:
            
            break
            
        }
        
    case 2:
       
        switch finalPosition[2] {
        case 0://当终点在停车场时
            currentEls1 = (currentPosition[0] - pathPoint185.xPosition) * (currentPosition[0] - pathPoint185.xPosition) + (currentPosition[1] - pathPoint185.yPosition) * (currentPosition[1] - pathPoint185.yPosition)
            currentEls2 = (currentPosition[0] - pathPoint197.xPosition) * (currentPosition[0] - pathPoint197.xPosition) + (currentPosition[1] - pathPoint197.yPosition) * (currentPosition[1] - pathPoint197.yPosition)
            currentEls3 = (currentPosition[0] - pathPoint168.xPosition) * (currentPosition[0] - pathPoint168.xPosition) + (currentPosition[1] - pathPoint168.yPosition) * (currentPosition[1] - pathPoint168.yPosition)
            currentEls4 = (currentPosition[0] - pathPoint170.xPosition) * (currentPosition[0] - pathPoint170.xPosition) + (currentPosition[1] - pathPoint170.yPosition) * (currentPosition[1] - pathPoint170.yPosition)
        
            if currentEls1 < currentEls2 && currentEls1 < currentEls3 && currentEls1 < currentEls4 {
               
                return SELS1
        
            } else if currentEls2 < currentEls1 && currentEls2 < currentEls3 && currentEls2 < currentEls4 {
                
                return SELS2
         
            } else if currentEls3 < currentEls2 && currentEls3 < currentEls1 && currentEls3 < currentEls4 {
               
                return SELS3
         
            } else {
                
                return SELS4
         
            }
       
        case 1://当终点在1楼时
            currentEls1 = (currentPosition[0] - pathPoint185.xPosition) * (currentPosition[0] - pathPoint185.xPosition) + (currentPosition[1] - pathPoint185.yPosition) * (currentPosition[1] - pathPoint185.yPosition)
            currentEls2 = (currentPosition[0] - pathPoint197.xPosition) * (currentPosition[0] - pathPoint197.xPosition) + (currentPosition[1] - pathPoint197.yPosition) * (currentPosition[1] - pathPoint197.yPosition)
            currentEls3 = (currentPosition[0] - pathPoint168.xPosition) * (currentPosition[0] - pathPoint168.xPosition) + (currentPosition[1] - pathPoint168.yPosition) * (currentPosition[1] - pathPoint168.yPosition)
            currentEls4 = (currentPosition[0] - pathPoint170.xPosition) * (currentPosition[0] - pathPoint170.xPosition) + (currentPosition[1] - pathPoint170.yPosition) * (currentPosition[1] - pathPoint170.yPosition)
            currentEls7 = (currentPosition[0] - pathPoint113.xPosition) * (currentPosition[0] - pathPoint113.xPosition) + (currentPosition[1] - pathPoint113.yPosition) * (currentPosition[1] - pathPoint113.yPosition)
            currentEls8 = (currentPosition[0] - pathPoint125.xPosition) * (currentPosition[0] - pathPoint125.xPosition) + (currentPosition[1] - pathPoint125.yPosition) * (currentPosition[1] - pathPoint125.yPosition)
           
            if (currentEls1 < currentEls2 && currentEls1 < currentEls3 && currentEls1 < currentEls4 && currentEls1 < currentEls7 && currentEls1 < currentEls8) && !inThirtyThree(currentPosition) {
         
                    return SELS1
          
            } else if (currentEls2 < currentEls1 && currentEls2 < currentEls3 && currentEls2 < currentEls4 && currentEls2 < currentEls7 && currentEls2 < currentEls8) && !inThirtyfive(currentPosition) {
          
                return SELS2
          //////////////////////////////////////////////////
            } else if (currentEls3 < currentEls2 && currentEls3 < currentEls1 && currentEls3 < currentEls4 && currentEls3 < currentEls7 && currentEls3 < currentEls8) || inThirtyThree(currentPosition) {
          
                if line.endPathPoint.inSafeArea {
                    return SELS7
                } else {
                    return SELS7
                }
        
            } else if (currentEls4 < currentEls2 && currentEls4 < currentEls3 && currentEls4 < currentEls1 && currentEls4 < currentEls7 && currentEls4 < currentEls8) || inThirtyfive(currentPosition) {
          
                if line.endPathPoint.inSafeArea {
                    return SELS8
                } else {
                    return SELS8
                }
         
            } else if currentEls7 < currentEls2 && currentEls7 < currentEls3 && currentEls7 < currentEls4 && currentEls7 < currentEls1 &&
                currentEls7 < currentEls8 {
         
                    return SELS7
         
            } else {
          
                return SELS8
         
            }
        
        default:
            break
        }
    default:
        break
    }
    
    return FS1  //这里必须要返回一个，就随便返回一个值，不影响结果
}


//找出最近的安检口
func findSafetyCheck(endPosition : [Int]) -> (title:String,subtitle: String, description:String,x: Int, y:Int, z:Int,relateroutenode: Int,Secondrelateroutenode: Int,image: String) {
    
    currentSc1 = (endPosition[0] - pathPoint147.xPosition) * (endPosition[0] - pathPoint147.xPosition) + (endPosition[1] - pathPoint147.yPosition) * (endPosition[1] - pathPoint147.yPosition)
    currentSc2 = (endPosition[0] - pathPoint130.xPosition) * (endPosition[0] - pathPoint130.xPosition) + (endPosition[1] - pathPoint130.yPosition) * (endPosition[1] - pathPoint130.yPosition)
    currentSc3 = (endPosition[0] - pathPoint153.xPosition) * (endPosition[0] - pathPoint153.xPosition) + (endPosition[1] - pathPoint153.yPosition) * (endPosition[1] - pathPoint153.yPosition)
    
    if currentSc1 < currentSc2 && currentSc1 < currentSc3 {
  
        return SSC1
  
    } else if currentSc2 < currentSc1 && currentSc2 < currentSc3 {
  
        return SSC2
 
    } else {
 
        return SSC3
  
    }
}






var line = Line()
var parkElevator = ZELS4
//找出两个点之间的电梯和安检口
func baLaLa(line:Line)  {
    var currentP = [line.startPathPoint.xPosition, line.startPathPoint.yPosition, line.startPathPoint.zPosition]
    var finalP = [line.endPathPoint.xPosition, line.endPathPoint.yPosition, line.endPathPoint.zPosition]
    var newCurrentP = [nodeData[findNearestElevator(currentP, finalPosition: finalP).relateroutenode]!.xPosition, nodeData[findNearestElevator(currentP, finalPosition: finalP).relateroutenode]!.yPosition, finalP[2]]
    var newCurrentP2 = [nodeData[findSafetyCheck(finalP).relateroutenode]!.xPosition, nodeData[findSafetyCheck(finalP).relateroutenode]!.yPosition, nodeData[findSafetyCheck(finalP).relateroutenode]!.zPosition]

    if line.getReachable() {            //可达 ———— 起点在安全区 或 起、终点都在非安全区
        
        
        if line.startPathPoint.zPosition == line.endPathPoint.zPosition {       //在同一楼层，OK
            
            
            pathRoute.append(line.startPathPoint.number)
            pathRoute.append(line.endPathPoint.number)
            
            
        } else {            //不在同一楼层，需要先查找最近的、不在安全区的电梯,OK
            
            pathRoute.append(line.startPathPoint.number)
            pathRoute.append(findNearestElevator(currentP, finalPosition: finalP).relateroutenode)
           
            switch currentP[2] {
            case 0:
          
                if findNearestElevator(currentP, finalPosition: finalP).relateroutenode == 207 && finalP[2] == 1 {
          
                    pathRoute.append(98)
          
                } else if findNearestElevator(currentP, finalPosition: finalP).relateroutenode == 207 && finalP[2] == 2 {
          
                    pathRoute.append(185)
           
                } else if findNearestElevator(currentP, finalPosition: finalP).relateroutenode == 213 && finalP[2] == 1 {
          
                    pathRoute.append(110)
           
                } else if findNearestElevator(currentP, finalPosition: finalP).relateroutenode == 213 && finalP[2] == 2 {
            
                    pathRoute.append(197)
            
                } else if findNearestElevator(currentP, finalPosition: finalP).relateroutenode == 199 && finalP[2] == 1 {
            
                    pathRoute.append(74)
            
                } else if findNearestElevator(currentP, finalPosition: finalP).relateroutenode == 199 && finalP[2] == 2 {
            
                    pathRoute.append(168)
            
                } else if findNearestElevator(currentP, finalPosition: finalP).relateroutenode == 201 && finalP[2] == 1 {
            
                    pathRoute.append(76)
            
                } else if findNearestElevator(currentP, finalPosition: finalP).relateroutenode == 201 && finalP[2] == 2 {
            
                    pathRoute.append(170)
            
                }
          
            case 1:
            
                if findNearestElevator(currentP, finalPosition: finalP).relateroutenode == 98 && finalP[2] == 0 {
             
                    pathRoute.append(207)
                    parkElevator = ZELS1
            
                } else if findNearestElevator(currentP, finalPosition: finalP).relateroutenode == 98 && finalP[2] == 2 {
           
                    pathRoute.append(185)
            
                } else if findNearestElevator(currentP, finalPosition: finalP).relateroutenode == 110 && finalP[2] == 0 {
                    
                    pathRoute.append(213)
                    parkElevator = ZELS2
          
                } else if findNearestElevator(currentP, finalPosition: finalP).relateroutenode == 110 && finalP[2] == 2 {
          
                    pathRoute.append(197)
          
                } else if findNearestElevator(currentP, finalPosition: finalP).relateroutenode == 74 && finalP[2] == 0 {
          
                    pathRoute.append(199)
                    parkElevator = ZELS3
          
                } else if findNearestElevator(currentP, finalPosition: finalP).relateroutenode == 74 && finalP[2] == 2 {
           
                    pathRoute.append(168)
           
                } else if findNearestElevator(currentP, finalPosition: finalP).relateroutenode == 76 && finalP[2] == 0 {
           
                    pathRoute.append(201)
                    parkElevator = ZELS4
           
                } else if findNearestElevator(currentP, finalPosition: finalP).relateroutenode == 76 && finalP[2] == 2 {
           
                    pathRoute.append(170)
           
                } else if findNearestElevator(currentP, finalPosition: finalP).relateroutenode == 42 {
           
                    pathRoute.append(142)
           
                } else if findNearestElevator(currentP, finalPosition: finalP).relateroutenode == 44 {
           
                    pathRoute.append(144)
          
                } else if findNearestElevator(currentP, finalPosition: finalP).relateroutenode == 2 {
          
                    pathRoute.append(113)
          
                } else if findNearestElevator(currentP, finalPosition: finalP).relateroutenode == 13 {
          
                    pathRoute.append(125)
          
                }
      
            case 2:
           
                if findNearestElevator(currentP, finalPosition: finalP).relateroutenode == 185 && finalP[2] == 0 {
           
                    pathRoute.append(207)
                    parkElevator = ZELS1
           
                } else if findNearestElevator(currentP, finalPosition: finalP).relateroutenode == 185 && finalP[2] == 1 {
            
                    pathRoute.append(98)
           
                } else if findNearestElevator(currentP, finalPosition: finalP).relateroutenode == 197 && finalP[2] == 0 {
           
                    pathRoute.append(213)
                    parkElevator = ZELS2
           
                } else if findNearestElevator(currentP, finalPosition: finalP).relateroutenode == 197 && finalP[2] == 1 {
           
                    pathRoute.append(110)
           
                } else if findNearestElevator(currentP, finalPosition: finalP).relateroutenode == 168 && finalP[2] == 0 {
           
                    pathRoute.append(199)
                    parkElevator = ZELS3
           
                } else if findNearestElevator(currentP, finalPosition: finalP).relateroutenode == 168 && finalP[2] == 1 {
           
                    pathRoute.append(74)
           
                } else if findNearestElevator(currentP, finalPosition: finalP).relateroutenode == 170 && finalP[2] == 0 {
           
                    pathRoute.append(201)
                    parkElevator = ZELS4
           
                } else if findNearestElevator(currentP, finalPosition: finalP).relateroutenode == 170 && finalP[2] == 1 {
           
                    pathRoute.append(76)
           
                } else if findNearestElevator(currentP, finalPosition: finalP).relateroutenode == 113 {
           
                    pathRoute.append(2)
          
                } else if findNearestElevator(currentP, finalPosition: finalP).relateroutenode == 125 {
          
                    pathRoute.append(13)
          
                }
         
            default:
                break
            }
            pathRoute.append(line.endPathPoint.number)
            
            
        }
        
    } else {        //不可达 ———— 起点在非安全区，终点在安全区
        
        
        if line.startPathPoint.zPosition == line.endPathPoint.zPosition {
            //在同一楼层
            
            if line.startPathPoint.zPosition == 2 {
                //如果在2楼，直接过安检,OK
                
                pathRoute.append(line.startPathPoint.number)
                pathRoute.append(findSafetyCheck(finalP).relateroutenode)
                pathRoute.append(line.endPathPoint.number)
                
            } else if line.startPathPoint.zPosition == 1 {
                //如果在一楼，先上楼，过安检，再下楼，OK
                
                pathRoute.append(line.startPathPoint.number)
                finalP[2] = 2
                pathRoute.append(findNearestElevator(currentP, finalPosition: finalP).relateroutenode)
                
                if findNearestElevator(currentP, finalPosition: finalP).relateroutenode == 98 {
           
                    pathRoute.append(185)
           
                } else if findNearestElevator(currentP, finalPosition: finalP).relateroutenode == 110 {
           
                    pathRoute.append(197)
          
                } else if findNearestElevator(currentP, finalPosition: finalP).relateroutenode == 74  {
          
                    pathRoute.append(168)
          
                } else if findNearestElevator(currentP, finalPosition: finalP).relateroutenode == 76 {
          
                    pathRoute.append(170)
          
                }
                pathRoute.append(findSafetyCheck(finalP).relateroutenode)
                finalP[2] = 1
            
                if findSafetyCheck(finalP).relateroutenode == 153 || findSafetyCheck(finalP).relateroutenode == 130 {
            
                    pathRoute.append(125)
                    pathRoute.append(13)
           
                } else if findSafetyCheck(finalP).relateroutenode == 147 {
           
                    pathRoute.append(113)
                    pathRoute.append(2)
            
                }
            
                pathRoute.append(line.endPathPoint.number)
                
            } else { //地下一楼
            }
            
        } else {
            //不在同一楼层，需要先查找最近的、不在安全区的电梯
            
            if line.startPathPoint.zPosition == 2 {       //起点在二楼,OK
                
                pathRoute.append(line.startPathPoint.number)
                pathRoute.append(findSafetyCheck(currentP).relateroutenode)
                
                if findSafetyCheck(currentP).relateroutenode == 153 || findSafetyCheck(currentP).relateroutenode == 130 {
            
                    pathRoute.append(125)
                    pathRoute.append(13)
            
                } else if findSafetyCheck(currentP).relateroutenode == 147 {
            
                    pathRoute.append(113)
                    pathRoute.append(2)
           
                }
           
                pathRoute.append(line.endPathPoint.number)
                
            } else if line.startPathPoint.zPosition == 1 {      //起点在一楼，OK
                
                pathRoute.append(line.startPathPoint.number)
                pathRoute.append(findNearestElevator(currentP, finalPosition: finalP).relateroutenode)
             
                if findNearestElevator(currentP, finalPosition: finalP).relateroutenode == 98 {
             
                    pathRoute.append(185)
             
                } else if findNearestElevator(currentP, finalPosition: finalP).relateroutenode == 110 {
              
                    pathRoute.append(197)
             
                } else if findNearestElevator(currentP, finalPosition: finalP).relateroutenode == 74 {
             
                    pathRoute.append(168)
             
                } else if findNearestElevator(currentP, finalPosition: finalP).relateroutenode == 76 {
             
                    pathRoute.append(170)
             
                } else if findNearestElevator(currentP, finalPosition: finalP).relateroutenode == 42 {
             
                    pathRoute.append(142)
             
                } else if findNearestElevator(currentP, finalPosition: finalP).relateroutenode == 44 {
             
                    pathRoute.append(144)
             
                }
        
                pathRoute.append(findSafetyCheck(finalP).relateroutenode)
                pathRoute.append(line.endPathPoint.number)
                
            } else {        //起点在停车场，通过
                
                if line.endPathPoint.zPosition == 2 {//OK
                    
                    pathRoute.append(line.startPathPoint.number)
                    pathRoute.append(findNearestElevator(currentP, finalPosition: finalP).relateroutenode)
                  
                    if findNearestElevator(currentP, finalPosition: finalP).relateroutenode == 207 {
                  
                        pathRoute.append(185)
                 
                    } else if findNearestElevator(currentP, finalPosition: finalP).relateroutenode == 213 {
                 
                    pathRoute.append(197)
                    
                    } else if findNearestElevator(currentP, finalPosition: finalP).relateroutenode == 199 {
                 
                        pathRoute.append(168)
                 
                    } else if findNearestElevator(currentP, finalPosition: finalP).relateroutenode  == 201 {
                  
                        pathRoute.append(170)
                  
                    }
               
                    pathRoute.append(findSafetyCheck(finalP).relateroutenode)
                    pathRoute.append(line.endPathPoint.number)
                    
                } else {        //OK
                    
                    pathRoute.append(line.startPathPoint.number)
                    pathRoute.append(findNearestElevator(currentP, finalPosition: finalP).relateroutenode)
             
                    if findNearestElevator(currentP, finalPosition: finalP).relateroutenode == 207 {
                        
                        pathRoute.append(185)
                   
                    } else if findNearestElevator(currentP, finalPosition: finalP).relateroutenode == 213 {
                   
                        pathRoute.append(197)
                   
                    } else if findNearestElevator(currentP, finalPosition: finalP).relateroutenode == 199 {
                   
                        pathRoute.append(168)
                   
                    } else if findNearestElevator(currentP, finalPosition: finalP).relateroutenode == 201 {
                  
                        pathRoute.append(170)
                  
                    }
                   
                    finalP[2] = 2
                    pathRoute.append(findSafetyCheck(finalP).relateroutenode)
                    finalP[2] = 1
                    pathRoute.append(findNearestElevator(newCurrentP2, finalPosition: finalP).relateroutenode)
                
                    if findNearestElevator(newCurrentP2, finalPosition: finalP).relateroutenode == 113 {
                
                        pathRoute.append(2)
                
                    } else {
              
                        pathRoute.append(13)
              
                    }
                   
                    pathRoute.append(line.endPathPoint.number)
                    
                }
                
                
            }
            
        }
        
    }
    
    //消除相同的pathPoint的number
    for var i = 0;i < pathRoute.count;i++ {
        for var j = 0;j < i;j++ {
            if pathRoute[i] == pathRoute[j] {
                pathRoute.removeAtIndex(j)
            }
        }
    }    
}
