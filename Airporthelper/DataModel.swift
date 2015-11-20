//
//  Data.swift
//  UserInterfaceGoldMasterVersion
//
//  Created by Fantask on 15/4/22.
//  Copyright (c) 2015年 Fantask. All rights reserved.
//
import Foundation
import CoreData
//程序数据库

//获取总代理
let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
let managedObjectContents = appDelegate.managedObjectContext
let fetchRequest = NSFetchRequest(entityName: "Collect")

//第一次启动程序
var isFirstTime = true

//获得二维码信息的字符串
var twoDimension :String = ""

//当前位置到下一个路径上的点的距离
var currentDistance = Double()

//是否只前往安检口而不继续前往登机口
var goToSafety = false

//是否是中途插点
var isInsertingMiddleDestination = false

//是否改变了deatination
var ifChangeDestination = false

//是否处于一键登机
var inOneTap = false

//航空公司
var airline = ""

//是否托运行李
var isGonnaChackInLuggage : Bool = false

//登机口
var boardingGate = ""

//美食
var restaurant = TableViewModel(id: "", title: "", image: "")
var restaurantName = ""

//购物(选择类别)
var storeCategory = TableViewModel(id: "", title: "", image: "")
var storeCategoryName = ""

//购物(选择详细)
var store = TableViewModel(id: "", title: "", image: "")
var storeName = ""

//锁屏开关
var isSwitchOn = false

//屏幕跟随开关
var isFollowing = false

//通知方式
var notificationModeRow = 0     //0位声音，1为无
var notificationModeRowName = ""

//当前位置
var currentPosition = [0.0, 0.0, 3.0]

//目的地数组
var destinations : [(String, String, String, Int, Int, Int, Int, Int, String)] = []

//总的距离
var totalDistance : Double = 0.0

var ifCheckBoardWrong = false

var isFirstTimeB1 = true

var isFirstTimeF1 = true

var isFirstTimeF2 = true

var isFirstTimeFollow = true

var currentmap = -1

var fatherNodeFromStart = [Int]()

var fatherNodeFromEnd = [Int]()

var distanceFromStart = [Int]()

var distanceFromEnd = [Int]()

var  route = [Int]()   //所有路径段点

var totalRoute = [Int]()  //所有路径点

var pathRoute = [Int]()   //临时点

var preroute = [Int]()

var lengthRoute = [Int]()

var zoom = 0.3

var frameX :CGFloat = 0.0

var frameY :CGFloat = 0.0

var ifHasAlert :Bool = false

var ifHasAlert2 :Bool = false

var timeStop :Int = 0

var timeStop2 :Int = 0

var ifAddDestination :Bool = false

var ifAddDestinationAtEnd :Bool = false

/**************************************** 数据 ********************************************/
//结点信息

//路径上的点，元组
let pathPoint1  = (xPosition:146,   yPosition:214,  zPosition:1, top:0,   bottom:15,  left:0,   right:2,   number:1,   inSafeArea: true)
let pathPoint2  = (xPosition:266,   yPosition:214,  zPosition:1, top:0,   bottom:17,  left:1,   right:3,   number:2,   inSafeArea: true)
let pathPoint3  = (xPosition:384,   yPosition:214,  zPosition:1, top:0,   bottom:0,   left:2,   right:4,   number:3,   inSafeArea: true)
let pathPoint4  = (xPosition:520,   yPosition:214,  zPosition:1, top:0,   bottom:18,  left:3,   right:5,   number:4,   inSafeArea: true)
let pathPoint5  = (xPosition:616,   yPosition:214,  zPosition:1, top:0,   bottom:0,   left:4,   right:6,   number:5,   inSafeArea: true)
let pathPoint6  = (xPosition:749,   yPosition:214,  zPosition:1, top:0,   bottom:19,  left:5,   right:7,   number:6,   inSafeArea: true)
let pathPoint7  = (xPosition:853,   yPosition:214,  zPosition:1, top:0,   bottom:0,   left:6,   right:8,   number:7,   inSafeArea: true)
let pathPoint8  = (xPosition:1080,  yPosition:214,  zPosition:1, top:0,   bottom:0,   left:7,   right:9,   number:8,   inSafeArea: true)
let pathPoint9  = (xPosition:1172,  yPosition:214,  zPosition:1, top:0,   bottom:20,  left:8,   right:10,  number:9,   inSafeArea: true)
let pathPoint10 = (xPosition:1310,  yPosition:214,  zPosition:1, top:0,   bottom:0,   left:9,   right:11,  number:10,  inSafeArea: true)
let pathPoint11 = (xPosition:1406,  yPosition:214,  zPosition:1, top:0,   bottom:21,  left:10,  right:12,  number:11,  inSafeArea: true)
let pathPoint12 = (xPosition:1542,  yPosition:214,  zPosition:1, top:0,   bottom:0,   left:11,  right:13,  number:12,  inSafeArea: true)
let pathPoint13 = (xPosition:1656,  yPosition:214,  zPosition:1, top:0,   bottom:22,  left:12,  right:14,  number:13,  inSafeArea: true)
let pathPoint14 = (xPosition:1777,  yPosition:214,  zPosition:1, top:0,   bottom:16,  left:13,  right:0,   number:14,  inSafeArea: true)
let pathPoint15 = (xPosition:146,   yPosition:278,  zPosition:1, top:1,   bottom:29,  left:0,   right:0,   number:15,  inSafeArea: true)
let pathPoint16 = (xPosition:1777,  yPosition:278,  zPosition:1, top:14,  bottom:36,  left:0,   right:0,   number:16,  inSafeArea: true)
let pathPoint17 = (xPosition:266,   yPosition:348,  zPosition:1, top:2,   bottom:23,  left:0,   right:0,   number:17,  inSafeArea: true)
let pathPoint18 = (xPosition:520,   yPosition:348,  zPosition:1, top:4,   bottom:24,  left:0,   right:19,  number:18,  inSafeArea: true)
let pathPoint19 = (xPosition:749,   yPosition:348,  zPosition:1, top:6,   bottom:25,  left:18,  right:0,   number:19,  inSafeArea: true)
let pathPoint20 = (xPosition:1172,  yPosition:348,  zPosition:1, top:9,   bottom:26,  left:0,   right:21,  number:20,  inSafeArea: true)
let pathPoint21 = (xPosition:1406,  yPosition:348,  zPosition:1, top:11,  bottom:27,  left:20,  right:0,   number:21,  inSafeArea: true)
let pathPoint22 = (xPosition:1656,  yPosition:348,  zPosition:1, top:13,  bottom:28,  left:0,   right:0,   number:22,  inSafeArea: true)
let pathPoint23 = (xPosition:266,   yPosition:425,  zPosition:1, top:17,  bottom:30,  left:0,   right:0,   number:23,  inSafeArea: true)
let pathPoint24 = (xPosition:520,   yPosition:425,  zPosition:1, top:18,  bottom:31,  left:0,   right:25,  number:24,  inSafeArea: true)
let pathPoint25 = (xPosition:749,   yPosition:425,  zPosition:1, top:19,  bottom:32,  left:24,  right:0,   number:25,  inSafeArea: true)
let pathPoint26 = (xPosition:1172,  yPosition:425,  zPosition:1, top:20,  bottom:33,  left:0,   right:27,  number:26,  inSafeArea: true)
let pathPoint27 = (xPosition:1406,  yPosition:425,  zPosition:1, top:21,  bottom:34,  left:26,  right:0,   number:27,  inSafeArea: true)
let pathPoint28 = (xPosition:1656,  yPosition:425,  zPosition:1, top:22,  bottom:35,  left:0,   right:0,   number:28,  inSafeArea: true)
let pathPoint29 = (xPosition:146,   yPosition:505,  zPosition:1, top:15,  bottom:248, left:0,   right:30,  number:29,  inSafeArea: true)
let pathPoint30 = (xPosition:266,   yPosition:505,  zPosition:1, top:23,  bottom:242, left:29,  right:0,   number:30,  inSafeArea: true)
let pathPoint31 = (xPosition:520,   yPosition:505,  zPosition:1, top:24,  bottom:244, left:0,   right:32,  number:31,  inSafeArea: true)
let pathPoint32 = (xPosition:749,   yPosition:505,  zPosition:1, top:25,  bottom:38,  left:31,  right:0,   number:32,  inSafeArea: true)
let pathPoint33 = (xPosition:1172,  yPosition:505,  zPosition:1, top:26,  bottom:40,  left:0,   right:34,  number:33,  inSafeArea: true)
let pathPoint34 = (xPosition:1406,  yPosition:505,  zPosition:1, top:27,  bottom:246, left:33,  right:0,   number:34,  inSafeArea: true)
let pathPoint35 = (xPosition:1656,  yPosition:505,  zPosition:1, top:28,  bottom:243, left:0,   right:36,  number:35,  inSafeArea: true)
let pathPoint36 = (xPosition:1777,  yPosition:505,  zPosition:1, top:16,  bottom:249, left:35,  right:0,   number:36,  inSafeArea: true)
let pathPoint37 = (xPosition:146,   yPosition:623,  zPosition:1, top:248, bottom:46,  left:0,   right:0,   number:37,  inSafeArea: true)
let pathPoint38 = (xPosition:749,   yPosition:607,  zPosition:1, top:32,  bottom:43,  left:244, right:39,  number:38,  inSafeArea: true)
let pathPoint39 = (xPosition:965,   yPosition:607,  zPosition:1, top:0,   bottom:49,  left:38,  right:40,  number:39,  inSafeArea: true)
let pathPoint40 = (xPosition:1172,  yPosition:607,  zPosition:1, top:33,  bottom:44,  left:39,  right:246, number:40,  inSafeArea: true)
let pathPoint41 = (xPosition:1777,  yPosition:623,  zPosition:1, top:36,  bottom:249, left:0,   right:0,   number:41,  inSafeArea: true)
let pathPoint42 = (xPosition:520,   yPosition:691,  zPosition:1, top:244, bottom:245, left:0,   right:0,   number:42,  inSafeArea: true)
let pathPoint43 = (xPosition:749,   yPosition:691,  zPosition:1, top:38,  bottom:48,  left:0,   right:0,   number:43,  inSafeArea: true)
let pathPoint44 = (xPosition:1172,  yPosition:691,  zPosition:1, top:40,  bottom:50,  left:0,   right:0,   number:44,  inSafeArea: true)
let pathPoint45 = (xPosition:1406,  yPosition:691,  zPosition:1, top:246, bottom:247, left:0,   right:0,   number:45,  inSafeArea: true)
let pathPoint46 = (xPosition:146,   yPosition:732,  zPosition:1, top:37,  bottom:51,  left:0,   right:216, number:46,  inSafeArea: true)
let pathPoint47 = (xPosition:1777,  yPosition:732,  zPosition:1, top:41,  bottom:58,  left:217, right:0,   number:47,  inSafeArea: true)
let pathPoint48 = (xPosition:749,   yPosition:837,  zPosition:1, top:43,  bottom:54,  left:0,   right:0,   number:48,  inSafeArea: true)
let pathPoint49 = (xPosition:965,   yPosition:837,  zPosition:1, top:39,  bottom:65,  left:0,   right:0,   number:49,  inSafeArea: true)
let pathPoint50 = (xPosition:1172,  yPosition:837,  zPosition:1, top:44,  bottom:55,  left:0,   right:0,   number:50,  inSafeArea: true)
let pathPoint51 = (xPosition:146,   yPosition:970,  zPosition:1, top:46,  bottom:59,  left:0,   right:52,  number:51,  inSafeArea: true)
let pathPoint52 = (xPosition:266,   yPosition:970,  zPosition:1, top:216, bottom:60,  left:51,  right:0,   number:52,  inSafeArea: true)
let pathPoint53 = (xPosition:520,   yPosition:970,  zPosition:1, top:42,  bottom:62,  left:0,   right:0,   number:53,  inSafeArea: true)
let pathPoint54 = (xPosition:749,   yPosition:970,  zPosition:1, top:48,  bottom:64,  left:0,   right:0,   number:54,  inSafeArea: true)
let pathPoint55 = (xPosition:1172,  yPosition:970,  zPosition:1, top:50,  bottom:66,  left:0,   right:0,   number:55,  inSafeArea: true)
let pathPoint56 = (xPosition:1406,  yPosition:970,  zPosition:1, top:45,  bottom:68,  left:0,   right:0,   number:56,  inSafeArea: true)
let pathPoint57 = (xPosition:1656,  yPosition:970,  zPosition:1, top:217, bottom:70,  left:0,   right:58,  number:57,  inSafeArea: true)
let pathPoint58 = (xPosition:1777,  yPosition:970,  zPosition:1, top:47,  bottom:71,  left:57,  right:0,   number:58,  inSafeArea: true)
let pathPoint59 = (xPosition:146,   yPosition:1130, zPosition:1, top:51,  bottom:72,  left:0,   right:60,  number:59,  inSafeArea: true)
let pathPoint60 = (xPosition:266,   yPosition:1130, zPosition:1, top:52,  bottom:0,   left:59,  right:61,  number:60,  inSafeArea: true)
let pathPoint61 = (xPosition:354,   yPosition:1130, zPosition:1, top:0,   bottom:0,   left:60,  right:62,  number:61,  inSafeArea: true)
let pathPoint62 = (xPosition:520,   yPosition:1130, zPosition:1, top:53,  bottom:0,   left:61,  right:63,  number:62,  inSafeArea: true)
let pathPoint63 = (xPosition:632,   yPosition:1130, zPosition:1, top:0,   bottom:0,   left:62,  right:64,  number:63,  inSafeArea: true)
let pathPoint64 = (xPosition:749,   yPosition:1130, zPosition:1, top:54,  bottom:0,   left:63,  right:65,  number:64,  inSafeArea: true)
let pathPoint65 = (xPosition:965,   yPosition:1130, zPosition:1, top:49,  bottom:75,  left:64,  right:66,  number:65,  inSafeArea: true)
let pathPoint66 = (xPosition:1172,  yPosition:1130, zPosition:1, top:55,  bottom:0,   left:65,  right:67,  number:66,  inSafeArea: true)
let pathPoint67 = (xPosition:1292,  yPosition:1130, zPosition:1, top:0,   bottom:0,   left:66,  right:68,  number:67,  inSafeArea: true)
let pathPoint68 = (xPosition:1406,  yPosition:1130, zPosition:1, top:56,  bottom:0,   left:67,  right:69,  number:68,  inSafeArea: true)
let pathPoint69 = (xPosition:1577,  yPosition:1130, zPosition:1, top:0,   bottom:0,   left:68,  right:70,  number:69,  inSafeArea: true)
let pathPoint70 = (xPosition:1656,  yPosition:1130, zPosition:1, top:57,  bottom:0,   left:69,  right:71,  number:70,  inSafeArea: true)
let pathPoint71 = (xPosition:1777,  yPosition:1130, zPosition:1, top:58,  bottom:73,  left:70,  right:0,   number:71,  inSafeArea: true)
let pathPoint72 = (xPosition:146,   yPosition:1198, zPosition:1, top:59,  bottom:77,  left:0,   right:0,   number:72,  inSafeArea: true)
let pathPoint73 = (xPosition:1777,  yPosition:1198, zPosition:1, top:71,  bottom:78,  left:0,   right:0,   number:73,  inSafeArea: true)
let pathPoint74 = (xPosition:733,   yPosition:1241, zPosition:1, top:0,   bottom:81,  left:0,   right:75,  number:74,  inSafeArea: false)
let pathPoint75 = (xPosition:965,   yPosition:1241, zPosition:1, top:65,  bottom:0,   left:74,  right:76,  number:75,  inSafeArea: false)
let pathPoint76 = (xPosition:1195,  yPosition:1241, zPosition:1, top:0,   bottom:83,  left:75,  right:0,   number:76,  inSafeArea: false)
let pathPoint77 = (xPosition:146,   yPosition:1302, zPosition:1, top:72,  bottom:79,  left:0,   right:0,   number:77,  inSafeArea: true)
let pathPoint78 = (xPosition:1777,  yPosition:1302, zPosition:1, top:73,  bottom:85,  left:0,   right:0,   number:78,  inSafeArea: true)
let pathPoint79 = (xPosition:146,   yPosition:1413, zPosition:1, top:77,  bottom:88,  left:0,   right:0,   number:79,  inSafeArea: true)
let pathPoint80 = (xPosition:520,   yPosition:1413, zPosition:1, top:0,   bottom:86,  left:0,   right:81,  number:80,  inSafeArea: false)
let pathPoint81 = (xPosition:733,   yPosition:1413, zPosition:1, top:74,  bottom:0,   left:80,  right:82,  number:81,  inSafeArea: false)
let pathPoint82 = (xPosition:965,   yPosition:1413, zPosition:1, top:0,   bottom:94,  left:81,  right:83,  number:82,  inSafeArea: false)
let pathPoint83 = (xPosition:1195,  yPosition:1413, zPosition:1, top:76,  bottom:0,   left:82,  right:84,  number:83,  inSafeArea: false)
let pathPoint84 = (xPosition:1406,  yPosition:1413, zPosition:1, top:0,   bottom:87,  left:83,  right:0,   number:84,  inSafeArea: false)
let pathPoint85 = (xPosition:1777,  yPosition:1413, zPosition:1, top:78,  bottom:91,  left:0,   right:0,   number:85,  inSafeArea: true)
let pathPoint86 = (xPosition:520,   yPosition:1498, zPosition:1, top:80,  bottom:89,  left:0,   right:0,   number:86,  inSafeArea: false)
let pathPoint87 = (xPosition:1406,  yPosition:1498, zPosition:1, top:84,  bottom:90,  left:0,   right:0,   number:87,  inSafeArea: false)
let pathPoint88 = (xPosition:146,   yPosition:1567, zPosition:1, top:79,  bottom:0,   left:0,   right:0,   number:88,  inSafeArea: true)
let pathPoint89 = (xPosition:520,   yPosition:1582, zPosition:1, top:86,  bottom:92,  left:0,   right:0,   number:89,  inSafeArea: false)
let pathPoint90 = (xPosition:1406,  yPosition:1582, zPosition:1, top:87,  bottom:96,  left:0,   right:0,   number:90,  inSafeArea: false)
let pathPoint91 = (xPosition:1777,  yPosition:1567, zPosition:1, top:85,  bottom:0,   left:0,   right:0,   number:91,  inSafeArea: true)
let pathPoint92 = (xPosition:520,   yPosition:1640, zPosition:1, top:89,  bottom:101, left:0,   right:93,  number:92,  inSafeArea: false)
let pathPoint93 = (xPosition:750,   yPosition:1640, zPosition:1, top:0,   bottom:0,   left:92,  right:94,  number:93,  inSafeArea: false)
let pathPoint94 = (xPosition:968,   yPosition:1640, zPosition:1, top:82,  bottom:104, left:93,  right:95,  number:94,  inSafeArea: false)
let pathPoint95 = (xPosition:1173,  yPosition:1640, zPosition:1, top:0,   bottom:0,   left:94,  right:96,  number:95,  inSafeArea: false)
let pathPoint96 = (xPosition:1406,  yPosition:1640, zPosition:1, top:90,  bottom:107, left:95,  right:0,   number:96,  inSafeArea: false)
let pathPoint97 = (xPosition:145,   yPosition:1730, zPosition:1, top:0,   bottom:0,   left:0,   right:98,  number:97,  inSafeArea: false)
let pathPoint98 = (xPosition:252,   yPosition:1730, zPosition:1, top:0,   bottom:0,   left:97,  right:99,  number:98,  inSafeArea: false)
let pathPoint99 = (xPosition:353,   yPosition:1730, zPosition:1, top:0,   bottom:0,   left:98,  right:100, number:99,  inSafeArea: false)
let pathPoint100 = (xPosition:436,  yPosition:1730, zPosition:1, top:0,   bottom:0,   left:99,  right:101, number:100, inSafeArea: false)
let pathPoint101 = (xPosition:520,  yPosition:1730, zPosition:1, top:92,  bottom:0,   left:100, right:102, number:101, inSafeArea: false)
let pathPoint102 = (xPosition:705,  yPosition:1730, zPosition:1, top:0,   bottom:0,   left:101, right:103, number:102, inSafeArea: false)
let pathPoint103 = (xPosition:775,  yPosition:1730, zPosition:1, top:0,   bottom:0,   left:102, right:104, number:103, inSafeArea: false)
let pathPoint104 = (xPosition:968,  yPosition:1730, zPosition:1, top:94,  bottom:0,   left:103, right:105, number:104, inSafeArea: false)
let pathPoint105 = (xPosition:1156, yPosition:1730, zPosition:1, top:0,   bottom:0,   left:104, right:106, number:105, inSafeArea: false)
let pathPoint106 = (xPosition:1234, yPosition:1730, zPosition:1, top:0,   bottom:0,   left:105, right:107, number:106, inSafeArea: false)
let pathPoint107 = (xPosition:1406, yPosition:1730, zPosition:1, top:96,  bottom:0,   left:106, right:108, number:107, inSafeArea: false)
let pathPoint108 = (xPosition:1493, yPosition:1730, zPosition:1, top:0,   bottom:0,   left:107, right:109, number:108, inSafeArea: false)
let pathPoint109 = (xPosition:1577, yPosition:1730, zPosition:1, top:0,   bottom:0,   left:108, right:110, number:109, inSafeArea: false)
let pathPoint110 = (xPosition:1673, yPosition:1730, zPosition:1, top:0,   bottom:0,   left:109, right:111, number:110, inSafeArea: false)
let pathPoint111 = (xPosition:1779, yPosition:1730, zPosition:1, top:0,   bottom:0,   left:110, right:0,   number:111, inSafeArea: false)

let pathPoint112 = (xPosition:144,  yPosition:214,  zPosition:2, top:0,   bottom:127, left:0,   right:113, number:112, inSafeArea: true)
let pathPoint113 = (xPosition:267,  yPosition:214,  zPosition:2, top:0,   bottom:0,   left:112, right:114, number:113, inSafeArea: true)
let pathPoint114 = (xPosition:422,  yPosition:214,  zPosition:2, top:0,   bottom:0,   left:113, right:115, number:114, inSafeArea: true)
let pathPoint115 = (xPosition:498,  yPosition:214,  zPosition:2, top:0,   bottom:0,   left:114, right:116, number:115, inSafeArea: true)
let pathPoint116 = (xPosition:617,  yPosition:214,  zPosition:2, top:0,   bottom:0,   left:115, right:117, number:116, inSafeArea: true)
let pathPoint117 = (xPosition:750,  yPosition:214,  zPosition:2, top:0,   bottom:0,   left:116, right:118, number:117, inSafeArea: true)
let pathPoint118 = (xPosition:854,  yPosition:214,  zPosition:2, top:0,   bottom:0,   left:117, right:119, number:118, inSafeArea: true)
let pathPoint119 = (xPosition:966,  yPosition:214,  zPosition:2, top:0,   bottom:130, left:118, right:120, number:119, inSafeArea: true)
let pathPoint120 = (xPosition:1081, yPosition:214,  zPosition:2, top:0,   bottom:0,   left:119, right:121, number:120, inSafeArea: true)
let pathPoint121 = (xPosition:1176, yPosition:214,  zPosition:2, top:0,   bottom:0,   left:120, right:122, number:121, inSafeArea: true)
let pathPoint122 = (xPosition:1311, yPosition:214,  zPosition:2, top:0,   bottom:0,   left:121, right:123, number:122, inSafeArea: true)
let pathPoint123 = (xPosition:1424, yPosition:214,  zPosition:2, top:0,   bottom:0,   left:122, right:124, number:123, inSafeArea: true)
let pathPoint124 = (xPosition:1510, yPosition:214,  zPosition:2, top:0,   bottom:0,   left:123, right:125, number:124, inSafeArea: true)
let pathPoint125 = (xPosition:1660, yPosition:214,  zPosition:2, top:0,   bottom:0,   left:124, right:126, number:125, inSafeArea: true)
let pathPoint126 = (xPosition:1778, yPosition:214,  zPosition:2, top:0,   bottom:128, left:125, right:0,   number:126, inSafeArea: true)
let pathPoint127 = (xPosition:144,  yPosition:277,  zPosition:2, top:112, bottom:129, left:0,   right:0,   number:127, inSafeArea: true)
let pathPoint128 = (xPosition:1778, yPosition:277,  zPosition:2, top:126, bottom:131, left:0,   right:0,   number:128, inSafeArea: true)
let pathPoint129 = (xPosition:144,  yPosition:345,  zPosition:2, top:127, bottom:132, left:0,   right:0,   number:129, inSafeArea: true)
let pathPoint130 = (xPosition:966,  yPosition:321,  zPosition:2, top:119, bottom:136, left:0,   right:0,   number:130, inSafeArea: true)
let pathPoint131 = (xPosition:1778, yPosition:345,  zPosition:2, top:128, bottom:133, left:0,   right:0,   number:131, inSafeArea: true)
let pathPoint132 = (xPosition:144,  yPosition:421,  zPosition:2, top:129, bottom:134, left:0,   right:0,   number:132, inSafeArea: true)
let pathPoint133 = (xPosition:1778, yPosition:421,  zPosition:2, top:131, bottom:138, left:0,   right:0,   number:133, inSafeArea: true)
let pathPoint134 = (xPosition:144,  yPosition:500,  zPosition:2, top:132, bottom:139, left:0,   right:0,   number:134, inSafeArea: true)
let pathPoint135 = (xPosition:498,  yPosition:588,  zPosition:2, top:0,   bottom:218, left:0,   right:219, number:135, inSafeArea: false)
let pathPoint136 = (xPosition:966,  yPosition:588,  zPosition:2, top:130, bottom:143, left:219, right:220, number:136, inSafeArea: false)
let pathPoint137 = (xPosition:1424, yPosition:588,  zPosition:2, top:0,   bottom:221, left:220, right:0,   number:137, inSafeArea: false)
let pathPoint138 = (xPosition:1778, yPosition:500,  zPosition:2, top:133, bottom:140, left:0,   right:0,   number:138, inSafeArea: true)
let pathPoint139 = (xPosition:144,  yPosition:621,  zPosition:2, top:134, bottom:141, left:0,   right:0,   number:139, inSafeArea: true)
let pathPoint140 = (xPosition:1778, yPosition:621,  zPosition:2, top:138, bottom:145, left:0,   right:0,   number:140, inSafeArea: true)
let pathPoint141 = (xPosition:144,  yPosition:732,  zPosition:2, top:139, bottom:146, left:0,   right:0,   number:141, inSafeArea: true)
let pathPoint142 = (xPosition:737,  yPosition:683,  zPosition:2, top:0,   bottom:149, left:0,   right:143, number:142, inSafeArea: false)
let pathPoint143 = (xPosition:966,  yPosition:683,  zPosition:2, top:136, bottom:150, left:142, right:144, number:143, inSafeArea: false)
let pathPoint144 = (xPosition:1195, yPosition:683,  zPosition:2, top:0,   bottom:151, left:143, right:0,   number:144, inSafeArea: false)
let pathPoint145 = (xPosition:1778, yPosition:732,  zPosition:2, top:140, bottom:154, left:0,   right:0,   number:145, inSafeArea: true)
let pathPoint146 = (xPosition:144,  yPosition:968,  zPosition:2, top:141, bottom:162, left:0,   right:147, number:146, inSafeArea: true)
let pathPoint147 = (xPosition:314,  yPosition:968,  zPosition:2, top:0,   bottom:155, left:146, right:148, number:147, inSafeArea: true)
let pathPoint148 = (xPosition:498,  yPosition:968,  zPosition:2, top:218, bottom:156, left:147, right:0,   number:148, inSafeArea: false)
let pathPoint149 = (xPosition:737,  yPosition:968,  zPosition:2, top:142, bottom:157, left:0,   right:0,   number:149, inSafeArea: false)
let pathPoint150 = (xPosition:966,  yPosition:968,  zPosition:2, top:143, bottom:158, left:0,   right:0,   number:150, inSafeArea: false)
let pathPoint151 = (xPosition:1195, yPosition:968,  zPosition:2, top:144, bottom:159, left:0,   right:0,   number:151, inSafeArea: false)
let pathPoint152 = (xPosition:1424, yPosition:968,  zPosition:2, top:221, bottom:160, left:0,   right:153, number:152, inSafeArea: false)
let pathPoint153 = (xPosition:1606, yPosition:968,  zPosition:2, top:0,   bottom:161, left:152, right:154, number:153, inSafeArea: true)
let pathPoint154 = (xPosition:1778, yPosition:968,  zPosition:2, top:145, bottom:163, left:153, right:0,   number:154, inSafeArea: true)
let pathPoint155 = (xPosition:314,  yPosition:1130, zPosition:2, top:147, bottom:0,   left:214, right:0,   number:155, inSafeArea: true)
let pathPoint156 = (xPosition:498,  yPosition:1130, zPosition:2, top:148, bottom:0,   left:0,   right:157, number:156, inSafeArea: false)
let pathPoint157 = (xPosition:737,  yPosition:1130, zPosition:2, top:149, bottom:168, left:156, right:158, number:157, inSafeArea: false)
let pathPoint158 = (xPosition:966,  yPosition:1130, zPosition:2, top:150, bottom:169, left:157, right:159, number:158, inSafeArea: false)
let pathPoint159 = (xPosition:1195, yPosition:1130, zPosition:2, top:151, bottom:170, left:158, right:160, number:159, inSafeArea: false)
let pathPoint160 = (xPosition:1424, yPosition:1130, zPosition:2, top:152, bottom:0,   left:159, right:0,   number:160, inSafeArea: false)
let pathPoint161 = (xPosition:1608, yPosition:1130, zPosition:2, top:153, bottom:0,   left:0,   right:215, number:161, inSafeArea: true)
let pathPoint162 = (xPosition:144,  yPosition:1196, zPosition:2, top:214, bottom:164, left:0,   right:0,   number:162, inSafeArea: true)
let pathPoint163 = (xPosition:1778, yPosition:1196, zPosition:2, top:215, bottom:165, left:0,   right:0,   number:163, inSafeArea: true)
let pathPoint164 = (xPosition:144,  yPosition:1300, zPosition:2, top:162, bottom:166, left:0,   right:0,   number:164, inSafeArea: true)
let pathPoint165 = (xPosition:1778, yPosition:1300, zPosition:2, top:163, bottom:172, left:0,   right:0,   number:165, inSafeArea: true)
let pathPoint166 = (xPosition:144,  yPosition:1414, zPosition:2, top:164, bottom:175, left:0,   right:0,   number:166, inSafeArea: true)
let pathPoint167 = (xPosition:517,  yPosition:1414, zPosition:2, top:0,   bottom:173, left:0,   right:168, number:167, inSafeArea: false)
let pathPoint168 = (xPosition:737,  yPosition:1414, zPosition:2, top:157, bottom:0,   left:167, right:169, number:168, inSafeArea: false)
let pathPoint169 = (xPosition:966,  yPosition:1414, zPosition:2, top:158, bottom:181, left:168, right:170, number:169, inSafeArea: false)
let pathPoint170 = (xPosition:1195, yPosition:1414, zPosition:2, top:159, bottom:0,   left:169, right:171, number:170, inSafeArea: false)
let pathPoint171 = (xPosition:1406, yPosition:1414, zPosition:2, top:0,   bottom:174, left:170, right:0,   number:171, inSafeArea: false)
let pathPoint172 = (xPosition:1778, yPosition:1414, zPosition:2, top:165, bottom:178, left:0,   right:0,   number:172, inSafeArea: true)
let pathPoint173 = (xPosition:517,  yPosition:1500, zPosition:2, top:167, bottom:176, left:0,   right:0,   number:173, inSafeArea: false)
let pathPoint174 = (xPosition:1406, yPosition:1500, zPosition:2, top:171, bottom:177, left:0,   right:0,   number:174, inSafeArea: false)
let pathPoint175 = (xPosition:144,  yPosition:1565, zPosition:2, top:166, bottom:0,   left:0,   right:0,   number:175, inSafeArea: true)
let pathPoint176 = (xPosition:517,  yPosition:1583, zPosition:2, top:173, bottom:179, left:0,   right:0,   number:176, inSafeArea: false)
let pathPoint177 = (xPosition:1406, yPosition:1583, zPosition:2, top:174, bottom:183, left:0,   right:0,   number:177, inSafeArea: false)
let pathPoint178 = (xPosition:1778, yPosition:1565, zPosition:2, top:172, bottom:0,   left:0,   right:0,   number:178, inSafeArea: true)
let pathPoint179 = (xPosition:517,  yPosition:1638, zPosition:2, top:176, bottom:188, left:0,   right:180, number:179, inSafeArea: false)
let pathPoint180 = (xPosition:749,  yPosition:1638, zPosition:2, top:0,   bottom:0,   left:179, right:181, number:180, inSafeArea: false)
let pathPoint181 = (xPosition:966,  yPosition:1638, zPosition:2, top:169, bottom:191, left:180, right:181, number:181, inSafeArea: false)
let pathPoint182 = (xPosition:1176, yPosition:1638, zPosition:2, top:0,   bottom:0,   left:181, right:183, number:182, inSafeArea: false)
let pathPoint183 = (xPosition:1406, yPosition:1638, zPosition:2, top:177, bottom:194, left:182, right:0,   number:183, inSafeArea: false)
let pathPoint184 = (xPosition:144,  yPosition:1728, zPosition:2, top:0,   bottom:0,   left:0,   right:185, number:184, inSafeArea: false)
let pathPoint185 = (xPosition:252,  yPosition:1728, zPosition:2, top:0,   bottom:0,   left:184, right:186, number:185, inSafeArea: false)
let pathPoint186 = (xPosition:335,  yPosition:1728, zPosition:2, top:0,   bottom:0,   left:185, right:187, number:186, inSafeArea: false)
let pathPoint187 = (xPosition:424,  yPosition:1728, zPosition:2, top:0,   bottom:0,   left:186, right:188, number:187, inSafeArea: false)
let pathPoint188 = (xPosition:517,  yPosition:1728, zPosition:2, top:179, bottom:0,   left:187, right:189, number:188, inSafeArea: false)
let pathPoint189 = (xPosition:705,  yPosition:1728, zPosition:2, top:0,   bottom:0,   left:188, right:190, number:189, inSafeArea: false)
let pathPoint190 = (xPosition:775,  yPosition:1728, zPosition:2, top:0,   bottom:0,   left:189, right:191, number:190, inSafeArea: false)
let pathPoint191 = (xPosition:966,  yPosition:1728, zPosition:2, top:181, bottom:0,   left:190, right:192, number:191, inSafeArea: false)
let pathPoint192 = (xPosition:1158, yPosition:1728, zPosition:2, top:0,   bottom:0,   left:191, right:193, number:192, inSafeArea: false)
let pathPoint193 = (xPosition:1233, yPosition:1728, zPosition:2, top:0,   bottom:0,   left:192, right:194, number:193, inSafeArea: false)
let pathPoint194 = (xPosition:1406, yPosition:1728, zPosition:2, top:183, bottom:0,   left:193, right:195, number:194, inSafeArea: false)
let pathPoint195 = (xPosition:1500, yPosition:1728, zPosition:2, top:0,   bottom:0,   left:194, right:196, number:195, inSafeArea: false)
let pathPoint196 = (xPosition:1576, yPosition:1728, zPosition:2, top:0,   bottom:0,   left:195, right:197, number:196, inSafeArea: false)
let pathPoint197 = (xPosition:1675, yPosition:1728, zPosition:2, top:0,   bottom:0,   left:196, right:198, number:197, inSafeArea: false)
let pathPoint198 = (xPosition:1778, yPosition:1728, zPosition:2, top:0,   bottom:0,   left:197, right:0,   number:198, inSafeArea: false)

//停车场的像素和前两张不同，要小一点
let pathPoint199 = (xPosition:735,  yPosition:1243, zPosition:0, top:0,   bottom:224, left:0,   right:222, number:199, inSafeArea: false)
let pathPoint200 = (xPosition:963,  yPosition:1243, zPosition:0, top:0,   bottom:225, left:222, right:223, number:200, inSafeArea: false)
let pathPoint201 = (xPosition:1191, yPosition:1243, zPosition:0, top:0,   bottom:226, left:223, right:0,   number:201, inSafeArea: false)
let pathPoint202 = (xPosition:522,  yPosition:1491, zPosition:0, top:0,   bottom:231, left:0,   right:227, number:202, inSafeArea: false)
let pathPoint203 = (xPosition:735,  yPosition:1491, zPosition:0, top:224, bottom:232, left:227, right:228, number:203, inSafeArea: false)
let pathPoint204 = (xPosition:963,  yPosition:1491, zPosition:0, top:225, bottom:233, left:228, right:229, number:204, inSafeArea: false)
let pathPoint205 = (xPosition:1191, yPosition:1491, zPosition:0, top:226, bottom:234, left:229, right:230, number:205, inSafeArea: false)
let pathPoint206 = (xPosition:1399, yPosition:1491, zPosition:0, top:0,   bottom:235, left:230, right:0,   number:206, inSafeArea: false)
let pathPoint207 = (xPosition:251,  yPosition:1734, zPosition:0, top:0,   bottom:0,   left:0,   right:236, number:207, inSafeArea: false)
let pathPoint208 = (xPosition:522,  yPosition:1734, zPosition:0, top:231, bottom:0,   left:236, right:237, number:208, inSafeArea: false)
let pathPoint209 = (xPosition:735,  yPosition:1734, zPosition:0, top:232, bottom:0,   left:237, right:238, number:209, inSafeArea: false)
let pathPoint210 = (xPosition:963,  yPosition:1734, zPosition:0, top:233, bottom:0,   left:238, right:239, number:210, inSafeArea: false)
let pathPoint211 = (xPosition:1191, yPosition:1734, zPosition:0, top:234, bottom:0,   left:239, right:240, number:211, inSafeArea: false)
let pathPoint212 = (xPosition:1399, yPosition:1734, zPosition:0, top:235, bottom:0,   left:240, right:241, number:212, inSafeArea: false)
let pathPoint213 = (xPosition:1673, yPosition:1734, zPosition:0, top:0,   bottom:0,   left:241, right:0,   number:213, inSafeArea: false)

//新增两个点
let pathPoint214 = (xPosition:144,  yPosition:1130, zPosition:2, top:146, bottom:162, left:0,   right:155, number:214, inSafeArea: true)
let pathPoint215 = (xPosition:1778, yPosition:1130, zPosition:2, top:154, bottom:163, left:161, right:0,   number:215, inSafeArea: true)

//新增六个点
let pathPoint216 = (xPosition:266,  yPosition:732,  zPosition:1, top:242, bottom:52,  left:46,  right:245, number:216, inSafeArea:true)
let pathPoint217 = (xPosition:1656, yPosition:732,  zPosition:1, top:243, bottom:57,  left:247, right:47,   number:217, inSafeArea:true)
let pathPoint218 = (xPosition:498,  yPosition:740,  zPosition:2, top:135, bottom:148, left:0,   right:0,   number:218, inSafeArea:false)
let pathPoint219 = (xPosition:737,  yPosition:588,  zPosition:2, top:0,   bottom:0,   left:135, right:136, number:219, inSafeArea:false)
let pathPoint220 = (xPosition:1195, yPosition:588,  zPosition:2, top:0,   bottom:0,   left:136, right:137, number:220, inSafeArea:false)
let pathPoint221 = (xPosition:1423, yPosition:740,  zPosition:2, top:137, bottom:152, left:0,   right:0,   number:221, inSafeArea:false)

//新增停车场的点
let pathPoint222 = (xPosition:849,  yPosition:1243, zPosition:0, top:0,   bottom:0,   left:199, right:200, number:222, inSafeArea:false)
let pathPoint223 = (xPosition:1077, yPosition:1243, zPosition:0, top:0,   bottom:0,   left:200, right:201, number:223, inSafeArea:false)
let pathPoint224 = (xPosition:735,  yPosition:1367, zPosition:0, top:199, bottom:203, left:0,   right:0,   number:224, inSafeArea:false)
let pathPoint225 = (xPosition:963,  yPosition:1367, zPosition:0, top:200, bottom:204, left:0,   right:0,   number:225, inSafeArea:false)
let pathPoint226 = (xPosition:1191, yPosition:1367, zPosition:0, top:201, bottom:205, left:0,   right:0,   number:226, inSafeArea:false)
let pathPoint227 = (xPosition:629,  yPosition:1491, zPosition:0, top:0,   bottom:0,   left:202, right:203, number:227, inSafeArea:false)
let pathPoint228 = (xPosition:849,  yPosition:1491, zPosition:0, top:0,   bottom:0,   left:203, right:204, number:228, inSafeArea:false)
let pathPoint229 = (xPosition:1077, yPosition:1491, zPosition:0, top:0,   bottom:0,   left:204, right:205, number:229, inSafeArea:false)
let pathPoint230 = (xPosition:1295, yPosition:1491, zPosition:0, top:0,   bottom:0,   left:205, right:206, number:230, inSafeArea:false)
let pathPoint231 = (xPosition:522,  yPosition:1612, zPosition:0, top:202, bottom:208, left:0,   right:0,   number:231, inSafeArea:false)
let pathPoint232 = (xPosition:735,  yPosition:1612, zPosition:0, top:203, bottom:209, left:0,   right:0,   number:232, inSafeArea:false)
let pathPoint233 = (xPosition:963,  yPosition:1612, zPosition:0, top:204, bottom:210, left:0,   right:0,   number:233, inSafeArea:false)
let pathPoint234 = (xPosition:1191, yPosition:1612, zPosition:0, top:205, bottom:211, left:0,   right:0,   number:234, inSafeArea:false)
let pathPoint235 = (xPosition:1399, yPosition:1612, zPosition:0, top:206, bottom:212, left:0,   right:0,   number:235, inSafeArea:false)
let pathPoint236 = (xPosition:386,  yPosition:1734, zPosition:0, top:0,   bottom:0,   left:207, right:208, number:236, inSafeArea:false)
let pathPoint237 = (xPosition:629,  yPosition:1734, zPosition:0, top:0,   bottom:0,   left:208, right:209, number:237, inSafeArea:false)
let pathPoint238 = (xPosition:849,  yPosition:1734, zPosition:0, top:0,   bottom:0,   left:209, right:210, number:238, inSafeArea:false)
let pathPoint239 = (xPosition:1077, yPosition:1734, zPosition:0, top:0,   bottom:0,   left:210, right:211, number:239, inSafeArea:false)
let pathPoint240 = (xPosition:1295, yPosition:1734, zPosition:0, top:0,   bottom:0,   left:211, right:212, number:240, inSafeArea:false)
let pathPoint241 = (xPosition:1536, yPosition:1734, zPosition:0, top:0,   bottom:0,   left:212, right:213, number:241, inSafeArea:false)

//一楼的新增点
let pathPoint242 = (xPosition:266,  yPosition:607,  zPosition:1, top:30,  bottom:216, left:248, right:244, number:242, inSafeArea:true)
let pathPoint243 = (xPosition:1656, yPosition:607,  zPosition:1, top:35,  bottom:217, left:246, right:249, number:243, inSafeArea:true)
let pathPoint244 = (xPosition:520,  yPosition:607,  zPosition:1, top:31,  bottom:42,  left:242, right:38,  number:244, inSafeArea:true)
let pathPoint245 = (xPosition:520,  yPosition:732,  zPosition:1, top:42,  bottom:53,  left:216, right:0,   number:245, inSafeArea:true)
let pathPoint246 = (xPosition:1406, yPosition:607,  zPosition:1, top:34,  bottom:45,  left:40,  right:243, number:246, inSafeArea:true)
let pathPoint247 = (xPosition:1406, yPosition:732,  zPosition:1, top:45,  bottom:56,  left:0,   right:217, number:247, inSafeArea:true)
let pathPoint248 = (xPosition:146,  yPosition:607,  zPosition:1, top:29,  bottom:37,  left:0,   right:242, number:248, inSafeArea:true)
let pathPoint249 = (xPosition:1777, yPosition:607,  zPosition:1, top:36,  bottom:41,  left:243, right:0,   number:249, inSafeArea:true)

let nearAreaDictionary = [1:areaArray1, 2:areaArray2, 3:areaArray3, 4:areaArray4, 5:areaArray5, 6:areaArray6, 7:areaArray7, 8:areaArray8,
    9:areaArray9, 10:areaArray10, 11:areaArray11, 12:areaArray12, 13:areaArray13, 14:areaArray14, 15:areaArray15, 17:areaArray17,
    20:areaArray20, 22:areaArray22, 23:areaArray23, 24:areaArray24, 26:areaArray26, 28:areaArray28, 29:areaArray29, 30:areaArray30,
    31:areaArray31, 32:areaArray32, 34:areaArray34, 37:areaArray37, 39:areaArray39, 40:areaArray40, 41:areaArray41, 42:areaArray42]

//结点库，字典，键值为点号，值为点的元祖形式
let nodeData = [001 : pathPoint1, 002 : pathPoint2, 003 : pathPoint3, 004 : pathPoint4, 005 : pathPoint5, 006 : pathPoint6,
    007 : pathPoint7,   008 : pathPoint8,   009 : pathPoint9,   010 : pathPoint10,  011 : pathPoint11,
    012 : pathPoint12,  013 : pathPoint13,  014 : pathPoint14,  015 : pathPoint15,  016 : pathPoint16,
    017 : pathPoint17,  018 : pathPoint18,  019 : pathPoint19,  020 : pathPoint20,  021 : pathPoint21,
    022 : pathPoint22,  023 : pathPoint23,  024 : pathPoint24,  025 : pathPoint25,  026 : pathPoint26,
    027 : pathPoint27,  028 : pathPoint28,  029 : pathPoint29,  030 : pathPoint30,  031 : pathPoint31,
    032 : pathPoint32,  033 : pathPoint33,  034 : pathPoint34,  035 : pathPoint35,  036 : pathPoint36,
    037 : pathPoint37,  038 : pathPoint38,  039 : pathPoint39,  040 : pathPoint40,  041 : pathPoint41,
    042 : pathPoint42,  043 : pathPoint43,  044 : pathPoint44,  045 : pathPoint45,  046 : pathPoint46,
    047 : pathPoint47,  048 : pathPoint48,  049 : pathPoint49,  050 : pathPoint50,  051 : pathPoint51,
    052 : pathPoint52,  053 : pathPoint53,  054 : pathPoint54,  055 : pathPoint55,  056 : pathPoint56,
    057 : pathPoint57,  058 : pathPoint58,  059 : pathPoint59,  060 : pathPoint60,  061 : pathPoint61,
    062 : pathPoint62,  063 : pathPoint63,  064 : pathPoint64,  065 : pathPoint65,  066 : pathPoint66,
    067 : pathPoint67,  068 : pathPoint68,  069 : pathPoint69,  070 : pathPoint70,  071 : pathPoint71,
    072 : pathPoint72,  073 : pathPoint73,  074 : pathPoint74,  075 : pathPoint75,  076 : pathPoint76,
    077 : pathPoint77,  078 : pathPoint78,  079 : pathPoint79,  080 : pathPoint80,  081 : pathPoint81,
    082 : pathPoint82,  083 : pathPoint83,  084 : pathPoint84,  085 : pathPoint85,  086 : pathPoint86,
    087 : pathPoint87,  088 : pathPoint88,  089 : pathPoint89,  090 : pathPoint90,  091 : pathPoint91,
    092 : pathPoint92,  093 : pathPoint93,  094 : pathPoint94,  095 : pathPoint95,  096 : pathPoint96,
    097 : pathPoint97,  098 : pathPoint98,  099 : pathPoint99,  100 : pathPoint100, 101 : pathPoint101,
    102 : pathPoint102, 103 : pathPoint103, 104 : pathPoint104, 105 : pathPoint105, 106 : pathPoint106,
    107 : pathPoint107, 108 : pathPoint108, 109 : pathPoint109, 110 : pathPoint110, 111 : pathPoint111,
    112 : pathPoint112, 113 : pathPoint113, 114 : pathPoint114, 115 : pathPoint115, 116 : pathPoint116,
    117 : pathPoint117, 118 : pathPoint118, 119 : pathPoint119, 120 : pathPoint120, 121 : pathPoint121,
    122 : pathPoint122, 123 : pathPoint123, 124 : pathPoint124, 125 : pathPoint125, 126 : pathPoint126,
    127 : pathPoint127, 128 : pathPoint128, 129 : pathPoint129, 130 : pathPoint130, 131 : pathPoint131,
    132 : pathPoint132, 133 : pathPoint133, 134 : pathPoint134, 135 : pathPoint135, 136 : pathPoint136,
    137 : pathPoint137, 138 : pathPoint138, 139 : pathPoint139, 140 : pathPoint140, 141 : pathPoint141,
    142 : pathPoint142, 143 : pathPoint143, 144 : pathPoint144, 145 : pathPoint145, 146 : pathPoint146,
    147 : pathPoint147, 148 : pathPoint148, 149 : pathPoint149, 150 : pathPoint150, 151 : pathPoint151,
    152 : pathPoint152, 153 : pathPoint153, 154 : pathPoint154, 155 : pathPoint155, 156 : pathPoint156,
    157 : pathPoint157, 158 : pathPoint158, 159 : pathPoint159, 160 : pathPoint160, 161 : pathPoint161,
    162 : pathPoint162, 163 : pathPoint163, 164 : pathPoint164, 165 : pathPoint165, 166 : pathPoint166,
    167 : pathPoint167, 168 : pathPoint168, 169 : pathPoint169, 170 : pathPoint170, 171 : pathPoint171,
    172 : pathPoint172, 173 : pathPoint173, 174 : pathPoint174, 175 : pathPoint175, 176 : pathPoint176,
    177 : pathPoint177, 178 : pathPoint178, 179 : pathPoint179, 180 : pathPoint180, 181 : pathPoint181,
    182 : pathPoint182, 183 : pathPoint183, 184 : pathPoint184, 185 : pathPoint185, 186 : pathPoint186,
    187 : pathPoint187, 188 : pathPoint188, 189 : pathPoint189, 190 : pathPoint190, 191 : pathPoint191,
    192 : pathPoint192, 193 : pathPoint193, 194 : pathPoint194, 195 : pathPoint195, 196 : pathPoint196,
    197 : pathPoint197, 198 : pathPoint198, 199 : pathPoint199, 200 : pathPoint200, 201 : pathPoint201,
    202 : pathPoint202, 203 : pathPoint203, 204 : pathPoint204, 205 : pathPoint205, 206 : pathPoint206,
    207 : pathPoint207, 208 : pathPoint208, 209 : pathPoint209, 210 : pathPoint210, 211 : pathPoint211,
    212 : pathPoint212, 213 : pathPoint213, 214 : pathPoint214, 215 : pathPoint215, 216 : pathPoint216,
    217 : pathPoint217, 218 : pathPoint218, 219 : pathPoint219, 220 : pathPoint220, 221 : pathPoint221,
    222 : pathPoint222, 223 : pathPoint223, 224 : pathPoint224, 225 : pathPoint225, 226 : pathPoint226,
    227 : pathPoint227, 228 : pathPoint228, 229 : pathPoint229, 230 : pathPoint230, 231 : pathPoint231,
    232 : pathPoint232, 233 : pathPoint233, 234 : pathPoint234, 235 : pathPoint235, 236 : pathPoint236,
    237 : pathPoint237, 238 : pathPoint238, 239 : pathPoint239, 240 : pathPoint240, 241 : pathPoint241,
    242 : pathPoint242, 243 : pathPoint243, 244 : pathPoint244, 245 : pathPoint245, 246 : pathPoint246,
    247 : pathPoint247, 248 : pathPoint248, 249 : pathPoint249]

//entity信息 元组
//1relatingnode
let FS1 = (title:"中华特产中心", subtitle:"subtitleF1", description:"descriptionF1", x:699, y:1846, z:1, relateroutenode:102, Secondrelateroutenode:0, image:"中华特产中心")
let FS2 = (title:"番禺特产", subtitle:"subtitleF2", description:"descriptionF2", x:769, y:1846, z:1, relateroutenode:103, Secondrelateroutenode:0, image:"番禺特产")
let FS3 = (title:"basket Case", subtitle:"subtitleF3", description:"descriptionF3", x:1158, y:1846, z:1, relateroutenode:105, Secondrelateroutenode:0, image:"basket Case")
let FS4 = (title:"汉堡王", subtitle:"subtitleF4", description:"descriptionF4", x:1231, y:1846, z:1, relateroutenode:106, Secondrelateroutenode:0, image:"汉堡王")
let FS5 = (title:"府城", subtitle:"subtitleF5", description:"descriptionF5", x:699, y:1503, z:1, relateroutenode:81, Secondrelateroutenode:0, image:"府城")
let FS6 = (title:"厚道人家", subtitle:"subtitleF6", description:"descriptionF6", x:769, y:1503, z:1, relateroutenode:81, Secondrelateroutenode:0, image:"厚道人家")
let FS7 = (title:"COCOBOOK", subtitle:"subtitleF7", description:"descriptionF7", x:1158, y:1503, z:1, relateroutenode:83, Secondrelateroutenode:0, image:"COCOBOOK")
let FS8 = (title:"奶奶的书屋", subtitle:"subtitleF8", description:"descriptionF8", x:1231, y:1503, z:1, relateroutenode:83, Secondrelateroutenode:0, image:"奶奶的书屋")
let FS9 = (title:"happyBags", subtitle:"subtitleF9", description:"descriptionF9", x:422, y:1428, z:1, relateroutenode:80, Secondrelateroutenode:0, image:"happyBags")
let FS10 = (title:"阿玛尼", subtitle:"subtitleF10", description:"descriptionF10", x:422, y:1503, z:1, relateroutenode:86, Secondrelateroutenode:0, image:"阿玛尼")
let FS11 = (title:"OLAY", subtitle:"subtitleF11", description:"descriptionF11", x:422, y:1577, z:1, relateroutenode:89, Secondrelateroutenode:0, image:"OLAY")
let FS12 = (title:"KENZO", subtitle:"subtitleF12", description:"descriptionF12", x:350, y:1577, z:1, relateroutenode:99, Secondrelateroutenode:0, image:"KENZO")
let FS13 = (title:"乡村基", subtitle:"subtitleF13", description:"descriptionF13", x:1502, y:1428, z:1, relateroutenode:84, Secondrelateroutenode:0, image:"乡村基")
let FS14 = (title:"一品珠", subtitle:"subtitleF14", description:"descriptionF14", x:1502, y:1503, z:1, relateroutenode:87, Secondrelateroutenode:0, image:"一品珠")
let FS15 = (title:"银树西餐厅", subtitle:"subtitleF15", description:"descriptionF15", x:1502, y:1577, z:1, relateroutenode:90, Secondrelateroutenode:0, image:"银树西餐厅")
let FS16 = (title:"欧洲之星", subtitle:"subtitleF16", description:"descriptionF16", x:1577, y:1577, z:1, relateroutenode:109, Secondrelateroutenode:0, image:"欧洲之星")
let FS18 = (title:"Ballantine's", subtitle:"subtitleF18", description:"descriptionF18", x:277, y:1303, z:1, relateroutenode:77, Secondrelateroutenode:0, image:"Ballantine's")
let FS19 = (title:"Cartier", subtitle:"subtitleF19", description:"descriptionF19", x:277, y:1377, z:1, relateroutenode:79, Secondrelateroutenode:0, image:"Cartier")
let FS20 = (title:"BURBERRY", subtitle:"subtitleF20", description:"descriptionF20", x:349, y:1230, z:1, relateroutenode:61, Secondrelateroutenode:0, image:"BURBERRY")
let FS22 = (title:"PRADA", subtitle:"subtitleF22", description:"descriptionF22", x:1651, y:1303, z:1, relateroutenode:78, Secondrelateroutenode:0, image:"PRADA")
let FS23 = (title:"VERSACE", subtitle:"subtitleF23", description:"descriptionF23", x:1651, y:1377, z:1, relateroutenode:85, Secondrelateroutenode:0, image:"VERSACE")
let FS24 = (title:"Kiss Me", subtitle:"subtitleF24", description:"descriptionF24", x:1579, y:1230, z:1, relateroutenode:69, Secondrelateroutenode:0, image:"Kiss Me")
let FS25 = (title:"Carry Lolland", subtitle:"subtitleF25", description:"descriptionF25", x:351, y:348, z:1, relateroutenode:17, Secondrelateroutenode:0, image:"Carry Lolland")
let FS26 = (title:"CHAILI", subtitle:"subtitleF26", description:"descriptionF26", x:351, y:425, z:1, relateroutenode:23, Secondrelateroutenode:0, image:"CHAILI")
let FS27 = (title:"WOMEN'S COLLECTION", subtitle:"subtitleF27", description:"descriptionF27", x:351, y:500, z:1, relateroutenode:30, Secondrelateroutenode:0, image:"WOMEN'S COLLECTION")
let FS28 = (title:"LV", subtitle:"subtitleF28", description:"descriptionF28", x:425, y:348, z:1, relateroutenode:18, Secondrelateroutenode:0, image:"LV")
let FS29 = (title:"wowo超市", subtitle:"subtitleF29", description:"descriptionF29", x:425, y:425, z:1, relateroutenode:24, Secondrelateroutenode:0, image:"wowo超市")
let FS30 = (title:"阑韵书屋", subtitle:"subtitleF30", description:"descriptionF30", x:425, y:500, z:1, relateroutenode:31, Secondrelateroutenode:0, image:"阑韵书屋")
let FS31 = (title:"MENTHOLATUM", subtitle:"subtitleF31", description:"descriptionF31", x:927, y:348, z:1, relateroutenode:19, Secondrelateroutenode:0, image:"MENTHOLATUM")
let FS32 = (title:"DFS", subtitle:"subtitleF32", description:"descriptionF32", x:927, y:425, z:1, relateroutenode:25, Secondrelateroutenode:0, image:"DFS")
let FS33 = (title:"与狼共舞", subtitle:"subtitleF33", description:"descriptionF33", x:927, y:500, z:1, relateroutenode:32, Secondrelateroutenode:0, image:"与狼共舞")
let FS34 = (title:"Eagle Honor", subtitle:"subtitleF34", description:"descriptionF34", x:1000, y:348, z:1, relateroutenode:20, Secondrelateroutenode:0, image:"Eagle Honor")
let FS35 = (title:"德克士", subtitle:"subtitleF35", description:"descriptionF35", x:1000, y:425, z:1, relateroutenode:26, Secondrelateroutenode:0, image:"德克士")
let FS36 = (title:"肯德基", subtitle:"subtitleF36", description:"descriptionF36", x:1000, y:500, z:1, relateroutenode:33, Secondrelateroutenode:0, image:"肯德基")
let FS37 = (title:"ZARA", subtitle:"subtitleF37", description:"descriptionF37", x:1502, y:348, z:1, relateroutenode:21, Secondrelateroutenode:0, image:"ZARA")
let FS38 = (title:"Dior", subtitle:"subtitleF38", description:"descriptionF38", x:1502, y:425, z:1, relateroutenode:27, Secondrelateroutenode:0, image:"Dior")
let FS39 = (title:"杰克琼斯", subtitle:"subtitleF39", description:"descriptionF39", x:1502, y:500, z:1, relateroutenode:34, Secondrelateroutenode:0, image:"杰克琼斯")
let FS40 = (title:"快乐便利", subtitle:"subtitleF40", description:"descriptionF40", x:1576, y:348, z:1, relateroutenode:22, Secondrelateroutenode:0, image:"快乐便利")
let FS41 = (title:"漫步者", subtitle:"subtitleF41", description:"descriptionF41", x:1576, y:425, z:1, relateroutenode:28, Secondrelateroutenode:0, image:"漫步者")
let FS42 = (title:"Parrote", subtitle:"subtitleF42", description:"descriptionF42", x:1576, y:500, z:1, relateroutenode:35, Secondrelateroutenode:0, image:"Parrote")
let FELS1 = (title:"电梯1-1", subtitle:"subtitleFELS1", description:"descriptionFELS1", x:251, y:1807, z:1, relateroutenode:98, Secondrelateroutenode:0, image:"elevator")
let FELS2 = (title:"电梯1-2", subtitle:"subtitleFELS2", description:"descriptionFELS2", x:1672, y:1807, z:1, relateroutenode:110, Secondrelateroutenode:0, image:"elevator")
let FELS3 = (title:"电梯1-3", subtitle:"subtitleFELS3", description:"descriptionFELS3", x:634, y:1246, z:1, relateroutenode:74, Secondrelateroutenode:0, image:"elevator")
let FELS4 = (title:"电梯1-4", subtitle:"subtitleFELS4", description:"descriptionFELS4", x:1289, y:1246, z:1, relateroutenode:76, Secondrelateroutenode:0, image:"elevator")
let FELS7 = (title:"电梯1-7", subtitle:"subtitleFELS7", description:"descriptionFELS7", x:251, y:115, z:1, relateroutenode:2, Secondrelateroutenode:0, image:"elevator")
let FELS8 = (title:"电梯1-8", subtitle:"subtitleFELS8", description:"descriptionFELS8", x:1672, y:115, z:1, relateroutenode:13, Secondrelateroutenode:0, image:"elevator")
let FE1 = (title:"登机口1-1", subtitle:"subtitleFE1", description:"descriptionFE1", x:21, y:1424, z:1, relateroutenode:79, Secondrelateroutenode:0, image:"登机口1-1")
let FE2 = (title:"登机口1-2", subtitle:"subtitleFE2", description:"descriptionFE2", x:21, y:1194, z:1, relateroutenode:72, Secondrelateroutenode:0, image:"登机口1-2")
let FE3 = (title:"登机口1-3", subtitle:"subtitleFE3", description:"descriptionFE3", x:21, y:965, z:1, relateroutenode:51, Secondrelateroutenode:0, image:"登机口1-3")
let FE4 = (title:"登机口1-4", subtitle:"subtitleFE4", description:"descriptionFE4", x:21, y:732, z:1, relateroutenode:46, Secondrelateroutenode:0, image:"登机口1-4")
let FE5 = (title:"登机口1-5", subtitle:"subtitleFE5", description:"descriptionFE5", x:21, y:502, z:1, relateroutenode:29, Secondrelateroutenode:0, image:"登机口1-5")
let FE6 = (title:"登机口1-6", subtitle:"subtitleFE6", description:"descriptionFE6", x:21, y:272, z:1, relateroutenode:15, Secondrelateroutenode:0, image:"登机口1-6")
let FE7 = (title:"登机口1-7", subtitle:"subtitleFE7", description:"descriptionFE7", x:385, y:21, z:1, relateroutenode:3, Secondrelateroutenode:0, image:"登机口1-7")
let FE8 = (title:"登机口1-8", subtitle:"subtitleFE8", description:"descriptionFE8", x:615, y:21, z:1, relateroutenode:5, Secondrelateroutenode:0, image:"登机口1-8")
let FE9 = (title:"登机口1-9", subtitle:"subtitleFE9", description:"descriptionFE9", x:847, y:21, z:1, relateroutenode:7, Secondrelateroutenode:0, image:"登机口1-9")
let FE10 = (title:"登机口1-10", subtitle:"subtitleFE10", description:"descriptionFE10", x:1076, y:21, z:1, relateroutenode:8, Secondrelateroutenode:0, image:"登机口1-10")
let FE11 = (title:"登机口1-11", subtitle:"subtitleFE11", description:"descriptionFE11", x:1309, y:21, z:1, relateroutenode:10, Secondrelateroutenode:0, image:"登机口1-11")
let FE12 = (title:"登机口1-12", subtitle:"subtitleFE12", description:"descriptionFE12", x:1540, y:21, z:1, relateroutenode:12, Secondrelateroutenode:0, image:"登机口1-12")
let FE13 = (title:"登机口1-13", subtitle:"subtitleFE13", description:"descriptionFE13", x:1904, y:272, z:1, relateroutenode:16, Secondrelateroutenode:0, image:"登机口1-13")
let FE14 = (title:"登机口1-14", subtitle:"subtitleFE14", description:"descriptionFE14", x:1904, y:502, z:1, relateroutenode:36, Secondrelateroutenode:0, image:"登机口1-14")
let FE15 = (title:"登机口1-15", subtitle:"subtitleFE15", description:"descriptionFE15", x:1904, y:732, z:1, relateroutenode:47, Secondrelateroutenode:0, image:"登机口1-15")
let FE16 = (title:"登机口1-16", subtitle:"subtitleFE16", description:"descriptionFE16", x:1904, y:965, z:1, relateroutenode:58, Secondrelateroutenode:0, image:"登机口1-16")
let FE17 = (title:"登机口1-17", subtitle:"subtitleFE17", description:"descriptionFE17", x:1904, y:1194, z:1, relateroutenode:73, Secondrelateroutenode:0, image:"登机口1-17")
let FE18 = (title:"登机口1-18", subtitle:"subtitleFE18", description:"descriptionFE18", x:1904, y:1424, z:1, relateroutenode:85, Secondrelateroutenode:0, image:"登机口1-18")
let FW1 = (title:"卫生间1-1", subtitle:"subtitleFW1", description:"descriptionFW1", x:77, y:1817, z:1, relateroutenode:97, Secondrelateroutenode:0, image:"toilet")
let FW2 = (title:"卫生间1-2", subtitle:"subtitleFW2", description:"descriptionFW2", x:1847, y:1817, z:1, relateroutenode:111, Secondrelateroutenode:0, image:"toilet")
let FW3 = (title:"卫生间1-3", subtitle:"subtitleFW3", description:"descriptionFW3", x:77, y:1583, z:1, relateroutenode:88, Secondrelateroutenode:0, image:"toilet")
let FW4 = (title:"卫生间1-4", subtitle:"subtitleFW4", description:"descriptionFW4", x:1847, y:1583, z:1, relateroutenode:91, Secondrelateroutenode:0, image:"toilet")
let FW5 = (title:"卫生间1-5", subtitle:"subtitleFW5", description:"descriptionFW5", x:444, y:1234, z:1, relateroutenode:80, Secondrelateroutenode:0, image:"toilet")
let FW6 = (title:"卫生间1-6", subtitle:"subtitleFW6", description:"descriptionFW6", x:1480, y:1240, z:1, relateroutenode:84, Secondrelateroutenode:0, image:"toilet")
let FW7 = (title:"卫生间1-7", subtitle:"subtitleFW7", description:"descriptionFW7", x:94, y:86, z:1, relateroutenode:1, Secondrelateroutenode:0, image:"toilet")
let FW8 = (title:"卫生间1-8", subtitle:"subtitleFW8", description:"descriptionFW8", x:1831, y:86, z:1, relateroutenode:14, Secondrelateroutenode:0, image:"toilet")
let FWT1 = (title:"饮水处1-1", subtitle:"subtitleFWT1", description:"descriptionFWT1", x:59, y:1757, z:1, relateroutenode:97, Secondrelateroutenode:0, image:"drinkWater")
let FWT2 = (title:"饮水处1-2", subtitle:"subtitleFWT2", description:"descriptionFWT2", x:1867, y:1757, z:1, relateroutenode:111, Secondrelateroutenode:0, image:"drinkWater")
let FWT3 = (title:"饮水处1-3", subtitle:"subtitleFWT3", description:"descriptionFWT3", x:59, y:1310, z:1, relateroutenode:77, Secondrelateroutenode:0, image:"drinkWater")
let FWT4 = (title:"饮水处1-4", subtitle:"subtitleFWT4", description:"descriptionFWT4", x:1867, y:1310, z:1, relateroutenode:78, Secondrelateroutenode:0, image:"drinkWater")
let FWT5 = (title:"饮水处1-5", subtitle:"subtitleFWT5", description:"descriptionFWT5", x:519, y:1218, z:1, relateroutenode:80, Secondrelateroutenode:0, image:"drinkWater")
let FWT6 = (title:"饮水处1-6", subtitle:"subtitleFWT6", description:"descriptionFWT6", x:1407, y:1218, z:1, relateroutenode:83, Secondrelateroutenode:0, image:"drinkWater")
let FWT7 = (title:"饮水处1-7", subtitle:"subtitleFWT7", description:"descriptionFWT7", x:59, y:617, z:1, relateroutenode:37, Secondrelateroutenode:0, image:"drinkWater")
let FWT8 = (title:"饮水处1-8", subtitle:"subtitleFWT8", description:"descriptionFWT8", x:1867, y:617, z:1, relateroutenode:41, Secondrelateroutenode:0, image:"drinkWater")
let FWT9 = (title:"饮水处1-9", subtitle:"subtitleFWT9", description:"descriptionFWT9", x:59, y:134, z:1, relateroutenode:1, Secondrelateroutenode:0, image:"drinkWater")
let FWT10 = (title:"饮水处1-10", subtitle:"subtitleFWT10", description:"descriptionFWT10", x:1867, y:134, z:1, relateroutenode:14, Secondrelateroutenode:0, image:"drinkWater")
let FWT11 = (title:"饮水处1-11", subtitle:"subtitleFWT11", description:"descriptionFWT11", x:732, y:59, z:1, relateroutenode:6, Secondrelateroutenode:0, image:"drinkWater")
let FWT12 = (title:"饮水处1-12", subtitle:"subtitleFWT12", description:"descriptionFWT12", x:1191, y:59, z:1, relateroutenode:9, Secondrelateroutenode:0, image:"drinkWater")
let FD1 = (title:"出入口1-1", subtitle:"subtitleFD1", description:"descriptionFD1", x:500, y:1906, z:1, relateroutenode:101, Secondrelateroutenode:0, image:"exit")
let FD2 = (title:"出入口1-2", subtitle:"subtitleFD2", description:"descriptionFD2", x:962, y:1906, z:1, relateroutenode:104, Secondrelateroutenode:0, image:"exit")
let FD3 = (title:"出入口1-3", subtitle:"subtitleFD3", description:"descriptionFD3", x:1424, y:1906, z:1, relateroutenode:107, Secondrelateroutenode:0, image:"exit")
let FQ1 = (title:"问讯处1-1", subtitle:"subtitleFQ1", description:"descriptionFQ1", x:732, y:1559, z:1, relateroutenode:93, Secondrelateroutenode:0, image:"inquiryDesk")
let FQ2 = (title:"问讯处1-2", subtitle:"subtitleFQ2", description:"descriptionFQ2", x:1192, y:1559, z:1, relateroutenode:95, Secondrelateroutenode:0, image:"inquiryDesk")

let SS1 = (title:"绿野人家", subtitle:"subtitleS1", description:"descriptionS1", x:699, y:1846, z:2, relateroutenode:189, Secondrelateroutenode:0, image:"绿野人家")
let SS2 = (title:"沈阳特产", subtitle:"subtitleS2", description:"descriptionS2", x:769, y:1846, z:2, relateroutenode:190, Secondrelateroutenode:0, image:"沈阳特产")
let SS3 = (title:"Pute Route", subtitle:"subtitleS3", description:"descriptionS3", x:1158, y:1846, z:2, relateroutenode:192, Secondrelateroutenode:0, image:"Pute Route")
let SS4 = (title:"麦当劳", subtitle:"subtitleS4", description:"descriptionS4", x:1231, y:1846, z:2, relateroutenode:193, Secondrelateroutenode:0, image:"麦当劳")
let SS5 = (title:"三生三味", subtitle:"subtitleS5", description:"descriptionS5", x:699, y:1503, z:2, relateroutenode:168, Secondrelateroutenode:0, image:"三生三味")
let SS6 = (title:"圆缘苑", subtitle:"subtitleS6", description:"descriptionS6", x:769, y:1503, z:2, relateroutenode:168, Secondrelateroutenode:0, image:"圆缘苑")
let SS7 = (title:"21世纪书店", subtitle:"subtitleS7", description:"descriptionS7", x:1158, y:1503, z:2, relateroutenode:170, Secondrelateroutenode:0, image:"21世纪书店")
let SS8 = (title:"年轻人", subtitle:"subtitleS8", description:"descriptionS8", x:1231, y:1503, z:2, relateroutenode:170, Secondrelateroutenode:0, image:"年轻人")
let SS9 = (title:"RAVONAL", subtitle:"subtitleS9", description:"descriptionS9", x:422, y:1428, z:2, relateroutenode:167, Secondrelateroutenode:0, image:"RAVONAL")
let SS10 = (title:"MONCLER", subtitle:"subtitleS10", description:"descriptionS10", x:422, y:1503, z:2, relateroutenode:173, Secondrelateroutenode:0, image:"MONCLER")
let SS11 = (title:"兰蔻", subtitle:"subtitleS11", description:"descriptionS11", x:422, y:1577, z:2, relateroutenode:176, Secondrelateroutenode:0, image:"兰蔻")
let SS12 = (title:"Baleno", subtitle:"subtitleS12", description:"descriptionS12", x:350, y:1577, z:2, relateroutenode:186, Secondrelateroutenode:0, image:"Baleno")
let SS13 = (title:"必胜客", subtitle:"subtitleS13", description:"descriptionS13", x:1502, y:1428, z:2, relateroutenode:171, Secondrelateroutenode:0, image:"必胜客")
let SS14 = (title:"老家特产", subtitle:"subtitleS14", description:"descriptionS14", x:1502, y:1503, z:2, relateroutenode:174, Secondrelateroutenode:0, image:"老家特产")
let SS15 = (title:"爱丽丝西餐厅", subtitle:"subtitleS15", description:"descriptionS15", x:1502, y:1577, z:2, relateroutenode:177, Secondrelateroutenode:0, image:"爱丽丝西餐厅")
let SS16 = (title:"Business Name", subtitle:"subtitleS16", description:"descriptionS16", x:1577, y:1577, z:2, relateroutenode:196, Secondrelateroutenode:0, image:"Business Name")
let SS17 = (title:"Bookworld", subtitle:"subtitleS17", description:"descriptionS17", x:277, y:1230, z:2, relateroutenode:162, Secondrelateroutenode:0, image:"Bookworld")
let SS18 = (title:"Estee Lauder", subtitle:"subtitleS18", description:"descriptionS18", x:277, y:1303, z:2, relateroutenode:164, Secondrelateroutenode:0, image:"Estee Lauder")
let SS19 = (title:"GIVENCHY", subtitle:"subtitleS19", description:"descriptionS19", x:277, y:1377, z:2, relateroutenode:166, Secondrelateroutenode:0, image:"GIVENCHY")
let SS20 = (title:"魔域王子", subtitle:"subtitleS20", description:"descriptionS20", x:349, y:1230, z:2, relateroutenode:155, Secondrelateroutenode:0, image:"魔域王子")
let SS21 = (title:"HERMES", subtitle:"subtitleS21", description:"descriptionS21", x:1651, y:1230, z:2, relateroutenode:163, Secondrelateroutenode:0, image:"HERMES")
let SS22 = (title:"CK", subtitle:"subtitleS22", description:"descriptionS22", x:1651, y:1303, z:2, relateroutenode:165, Secondrelateroutenode:0, image:"CK")
let SS23 = (title:"哥弟", subtitle:"subtitleS23", description:"descriptionS23", x:1651, y:1377, z:2, relateroutenode:172, Secondrelateroutenode:0, image:"哥弟")
let SS24 = (title:"suitcase", subtitle:"subtitleS24", description:"descriptionS24", x:1579, y:1230, z:2, relateroutenode:161, Secondrelateroutenode:0, image:"suitcase")
let SS25 = (title:"七匹狼", subtitle:"subtitleS25", description:"descriptionS25", x:348, y:351, z:2, relateroutenode:129, Secondrelateroutenode:0, image:"七匹狼")
let SS26 = (title:"STAVA", subtitle:"subtitleS26", description:"descriptionS26", x:348, y:426, z:2, relateroutenode:132, Secondrelateroutenode:0, image:"STAVA")
let SS27 = (title:"GUCCI", subtitle:"subtitleS27", description:"descriptionS27", x:348, y:499, z:2, relateroutenode:134, Secondrelateroutenode:0, image:"GUCCI")
let SS28 = (title:"TRAVELTIME", subtitle:"subtitleS28", description:"descriptionS28", x:422, y:351, z:2, relateroutenode:114, Secondrelateroutenode:0, image:"TRAVELTIME")
let SS29 = (title:"ROLEX", subtitle:"subtitleS29", description:"descriptionS29", x:495, y:351, z:2, relateroutenode:115, Secondrelateroutenode:0, image:"ROLEX")
let SS30 = (title:"ELAND", subtitle:"subtitleS30", description:"descriptionS30", x:1576, y:351, z:2, relateroutenode:131, Secondrelateroutenode:0, image:"ELAND")
let SS31 = (title:"MARY KAY", subtitle:"subtitleS31", description:"descriptionS31", x:1576, y:426, z:2, relateroutenode:133, Secondrelateroutenode:0, image:"MARY KAY")
let SS32 = (title:"Tiffany&Go", subtitle:"subtitleS32", description:"descriptionS32", x:1576, y:499, z:2, relateroutenode:138, Secondrelateroutenode:0, image:"Tiffany&Go")
let SS33 = (title:"悉尼盾", subtitle:"subtitleS33", description:"descriptionS33", x:1502, y:351, z:2, relateroutenode:123, Secondrelateroutenode:0, image:"悉尼盾")
let SS34 = (title:"ZADIE", subtitle:"subtitleS34", description:"descriptionS34", x:1430, y:351, z:2, relateroutenode:124, Secondrelateroutenode:0, image:"ZADIE")

//////////
let SELS1 = (title:"电梯2-1", subtitle:"subtitleSELS1", description:"descriptionSELS1", x:251, y:1807, z:2, relateroutenode:185, Secondrelateroutenode:0, image:"elevator")
let SELS2 = (title:"电梯2-2", subtitle:"subtitleSELS2", description:"descriptionSELS2", x:1672, y:1807, z:2, relateroutenode:197, Secondrelateroutenode:0, image:"elevator")
let SELS3 = (title:"电梯2-3", subtitle:"subtitleSELS3", description:"descriptionSELS3", x:634, y:1246, z:2, relateroutenode:168, Secondrelateroutenode:0, image:"elevator")
let SELS4 = (title:"电梯2-4", subtitle:"subtitleSELS4", description:"descriptionSELS4", x:1289, y:1246, z:2, relateroutenode:170, Secondrelateroutenode:0, image:"elevator")
let SELS7 = (title:"电梯2-7", subtitle:"subtitleSELS7", description:"descriptionSELS7", x:251, y:115, z:2, relateroutenode:113, Secondrelateroutenode:0, image:"elevator")
let SELS8 = (title:"电梯2-8", subtitle:"subtitleSELS8", description:"descriptionSELS8", x:1672, y:115, z:2, relateroutenode:125, Secondrelateroutenode:0, image:"elevator")
let SE1 = (title:"登机口2-1", subtitle:"subtitleSE1", description:"descriptionSE1", x:21, y:1424, z:2, relateroutenode:166, Secondrelateroutenode:0, image:"登机口2-1")
let SE2 = (title:"登机口2-2", subtitle:"subtitleSE2", description:"descriptionSE2", x:21, y:1194, z:2, relateroutenode:162, Secondrelateroutenode:0, image:"登机口2-2")
let SE3 = (title:"登机口2-3", subtitle:"subtitleSE3", description:"descriptionSE3", x:21, y:965, z:2, relateroutenode:146, Secondrelateroutenode:0, image:"登机口2-3")
let SE4 = (title:"登机口2-4", subtitle:"subtitleSE4", description:"descriptionSE4", x:21, y:732, z:2, relateroutenode:141, Secondrelateroutenode:0, image:"登机口2-4")
let SE5 = (title:"登机口2-5", subtitle:"subtitleSE5", description:"descriptionSE5", x:21, y:502, z:2, relateroutenode:134, Secondrelateroutenode:0, image:"登机口2-5")
let SE6 = (title:"登机口2-6", subtitle:"subtitleSE6", description:"descriptionSE6", x:21, y:272, z:2, relateroutenode:127, Secondrelateroutenode:0, image:"登机口2-6")
let SE7 = (title:"登机口2-7", subtitle:"subtitleSE7", description:"descriptionSE7", x:385, y:21, z:2, relateroutenode:114, Secondrelateroutenode:0, image:"登机口2-7")
let SE8 = (title:"登机口2-8", subtitle:"subtitleSE8", description:"descriptionSE8", x:615, y:21, z:2, relateroutenode:116, Secondrelateroutenode:0, image:"登机口2-8")
let SE9 = (title:"登机口2-9", subtitle:"subtitleSE9", description:"descriptionSE9", x:847, y:21, z:2, relateroutenode:118, Secondrelateroutenode:0, image:"登机口2-9")
let SE10 = (title:"登机口2-10", subtitle:"subtitleSE10", description:"descriptionSE10", x:1076, y:21, z:2, relateroutenode:120, Secondrelateroutenode:0, image:"登机口2-10")
let SE11 = (title:"登机口2-11", subtitle:"subtitleSE11", description:"descriptionSE11", x:1309, y:21, z:2, relateroutenode:122, Secondrelateroutenode:0, image:"登机口2-11")
let SE12 = (title:"登机口2-12", subtitle:"subtitleSE12", description:"descriptionSE12", x:1540, y:21, z:2, relateroutenode:124, Secondrelateroutenode:0, image:"登机口2-12")
let SE13 = (title:"登机口2-13", subtitle:"subtitleSE13", description:"descriptionSE13", x:1904, y:272, z:2, relateroutenode:128, Secondrelateroutenode:0, image:"登机口2-13")
let SE14 = (title:"登机口2-14", subtitle:"subtitleSE14", description:"descriptionSE14", x:1904, y:502, z:2, relateroutenode:138, Secondrelateroutenode:0, image:"登机口2-14")
let SE15 = (title:"登机口2-15", subtitle:"subtitleSE15", description:"descriptionSE15", x:1904, y:732, z:2, relateroutenode:145, Secondrelateroutenode:0, image:"登机口2-15")
let SE16 = (title:"登机口2-16", subtitle:"subtitleSE16", description:"descriptionSE16", x:1904, y:965, z:2, relateroutenode:154, Secondrelateroutenode:0, image:"登机口2-16")
let SE17 = (title:"登机口2-17", subtitle:"subtitleSE17", description:"descriptionSE17", x:1904, y:1194, z:2, relateroutenode:163, Secondrelateroutenode:0, image:"登机口2-17")
let SE18 = (title:"登机口2-18", subtitle:"subtitleSE18", description:"descriptionSE18", x:1904, y:1424, z:2, relateroutenode:172, Secondrelateroutenode:0, image:"登机口2-18")
let SW1 = (title:"卫生间2-1", subtitle:"subtitleSW1", description:"descriptionSW1", x:77, y:1817, z:2, relateroutenode:184, Secondrelateroutenode:0, image:"toilet")
let SW2 = (title:"卫生间2-2", subtitle:"subtitleSW2", description:"descriptionSW2", x:1847, y:1817, z:2, relateroutenode:198, Secondrelateroutenode:0, image:"toilet")
let SW3 = (title:"卫生间2-3", subtitle:"subtitleSW3", description:"descriptionSW3", x:77, y:1583, z:2, relateroutenode:175, Secondrelateroutenode:0, image:"toilet")
let SW4 = (title:"卫生间2-4", subtitle:"subtitleSW4", description:"descriptionSW4", x:1847, y:1583, z:2, relateroutenode:178, Secondrelateroutenode:0, image:"toilet")
let SW5 = (title:"卫生间2-5", subtitle:"subtitleSW5", description:"descriptionSW5", x:444, y:1234, z:2, relateroutenode:167, Secondrelateroutenode:0, image:"toilet")
let SW6 = (title:"卫生间2-6", subtitle:"subtitleSW6", description:"descriptionSW6", x:1470, y:1234, z:2, relateroutenode:171, Secondrelateroutenode:0, image:"toilet")
let SW7 = (title:"卫生间2-7", subtitle:"subtitleSW7", description:"descriptionSW7", x:94, y:86, z:2, relateroutenode:112, Secondrelateroutenode:0, image:"toilet")
let SW8 = (title:"卫生间2-8", subtitle:"subtitleSW8", description:"descriptionSW8", x:1831, y:86, z:2, relateroutenode:126, Secondrelateroutenode:0, image:"toilet")
let SWT1 = (title:"饮水处2-1", subtitle:"subtitleSWT1", description:"descriptionSWT1", x:59, y:1757, z:2, relateroutenode:184, Secondrelateroutenode:0, image:"drinkWater")
let SWT2 = (title:"饮水处2-2", subtitle:"subtitleSWT2", description:"descriptionSWT2", x:1867, y:1757, z:2, relateroutenode:198, Secondrelateroutenode:0, image:"drinkWater")
let SWT3 = (title:"饮水处2-3", subtitle:"subtitleSWT3", description:"descriptionSWT3", x:59, y:1310, z:2, relateroutenode:164, Secondrelateroutenode:0, image:"drinkWater")
let SWT4 = (title:"饮水处2-4", subtitle:"subtitleSWT4", description:"descriptionSWT4", x:1867, y:1310, z:2, relateroutenode:165, Secondrelateroutenode:0, image:"drinkWater")
let SWT5 = (title:"饮水处2-5", subtitle:"subtitleSWT5", description:"descriptionSWT5", x:519, y:1218, z:2, relateroutenode:167, Secondrelateroutenode:0, image:"drinkWater")
let SWT6 = (title:"饮水处2-6", subtitle:"subtitleSWT6", description:"descriptionSWT6", x:1407, y:1218, z:2, relateroutenode:171, Secondrelateroutenode:0, image:"drinkWater")
let SWT7 = (title:"饮水处2-7", subtitle:"subtitleSWT7", description:"descriptionSWT7", x:59, y:617, z:2, relateroutenode:139, Secondrelateroutenode:0, image:"drinkWater")
let SWT8 = (title:"饮水处2-8", subtitle:"subtitleSWT8", description:"descriptionSWT8", x:1867, y:617, z:2, relateroutenode:140, Secondrelateroutenode:0, image:"drinkWater")
let SWT9 = (title:"饮水处2-9", subtitle:"subtitleSWT9", description:"descriptionSWT9", x:59, y:134, z:2, relateroutenode:112, Secondrelateroutenode:0, image:"drinkWater")
let SWT10 = (title:"饮水处2-10", subtitle:"subtitleSWT10", description:"descriptionSWT10", x:1867, y:134, z:2, relateroutenode:126, Secondrelateroutenode:0, image:"drinkWater")
let SWT11 = (title:"饮水处2-11", subtitle:"subtitleSWT11", description:"descriptionSWT11", x:732, y:59, z:2, relateroutenode:117, Secondrelateroutenode:0, image:"drinkWater")
let SWT12 = (title:"饮水处2-12", subtitle:"subtitleSWT12", description:"descriptionSWT12", x:1191, y:59, z:2, relateroutenode:121, Secondrelateroutenode:0, image:"drinkWater")
let SC2 = (title:"值机柜台2-2", subtitle:"subtitleSC2", description:"descriptionSC2", x:829, y:966, z:2, relateroutenode:149, Secondrelateroutenode:0, image:"check-in")
let SC3 = (title:"值机柜台2-3", subtitle:"subtitleSC3", description:"descriptionSC3", x:867, y:966, z:2, relateroutenode:150, Secondrelateroutenode:0, image:"inquiryDesk")
let SC4 = (title:"值机柜台2-4", subtitle:"subtitleSC4", description:"descriptionSC4", x:1060, y:966, z:2, relateroutenode:150, Secondrelateroutenode:0, image:"inquiryDesk")
let SC5 = (title:"值机柜台2-5", subtitle:"subtitleSC5", description:"descriptionSC5", x:1097, y:966, z:2, relateroutenode:151, Secondrelateroutenode:0, image:"inquiryDesk")
let SD1 = (title:"出入口2-1", subtitle:"subtitleSD1", description:"descriptionSD1", x:500, y:1906, z:2, relateroutenode:188, Secondrelateroutenode:0, image:"exit")
let SD2 = (title:"出入口2-2", subtitle:"subtitleSD2", description:"descriptionSD2", x:962, y:1906, z:2, relateroutenode:191, Secondrelateroutenode:0, image:"exit")
let SD3 = (title:"出入口2-3", subtitle:"subtitleSD3", description:"descriptionSD3", x:1424, y:1906, z:2, relateroutenode:194, Secondrelateroutenode:0, image:"exit")
let SSC1 = (title:"安检口2-1", subtitle:"subtitleSSC1", description:"descriptionSSC1", x:369, y:965, z:2, relateroutenode:147, Secondrelateroutenode:0, image:"safetyCheck")
let SSC2 = (title:"安检口2-2", subtitle:"subtitleSSC2", description:"descriptionSSC2", x:966, y:368, z:2, relateroutenode:130, Secondrelateroutenode:0, image:"safetyCheck")
let SSC3 = (title:"安检口2-3", subtitle:"subtitleSSC3", description:"descriptionSSC3", x:1556, y:965, z:2, relateroutenode:153, Secondrelateroutenode:0, image:"safetyCheck")
let SQ1 = (title:"问讯处2-1", subtitle:"subtitleSQ1", description:"descriptionSQ1", x:732, y:1559, z:2, relateroutenode:180, Secondrelateroutenode:0, image:"inquiryDesk")
let SQ2 = (title:"问讯处2-2", subtitle:"subtitleSQ2", description:"descriptionSQ2", x:1192, y:1559, z:2, relateroutenode:182, Secondrelateroutenode:0, image:"inquiryDesk")

let ZD1 = (title:"出入口0-1", subtitle:"subtitleZD1", description:"descriptionZD1", x:503, y:1905, z:0, relateroutenode:208, Secondrelateroutenode:0, image:"exit")
let ZD2 = (title:"出入口0-2", subtitle:"subtitleZD2", description:"descriptionZD2", x:964, y:1905, z:0, relateroutenode:210, Secondrelateroutenode:0, image:"exit")
let ZD3 = (title:"出入口0-2", subtitle:"subtitleZD3", description:"descriptionZD3", x:1426, y:1905, z:0, relateroutenode:212, Secondrelateroutenode:0, image:"exit")
let ZELS1 = (title:"电梯0-1", subtitle:"subtitleZELS1", description:"descriptionZELS1", x:252, y:1825, z:0, relateroutenode:207, Secondrelateroutenode:0, image:"elevator")
let ZELS2 = (title:"电梯0-2", subtitle:"subtitleZELS2", description:"descriptionZELS2", x:1690, y:1825, z:0, relateroutenode:213, Secondrelateroutenode:0, image:"elevator")
let ZELS3 = (title:"电梯0-3", subtitle:"subtitleZELS3", description:"descriptionZELS3", x:616, y:1251, z:0, relateroutenode:199, Secondrelateroutenode:0, image:"elevator")
let ZELS4 = (title:"电梯0-4", subtitle:"subtitleZELS4", description:"descriptionZELS4", x:1308, y:1251, z:0, relateroutenode:201, Secondrelateroutenode:0, image:"elevator")




//2relatingnode
let FS17 = (title:"711便利店", subtitle:"subtitleF17", description:"descriptionF17", x:277, y:1230, z:1, relateroutenode:72, Secondrelateroutenode:60, image:"711便利店")
let FS21 = (title:"Chanel", subtitle:"subtitleF21", description:"descriptionF21", x:1651, y:1230, z:1, relateroutenode:70, Secondrelateroutenode:73, image:"Chanel")
let FELS5 = (title:"电梯1-5", subtitle:"subtitleFELS5", description:"descriptionFELS5", x:616, y:680, z:1, relateroutenode:42, Secondrelateroutenode:43, image:"elevator")
let FELS6 = (title:"电梯1-6", subtitle:"subtitleFELS6", description:"descriptionFELS6", x:1307, y:680, z:1, relateroutenode:44, Secondrelateroutenode:45, image:"elevator")
let FB1 = (title:"行李盘1-1", subtitle:"subtitleFB1", description:"descriptionFB1", x:405, y:966, z:1, relateroutenode:52, Secondrelateroutenode:53, image:"luggage")
let FB2 = (title:"行李盘1-2", subtitle:"subtitleFB2", description:"descriptionFB2", x:635, y:966, z:1, relateroutenode:53, Secondrelateroutenode:54, image:"luggage")
let FB3 = (title:"行李盘1-3", subtitle:"subtitleFB3", description:"descriptionFB3", x:867, y:838, z:1, relateroutenode:48, Secondrelateroutenode:49, image:"luggage")
let FB4 = (title:"行李盘1-4", subtitle:"subtitleFB4", description:"descriptionFB4", x:1061, y:838, z:1, relateroutenode:49, Secondrelateroutenode:50, image:"luggage")
let FB5 = (title:"行李盘1-5", subtitle:"subtitleFB5", description:"descriptionFB5", x:1290, y:966, z:1, relateroutenode:55, Secondrelateroutenode:56, image:"luggage")
let FB6 = (title:"行李盘1-6", subtitle:"subtitleFB6", description:"descriptionFB6", x:1520, y:966, z:1, relateroutenode:56, Secondrelateroutenode:57, image:"luggage")
let SC1 = (title:"值机柜台2-1", subtitle:"subtitleSC1", description:"descriptionSC1", x:636, y:966, z:2, relateroutenode:148, Secondrelateroutenode:149, image:"inquiryDesk")
let SC6 = (title:"值机柜台2-6", subtitle:"subtitleSC6", description:"descriptionSC6", x:1292, y:966, z:2, relateroutenode:151, Secondrelateroutenode:152, image:"inquiryDesk")
let SELS5 = (title:"电梯2-5", subtitle:"subtitleSELS5", description:"descriptionSELS5", x:616, y:680, z:2, relateroutenode:142, Secondrelateroutenode:135, image:"elevator")
let SELS6 = (title:"电梯2-6", subtitle:"subtitleSELS6", description:"descriptionSELS6", x:1307, y:680, z:2, relateroutenode:144, Secondrelateroutenode:137, image:"elevator")


////////////////////////////////
//entity汇总字典
let entityData : Dictionary<String, (String, String, String, Int, Int, Int, Int, Int, String)> = ["卫生间1-1" : FW1, "卫生间1-2" : FW2, "卫生间1-3" : FW3, "卫生间1-4" : FW4, "卫生间1-5" : FW5, "卫生间1-6" : FW6, "卫生间1-7" : FW7, "卫生间1-8" : FW8, "卫生间2-1" : SW1, "卫生间2-2" : SW2, "卫生间2-3" : SW3, "卫生间2-4" : SW4, "卫生间2-5" :SW5, "卫生间2-6" : SW6, "卫生间2-7" : SW7, "卫生间2-8" : SW8, FS1.title : FS1, FS2.title : FS2, FS3.title : FS3, FS4.title : FS4, FS5.title : FS5, FS6.title : FS6, FS7.title : FS7, FS8.title : FS8, FS9.title : FS9, FS10.title : FS10, FS11.title : FS11, FS12.title : FS12, FS13.title : FS13, FS14.title : FS14, FS15.title : FS15, FS16.title : FS16, FS17.title : FS17, FS18.title : FS18, FS19.title : FS19, FS20.title : FS20, FS21.title : FS21, FS22.title : FS22, FS23.title : FS23, FS24.title : FS24, FS25.title : FS25, FS26.title : FS26, FS27.title : FS27, FS28.title : FS28, FS29.title : FS29, FS30.title : FS30, FS31.title : FS31, FS32.title: FS32, FS33.title : FS33, FS34.title : FS34, FS35.title : FS35, FS36.title : FS36, FS37.title : FS37, FS38.title : FS38, FS39.title : FS39, FS40.title : FS40, FS41.title : FS41, FS42.title : FS42, SS1.title : SS1, SS2.title : SS2, SS3.title : SS3, SS4.title : SS4, SS5.title : SS5, SS6.title : SS6, SS7.title : SS7, SS8.title : SS8, SS9.title : SS9, SS10.title : SS10, SS11.title : SS11, SS12.title :SS12, SS13.title : SS13, SS14.title : SS14, SS15.title : SS15, SS16.title : SS16, SS17.title : SS17, SS18.title : SS18, SS19.title : SS19, SS20.title : SS20, SS21.title : SS21, SS22.title : SS22, SS23.title : SS23, SS24.title : SS24, SS25.title : SS25, SS26.title : SS26, SS27.title : SS27, SS28.title : SS28, SS29.title : SS29, SS30.title : SS30, SS31.title : SS31, SS32.title : SS32, SS33.title : SS33, SS34.title : SS34, "电梯0-1" : ZELS1, "电梯0-2" : ZELS2, "电梯0-3" : ZELS3, "电梯0-4" : ZELS4, "电梯1-1" : FELS1, "电梯1-2" : FELS2, "电梯1-3" : FELS3, "电梯1-4" : FELS4, "电梯1-5" : FELS5, "电梯1-6" : FELS6, "电梯1-7" : FELS7, "电梯1-8" : FELS8, "电梯2-1" : SELS1, "电梯2-2" : SELS2, "电梯2-3" : SELS3, "电梯2-4" : SELS4, "电梯2-5" : SELS5, "电梯2-6" : SELS6, "电梯2-7" : SELS7, "电梯2-8" : SELS8, "出入口0-1" : ZD1, "出入口0-2" : ZD2, "出入口0-3" : ZD3, "出入口1-1" : FD1, "出入口1-2" : FD2, "出入口1-3" : FD3, "出入口2-1" : SD1, "出入口2-2" : SD2, "出入口2-3" : SD3, "登机口1-1" : FE1, "登机口1-2" : FE2, "登机口1-3" : FE3, "登机口1-4" : FE4, "登机口1-5" : FE5, "登机口1-6" : FE6, "登机口1-7" : FE7, "登机口1-8" : FE8, "登机口1-9" :FE9, "登机口1-10" : FE10, "登机口1-11" : FE11, "登机口1-12" : FE12, "登机口1-13" : FE13, "登机口1-14" : FE14, "登机口1-15" : FE15, "登机口1-16" : FE16, "登机口1-17" : FE17, "登机口1-18" :FE18, "登机口2-1" :SE1, "登机口2-2" :SE2, "登机口2-3" : SE3, "登机口2-4" : SE4, "登机口2-5" : SE5, "登机口2-6" : SE6, "登机口2-7" : SE7, "登机口2-8" : SE8, "登机口2-9" : SE9, "登机口2-10" : SE10, "登机口2-11" : SE11, "登机口2-12" :SE12, "登机口2-13" : SE13, "登机口2-14" : SE14, "登机口2-15" : SE15, "登机口2-16" : SE16, "登机口2-17" : SE17, "登机口2-18" : SE18, "值机柜台2-1" : SC1, "值机柜台2-2" : SC2, "值机柜台2-3" : SC3, "值机柜台2-4" : SC4, "值机柜台2-5" : SC5, "值机柜台2-6" : SC6, "安检口2-1" : SSC1, "安检口2-2" : SSC2, "安检口2-3" : SSC3, "饮水处1-1" : FWT1, "饮水处1-2" : FWT2, "饮水处1-3" : FWT3, "饮水处1-4" : FWT4, "饮水处1-5" : FWT5, "饮水处1-6" : FWT6, "饮水处1-7" : FWT7, "饮水处1-8" : FWT8, "饮水处1-9" : FWT9, "饮水处1-10" : FWT10, "饮水处1-11" : FWT11, "饮水处1-12" : FWT12, "饮水处2-1" : SWT1, "饮水处2-2" : SWT2, "饮水处2-3" : SWT3, "饮水处2-4" : SWT4, "饮水处2-5" : SWT5, "饮水处2-6" : SWT6, "饮水处2-7" : SWT7, "饮水处2-8" : SWT8, "饮水处2-9" : SWT9, "饮水处2-10" : SWT10, "饮水处2-11" : SWT11, "饮水处2-12" : SWT12, "问讯处1-1" : FQ1, "问讯处1-2" : FQ2, "问讯处2-1" : SQ1, "问讯处2-2" : SQ2, "行李盘1-1" : FB1, "行李盘1-2" : FB2, "行李盘1-3" : FB3, "行李盘1-4" : FB4, "行李盘1-5" : FB5, "行李盘1-6" : FB6]

/////////////////////////////////// down

//includeEntityArray
let entityArray1 = [FW7, FWT9, FELS7, FE7]
let entityArray2 = [FE8, FWT11]
let entityArray3 = [FE9, FE10]
let entityArray4 = [FWT12, FE11]
let entityArray5 = [FE12, FELS8, FW8, FWT10]
let entityArray6 = [FE6, FE5, FWT7, FE4, FS25, FS26, FS27, FS28, FS29, FS30]
let entityArray7 = [FELS5]
let entityArray8 = [FS31, FS32, FS33, FS34, FS35, FS36]
let entityArray9 = [FELS6]
let entityArray10 = [FS37, FS37, FS38, FS39, FS40, FS41, FS42, FE13, FE14, FWT8, FE15]
let entityArray11 = [FE3, FB1]
let entityArray12 = [FB2]
let entityArray13 = [FB3, FB4]
let entityArray14 = [FB5]
let entityArray15 = [FB6, FE16]
let entityArray16 = [FE2, FWT3, FE1, FW3, FS17, FS18, FS19, FS20]
let entityArray17 = [FW5, FWT5, FELS3, FELS4, FW6, FWT6]
let entityArray18 = [FS24, FS21, FS22, FS23, FE17, FWT4, FE18, FW4]
let entityArray19 = [FS9, FS10, FS11, FS12]
let entityArray20 = [FS5, FS6, FQ1, FS7, FS8, FQ2]
let entityArray21 = [FS13, FS14, FS15, FS16]
let entityArray22 = [FW1, FWT1, FELS1, FD1]
let entityArray23 = [FS1, FS2, FD2, FS3, FS4]
let entityArray24 = [FD3, FELS2, FW2, FWT2]
let entityArray25 = [SW7, SWT9, SELS7, SE7, SE8, SE6, SE5, SS25, SS26, SS27, SS28, SS29]
let entityArray26 = [SWT11, SE9, SE10, SWT12, SSC2]
let entityArray27 = [SE11, SE12, SELS8, SW8, SWT10, SE13, SE14, SS30, SS31, SS32, SS33, SS34]
let entityArray28 = [SWT7, SE4, SE3, SSC1]
let entityArray29 = [SC1, SELS5]
let entityArray30 = [SC2, SC3, SC4, SC5]
let entityArray31 = [SC6, SELS6]
let entityArray32 = [SWT8, SE15, SE16, SSC3]
let entityArray33 = [SE2, SWT3, SE1, SW3, SS17, SS18, SS19, SS20]
let entityArray34 = [SW5, SWT5, SELS3, SELS4, SWT6, SW6]
let entityArray35 = [SS21, SS22, SS23, SS24, SE17, SWT4, SE18, SW4]
let entityArray36 = [SS9, SS10, SS11, SS12]
let entityArray37 = [SS5, SS6, SQ1, SS7, SS8, SQ2]
let entityArray38 = [SS13, SS14, SS15, SS16]
let entityArray39 = [SW1, SWT1, SELS1, SD1]
let entityArray40 = [SS1, SS2, SD2, SS3, SS4]
let entityArray41 = [SD3, SELS2, SW2, SWT2]
let entityArray42 = [ZELS1, ZELS2, ZELS3, ZELS4, ZD1, ZD2, ZD3]

//includeNodeArray
let nodeArray1 = [1, 2, 3]
let nodeArray2 = [4, 5, 6]
let nodeArray3 = [7, 8]
let nodeArray4 = [9, 10, 11]
let nodeArray5 = [12, 13, 14]
let nodeArray6 = [15, 17, 23, 30, 29, 37, 46, 216, 242, 248]
let nodeArray7 = [18, 24, 31, 19, 25, 32, 38, 42, 43, 244, 245]
let nodeArray8 = [39]
let nodeArray9 = [20, 26, 33, 21, 27, 34, 40, 44, 45, 246, 247]
let nodeArray10 = [16, 22, 28, 35, 36, 41, 47, 217, 243, 249]
let nodeArray11 = [51, 52]
let nodeArray12 = [53, 62, 63, 64, 48, 54]
let nodeArray13 = [49, 65]
let nodeArray14 = [50, 55, 56, 66, 67, 68]
let nodeArray15 = [57, 58]
let nodeArray16 = [59, 60, 61, 72, 77, 79, 88]
let nodeArray17 = [74, 75, 76]
let nodeArray18 = [69, 70, 71, 73, 78, 85, 91]
let nodeArray19 = [80, 86, 89, 92]
let nodeArray20 = [81, 93, 82, 94, 83, 95]
let nodeArray21 = [84, 87, 90, 96]
let nodeArray22 = [97, 98, 99, 100, 101]
let nodeArray23 = [102, 103, 104, 105, 106]
let nodeArray24 = [107, 108, 109, 110, 111]
let nodeArray25 = [112, 113, 114, 115, 116, 127, 129, 132, 134]
let nodeArray26 = [117, 118, 119, 120, 121, 130]
let nodeArray27 = [122, 123, 124, 125, 126, 128, 131, 133, 138]
let nodeArray28 = [139, 141, 146, 147]
let nodeArray29 = [135, 148, 218]
let nodeArray30 = [136, 142, 149, 143, 144, 150, 151, 219, 220]
let nodeArray31 = [137, 152, 221]
let nodeArray32 = [140, 145, 153, 154]
let nodeArray33 = [214, 155, 162, 164, 166, 175]
let nodeArray34 = [156, 157, 158, 159, 160]
let nodeArray35 = [161, 215, 163, 165, 172, 178]
let nodeArray36 = [167, 173, 176, 179]
let nodeArray37 = [168, 180, 169, 170, 181, 182]
let nodeArray38 = [171, 174, 177, 183]
let nodeArray39 = [184, 185, 186, 187, 188]
let nodeArray40 = [189, 190, 191, 192, 193]
let nodeArray41 = [194, 195, 196, 197, 198]
let nodeArray42 = [199, 200, 201, 202, 203, 204, 205, 206, 207, 208, 209, 210, 211, 212, 213, 222, 223, 224, 225, 226, 227, 228, 229, 230, 231, 232, 233, 234, 235, 236, 237, 238, 239, 240, 241]
//相邻区域对应的标号
let areaArray1 = [2, 6, 7]
let areaArray2 = [1, 3, 6, 7, 8]
let areaArray3 = [2, 4, 7, 8, 9]
let areaArray4 = [3, 5, 8, 9, 10]
let areaArray5 = [4, 9, 10]
let areaArray6 = [1, 2, 7, 11, 12]
let areaArray7 = [1, 2, 3, 6, 8, 11, 12, 13]
let areaArray8 = [2, 3, 4, 7, 9, 12, 13, 14]
let areaArray9 = [3, 4, 5, 8, 10, 13, 14, 15]
let areaArray10 = [4, 5, 9, 14, 15]
let areaArray11 = [6, 7, 12, 16]
let areaArray12 = [6, 7, 8, 11, 13, 16, 17]
let areaArray13 = [7, 8, 9, 12, 14, 17]
let areaArray14 = [8, 9, 10, 13, 15, 17, 18]
let areaArray15 = [9, 10, 14, 17, 18]
let areaArray16 = [11, 12]
let areaArray17 = [12, 13, 14, 19, 20, 21]
let areaArray18 = [14, 15]
let areaArray19 = [17, 20, 22, 23]
let areaArray20 = [17, 19, 21, 22, 23, 24]
let areaArray21 = [17, 20, 23, 24]
let areaArray22 = [19, 20, 23]
let areaArray23 = [19, 20, 21, 22, 24]
let areaArray24 = [20, 21, 23]
let areaArray25 = [26, 28]
let areaArray26 = [25, 27, 30]
let areaArray27 = [26, 32]
let areaArray28 = [25, 29, 33]
let areaArray29 = [28, 30, 34]
let areaArray30 = [26, 29, 31, 34]
let areaArray31 = [30, 32, 34]
let areaArray32 = [27, 31, 35]
let areaArray33 = [28]
let areaArray34 = [29, 30, 31, 36, 37, 38]
let areaArray35 = [32]
let areaArray36 = [34, 37, 39, 40]
let areaArray37 = [34, 36, 38, 39, 40, 41]
let areaArray38 = [34, 37, 40, 41]
let areaArray39 = [36, 37, 40]
let areaArray40 = [36, 37, 38, 39, 41]
let areaArray41 = [37, 38, 40]
let areaArray42 = [0]

/////////////////////////////////// up
//划分区域所包含的信息，元组
let areaNumber1 = (includeEntityArray:entityArray1, includeNodeArray:nodeArray1, nearAreaArray:areaArray1, leftUpX:0, leftUpY:0, rightBoX:483, rightBoY:237, number:1)
let areaNumber2 = (includeEntityArray:entityArray2, includeNodeArray:nodeArray2, nearAreaArray:areaArray2, leftUpX:483, leftUpY:0, rightBoX:815, rightBoY:237, number:2)
let areaNumber3 = (includeEntityArray:entityArray3, includeNodeArray:nodeArray3, nearAreaArray:areaArray3, leftUpX:815, leftUpY:0, rightBoX:1106, rightBoY:237, number:3)
let areaNumber4 = (includeEntityArray:entityArray4, includeNodeArray:nodeArray4, nearAreaArray:areaArray4, leftUpX:1106, leftUpY:0, rightBoX:1445, rightBoY:237, number:4)
let areaNumber5 = (includeEntityArray:entityArray5, includeNodeArray:nodeArray5, nearAreaArray:areaArray5, leftUpX:1445, leftUpY:0, rightBoX:1928, rightBoY:237, number:5)
let areaNumber6 = (includeEntityArray:entityArray6, includeNodeArray:nodeArray6, nearAreaArray:areaArray6, leftUpX:0, leftUpY:237, rightBoX:483, rightBoY:738, number:6)
let areaNumber7 = (includeEntityArray:entityArray7, includeNodeArray:nodeArray7, nearAreaArray:areaArray7, leftUpX:483, leftUpY:237, rightBoX:815, rightBoY:738, number:7)
let areaNumber8 = (includeEntityArray:entityArray8, includeNodeArray:nodeArray8, nearAreaArray:areaArray8, leftUpX:815, leftUpY:237, rightBoX:1106, rightBoY:738, number:8)
let areaNumber9 = (includeEntityArray:entityArray9, includeNodeArray:nodeArray9, nearAreaArray:areaArray9, leftUpX:1106, leftUpY:237, rightBoX:1445, rightBoY:738, number:9)
let areaNumber10 = (includeEntityArray:entityArray10, includeNodeArray:nodeArray10, nearAreaArray:areaArray10, leftUpX:1445, leftUpY:237, rightBoX:1928, rightBoY:738, number:10)
let areaNumber11 = (includeEntityArray:entityArray11, includeNodeArray:nodeArray11, nearAreaArray:areaArray11, leftUpX:0, leftUpY:738, rightBoX:483, rightBoY:1088, number:11)
let areaNumber12 = (includeEntityArray:entityArray12, includeNodeArray:nodeArray12, nearAreaArray:areaArray12, leftUpX:483, leftUpY:738, rightBoX:815, rightBoY:1195, number:12)
let areaNumber13 = (includeEntityArray:entityArray13, includeNodeArray:nodeArray13, nearAreaArray:areaArray13, leftUpX:815, leftUpY:738, rightBoX:1106, rightBoY:1195, number:13)
let areaNumber14 = (includeEntityArray:entityArray14, includeNodeArray:nodeArray14, nearAreaArray:areaArray14, leftUpX:1106, leftUpY:738, rightBoX:/*1445*/1527, rightBoY:1195, number:14)
let areaNumber15 = (includeEntityArray:entityArray15, includeNodeArray:nodeArray15, nearAreaArray:areaArray15, leftUpX:/*1445*/1527, leftUpY:738, rightBoX:1928, rightBoY:1088, number:15)
let areaNumber16 = (includeEntityArray:entityArray16, includeNodeArray:nodeArray16, nearAreaArray:areaArray16, leftUpX1:0, leftUpY1:1088, rightBoX1:483, rightBoY1:1195, leftUpX2:0, leftUpY2:1195, rightBoX2:391, rightBoY2:1270, semicircle:"x*x+(y-1270)*(y-1270)<=391*391", number:16)
let areaNumber17 = (includeEntityArray:entityArray17, includeNodeArray:nodeArray17, nearAreaArray:areaArray17, leftUpX:391, leftUpY:1195, rightBoX:1533, rightBoY:1345, number:17)
let areaNumber18 = (includeEntityArray:entityArray18, includeNodeArray:nodeArray18, nearAreaArray:areaArray18, leftUpX1:1445, leftUpY1:1088, rightBoX1:1928, rightBoY1:1195, leftUpX2:1533, leftUpY2:1195, rightBoX2:1928, rightBoY2:1270, semicircle:"(x-1928)*(x-1928)+(y-1270)*(y-1270)<=391*391", number:18)
let areaNumber19 = (includeEntityArray:entityArray19, includeNodeArray:nodeArray19, nearAreaArray:areaArray19, leftUpX:391, leftUpY:1345, rightBoX:611, rightBoY:1664, semicircle:"x*x+(y-1270)*(y-1270)>391*391", number:19)
let areaNumber20 = (includeEntityArray:entityArray20, includeNodeArray:nodeArray20, nearAreaArray:areaArray20, leftUpX:611, leftUpY:1345, rightBoX:1304, rightBoY:1664, number:20)
let areaNumber21 = (includeEntityArray:entityArray21, includeNodeArray:nodeArray21, nearAreaArray:areaArray21, leftUpX:1304, leftUpY:1345, rightBoX:1533, rightBoY:1664, semicircle:"(x-1928)*(x-1928)+(y-1270)*(y-1270)>391*391", number:21)
let areaNumber22 = (includeEntityArray:entityArray22, includeNodeArray:nodeArray22, nearAreaArray:areaArray22, leftUpX:0, leftUpY:1676, rightBoX:815, rightBoY:1928, number:22)
let areaNumber23 = (includeEntityArray:entityArray23, includeNodeArray:nodeArray23, nearAreaArray:areaArray23, leftUpX:815, leftUpY:1676, rightBoX:1304, rightBoY:1928, number:23)
let areaNumber24 = (includeEntityArray:entityArray24, includeNodeArray:nodeArray24, nearAreaArray:areaArray24, leftUpX:1304, leftUpY:1676, rightBoX:1928, rightBoY:1928, number:24)
let areaNumber25 = (includeEntityArray:entityArray25, includeNodeArray:nodeArray25, nearAreaArray:areaArray25, leftUpX1:0, leftUpY1:0, rightBoX1:671, rightBoY1:392, leftUpX2:0, leftUpY2:392, rightBoX2:386, rightBoY2:549, number:25)
let areaNumber26 = (includeEntityArray:entityArray26, includeNodeArray:nodeArray26, nearAreaArray:areaArray26, leftUpX:671, leftUpY:0, rightBoX:1241, rightBoY:392, number:26)
let areaNumber27 = (includeEntityArray:entityArray27, includeNodeArray:nodeArray27, nearAreaArray:areaArray27, leftUpX1:1241, leftUpY1:0, rightBoX1:1928, rightBoY1:392, leftUpX2:1533, leftUpY2:392, rightBoX2:1928, rightBoY2:549, number:27)
let areaNumber28 = (includeEntityArray:entityArray28, includeNodeArray:nodeArray28, nearAreaArray:areaArray28, leftUpX:0, leftUpY:549, rightBoX:385, rightBoY:1080, number:28)
let areaNumber29 = (includeEntityArray:entityArray29, includeNodeArray:nodeArray29, nearAreaArray:areaArray29, leftUpX:386, leftUpY:392, rightBoX:673, rightBoY:1080, number:29)
let areaNumber30 = (includeEntityArray:entityArray30, includeNodeArray:nodeArray30, nearAreaArray:areaArray30, leftUpX:673, leftUpY:392, rightBoX:1243, rightBoY:1080, number:30)
let areaNumber31 = (includeEntityArray:entityArray31, includeNodeArray:nodeArray31, nearAreaArray:areaArray31, leftUpX:1243, leftUpY:392, rightBoX:1534, rightBoY:1080, number:31)
let areaNumber32 = (includeEntityArray:entityArray32, includeNodeArray:nodeArray32, nearAreaArray:areaArray32, leftUpX:1534, leftUpY:549, rightBoX:1928, rightBoY:1080, number:32)
let areaNumber33 = (includeEntityArray:entityArray33, includeNodeArray:nodeArray33, nearAreaArray:areaArray33, leftUpX:0, leftUpY:1088, rightBoX:391, rightBoY:1270, semicircle:"x*x+(y-1270)*(y-1270)<=391*391", number:33)
let areaNumber34 = (includeEntityArray:entityArray34, includeNodeArray:nodeArray34, nearAreaArray:areaArray34, leftUpX:386, leftUpY:1080, rightBoX:1534, rightBoY:1341, number:34)
let areaNumber35 = (includeEntityArray:entityArray35, includeNodeArray:nodeArray35, nearAreaArray:areaArray35, leftUpX:1534, leftUpY:1088, rightBoX:1928, rightBoY:1270, semicircle:"(x-1928)*(x-1928)+(y-1270)*(y-1270)<=391*391", number:35)
let areaNumber36 = (includeEntityArray:entityArray36, includeNodeArray:nodeArray36, nearAreaArray:areaArray36, leftUpX:391, leftUpY:1345, rightBoX:611, rightBoY:1664, semicircle:"x*x+(y-1270)*(y-1270)>391*391", number:36)
let areaNumber37 = (includeEntityArray:entityArray37, includeNodeArray:nodeArray37, nearAreaArray:areaArray37, leftUpX:610, leftUpY:1341, rightBoX:1312, rightBoY:1664, number:37)
let areaNumber38 = (includeEntityArray:entityArray38, includeNodeArray:nodeArray38, nearAreaArray:areaArray38, leftUpX:1304, leftUpY:1345, rightBoX:1533, rightBoY:1664, semicircle:"(x-1928)*(x-1928)+(y-1270)*(y-1270)>391*391", number:38)
let areaNumber39 = (includeEntityArray:entityArray39, includeNodeArray:nodeArray39, nearAreaArray:areaArray39, leftUpX:0, leftUpY:1670, rightBoX:610, rightBoY:1928, number:39)
let areaNumber40 = (includeEntityArray:entityArray40, includeNodeArray:nodeArray40, nearAreaArray:areaArray40, leftUpX:610, leftUpY:1670, rightBoX:1312, rightBoY:1928, number:40)
let areaNumber41 = (includeEntityArray:entityArray41, includeNodeArray:nodeArray41, nearAreaArray:areaArray41, leftUpX:1312, leftUpY:1670, rightBoX:1928, rightBoY:1928, number:41)
let areaNumber42 = (includeEntityArray:entityArray42, includeNodeArray:nodeArray42, nearAreaArray:areaArray42, leftUpX:0, leftUpY:1195, rightBoX:1928, rightBoY:1928, number:42)



//区域字典
let areaDictionary1 = [1:areaNumber1, 2:areaNumber2, 3:areaNumber3, 4:areaNumber4, 5:areaNumber5, 6:areaNumber6, 7:areaNumber7, 8:areaNumber8, 9:areaNumber9, 10:areaNumber10, 11:areaNumber11, 12:areaNumber12, 13:areaNumber13, 14:areaNumber14, 15:areaNumber15, 17:areaNumber17, 20:areaNumber20, 22:areaNumber22, 23:areaNumber23,
    24:areaNumber24, 26:areaNumber26, 28:areaNumber28, 29:areaNumber29, 30:areaNumber30, 31:areaNumber31,
    32:areaNumber32, 34:areaNumber34, 37:areaNumber37, 39:areaNumber39,
    40:areaNumber40, 41:areaNumber41, 42:areaNumber42]
let areaDictionary2 = [16:areaNumber16, 18:areaNumber18]
let areaDictionary3 = [25:areaNumber25, 27:areaNumber27]
let areaDictionary4 = [19:areaNumber19, 21:areaNumber21, 36:areaNumber36, 38:areaNumber38]
let areaDictionary5 = [33:areaNumber33, 35:areaNumber35]


//卫生间字典
let toiletDictionary = ["卫生间1-1" : FW1, "卫生间1-2" : FW2, "卫生间1-3" : FW3, "卫生间1-4" : FW4, "卫生间1-5" : FW5, "卫生间1-6" : FW6, "卫生间1-7" : FW7, "卫生间1-8" : FW8, "卫生间2-1" : SW1, "卫生间2-2" : SW2, "卫生间2-3" : SW3, "卫生间2-4" : SW4, "卫生间2-5" :SW5, "卫生间2-6" : SW6, "卫生间2-7" : SW7, "卫生间2-8" : SW8]
//商铺字典
let storeDictionary = [FS1.title : FS1, FS2.title : FS2, FS3.title : FS3, FS4.title : FS4, FS5.title : FS5, FS6.title : FS6, FS7.title : FS7, FS8.title : FS8, FS9.title : FS9, FS10.title : FS10, FS11.title : FS11, FS12.title : FS12, FS13.title : FS13, FS14.title : FS14, FS15.title : FS15, FS16.title : FS16, FS17.title : FS17, FS18.title : FS18, FS19.title : FS19, FS20.title : FS20, FS21.title : FS21, FS22.title : FS22, FS23.title : FS23, FS24.title : FS24, FS25.title : FS25, FS26.title : FS26, FS27.title : FS27, FS28.title : FS28, FS29.title : FS29, FS30.title : FS30, FS31.title : FS31, FS32.title: FS32, FS33.title : FS33, FS34.title : FS34, FS35.title : FS35, FS36.title : FS36, FS37.title : FS37, FS38.title : FS38, FS39.title : FS39, FS40.title : FS40, FS41.title : FS41, FS42.title : FS42, SS1.title : SS1, SS2.title : SS2, SS3.title : SS3, SS4.title : SS4, SS5.title : SS5, SS6.title : SS6, SS7.title : SS7, SS8.title : SS8, SS9.title : SS9, SS10.title : SS10, SS11.title : SS11, SS12.title :SS12, SS13.title : SS13, SS14.title : SS14, SS15.title : SS15, SS16.title : SS16, SS17.title : SS17, SS18.title : SS18, SS19.title : SS19, SS20.title : SS20, SS21.title : SS21, SS22.title : SS22, SS23.title : SS23, SS24.title : SS24, SS25.title : SS25, SS26.title : SS26, SS27.title : SS27, SS28.title : SS28, SS29.title : SS29, SS30.title : SS30, SS31.title : SS31, SS32.title : SS32, SS33.title : SS33, SS34.title : SS34]
//电梯字典
let elevatorDictionary = ["电梯0-1" : ZELS1, "电梯0-2" : ZELS2, "电梯0-3" : ZELS3, "电梯0-4" : ZELS4, "电梯1-1" : FELS1, "电梯1-2" : FELS2, "电梯1-3" : FELS3, "电梯1-4" : FELS4, "电梯1-5" : FELS5,
    "电梯1-6" : FELS6, "电梯1-7" : FELS7, "电梯1-8" : FELS8, "电梯2-1" : SELS1, "电梯2-2" : SELS2, "电梯2-3" : SELS3, "电梯2-4" : SELS4, "电梯2-5" : SELS5, "电梯2-6" : SELS6, "电梯2-7" : SELS7,
    "电梯2-8" : SELS8]
//出口字典
let exitDictionary = ["出入口0-1" : ZD1, "出入口0-2" : ZD2, "出入口0-3" : ZD3, "出入口1-1" : FD1, "出入口1-2" : FD2, "出入口1-3" : FD3, "出入口2-1" : SD1, "出入口2-2" : SD2, "出入口2-3" : SD3]
//登机口字典
let boardingGateDictionary = ["登机口1-1" : FE1, "登机口1-2" : FE2, "登机口1-3" : FE3, "登机口1-4" : FE4, "登机口1-5" : FE5, "登机口1-6" : FE6, "登机口1-7" : FE7, "登机口1-8" : FE8, "登机口1-9" :FE9, "登机口1-10" : FE10, "登机口1-11" : FE11,
    "登机口1-12" : FE12, "登机口1-13" : FE13, "登机口1-14" : FE14, "登机口1-15" : FE15, "登机口1-16" : FE16, "登机口1-17" : FE17, "登机口1-18" :FE18, "登机口2-1" :SE1, "登机口2-2" :SE2, "登机口2-3" : SE3, "登机口2-4" : SE4, "登机口2-5" : SE5, "登机口2-6" : SE6,
    "登机口2-7" : SE7, "登机口2-8" : SE8, "登机口2-9" : SE9, "登机口2-10" : SE10, "登机口2-11" : SE11, "登机口2-12" :SE12, "登机口2-13" : SE13, "登机口2-14" : SE14, "登机口2-15" : SE15, "登机口2-16" : SE16, "登机口2-17" : SE17, "登机口2-18" : SE18]
//值机柜台字典
let checkInDictionary = ["值机柜台2-1" : SC1, "值机柜台2-2" : SC2, "值机柜台2-3" : SC3, "值机柜台2-4" : SC4, "值机柜台2-5" : SC5, "值机柜台2-6" : SC6]
//安检口字典
let securityCheckDictionary = ["安检口2-1" : SSC1, "安检口2-2" : SSC2, "安检口2-3" : SSC3]
//饮水处字典
let wateringPlaceDictionary = ["饮水处1-1" : FWT1, "饮水处1-2" : FWT2, "饮水处1-3" : FWT3, "饮水处1-4" : FWT4, "饮水处1-5" : FWT5, "饮水处1-6" : FWT6, "饮水处1-7" : FWT7, "饮水处1-8" : FWT8, "饮水处1-9" : FWT9, "饮水处1-10" : FWT10,
    "饮水处1-11" : FWT11, "饮水处1-12" : FWT12, "饮水处2-1" : SWT1, "饮水处2-2" : SWT2, "饮水处2-3" : SWT3, "饮水处2-4" : SWT4, "饮水处2-5" : SWT5, "饮水处2-6" : SWT6, "饮水处2-7" : SWT7, "饮水处2-8" : SWT8, "饮水处2-9" : SWT9,
    "饮水处2-10" : SWT10, "饮水处2-11" : SWT11, "饮水处2-12" : SWT12]
//问讯处字典
let inquiryDeskDictionary = ["问讯处1-1" : FQ1, "问讯处1-2" : FQ2, "问讯处2-1" : SQ1, "问讯处2-2" : SQ2]
//行李盘字典
let luggageDictionary = ["行李盘1-1" : FB1, "行李盘1-2" : FB2, "行李盘1-3" : FB3, "行李盘1-4" : FB4, "行李盘1-5" : FB5, "行李盘1-6" : FB6]


/**************************************** 结束 ********************************************/

