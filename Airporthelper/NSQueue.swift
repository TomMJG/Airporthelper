//
//  NSQueue.swift
//  UserInterfaceGoldMasterVersion
//
//  Created by Fantask on 15/4/28.
//  Copyright (c) 2015年 Fantask. All rights reserved.
//


//NSQueue实现队列

    import UIKit
    
    
    class NSQueue: NSObject {
        
        var Queue = [Int]()
        
        func enqueue(addnode: Int) {
            Queue.append (addnode)
        }
        
        func dequeue() -> Int {
            let end = Queue[Queue.count-1]
            Queue.removeAtIndex(Queue.count-1)
            return end
        }
        
        func count() -> Int {
            return Queue.count
        }
        
    }



