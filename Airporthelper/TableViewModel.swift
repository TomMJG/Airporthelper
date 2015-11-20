//
//  TodoModel.swift
//  UserInterfaceGoldMasterVersion
//
//  Created by Fantask on 15/4/16.
//  Copyright (c) 2015年 Fantask. All rights reserved.
//

import UIKit

//TableView的模版类
class TableViewModel: NSObject {
    var id : String         //序号
    var image : String      //图片
    var title : String      //标题
    
    init(id : String ,title:String, image:String) {
        self.id = id
        self.image = image
        self.title = title 
    }
    
    func getEntityName(entity : TableViewModel) -> String {
        return entity.title     //返回entity的名字
    }
}
