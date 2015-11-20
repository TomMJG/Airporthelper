//
//  shopCategoryViewConroller.swift
//  UserInterfaceGoldMasterVersion
//
//  Created by Fantask on 15/4/23.
//  Copyright (c) 2015年 Fantask. All rights reserved.
//

import UIKit
import CoreData

var shopLocalSpecialty : [TableViewModel] = []      //特产的TableViewModel数组
var shopClothes : [TableViewModel] = []             //服饰的TableViewModel数组
var shopBook : [TableViewModel] = []                //书店的TableViewModel数组
var shopConvenienceStore : [TableViewModel] = []    //便利店的TableViewModel数组
var shopChoose : [TableViewModel] = []              //当前选择某一类的TableViewModel数组

class shopCategoryViewConroller: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBAction func cancel(sender: UIButton) {
        
        //判断目的地数组是否为空
        if !destinations.isEmpty {
            destinations.removeLast()
        }
        
    }
    @IBOutlet weak var categoryTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        shopLocalSpecialty = [TableViewModel(id: "1",title:"中华特产中心",image: "中华特产中心"), TableViewModel(id: "2",title:"番禺特产",image: "番禺特产"), TableViewModel(id: "3",title:"一品珠",image: "一品珠"), TableViewModel(id: "4",title:"绿野人家",image: "绿野人家"), TableViewModel(id: "5",title:"沈阳特产",image: "沈阳特产"), TableViewModel(id: "6",title:"老家特产",image: "老家特产")]
        
        shopClothes = [TableViewModel(id:"1",title: "KENZO",image: "KENZO"),TableViewModel(id:"2",title:"PRADA",image:"PRADA"),TableViewModel(id:"3",title:"VERSACE",image:"VERSACE"),TableViewModel(id:"4",title:"WOMEN'S COLLECTION",image:"WOMEN'S COLLECTION"),TableViewModel(id:"5",title:"Baleno",image:"Baleno"),TableViewModel(id:"6",title:"CK",image:"CK"),TableViewModel(id:"7",title:"哥弟",image:"哥弟"),TableViewModel(id:"8",title:"ELAND",image:"ELAND"),TableViewModel(id:"9",title:"GUCCI",image:"GUCCI"),TableViewModel(id:"10",title:"ZARA",image:"ZARA"),TableViewModel(id:"11",title:"阿玛尼",image:"阿玛尼"),TableViewModel(id:"12",title:"BURBERRY",image:"BURBERRY"),TableViewModel(id:"13",title:"Carry Lolland",image:"Carry Lolland"),TableViewModel(id:"14",title:"CHAILI",image:"CHAILI"),TableViewModel(id:"15",title:"与狼共舞",image:"与狼共舞"),TableViewModel(id:"16",title:"Eagle Honor",image:"Eagle Honor"),TableViewModel(id:"17",title:"杰克琼斯",image:"杰克琼斯"),TableViewModel(id:"18",title:"MONCLER",image:"MONCLER"),TableViewModel(id:"19",title:"魔域王子",image:"魔域王子"),TableViewModel(id:"20",title:"七匹狼",image:"七匹狼"),TableViewModel(id:"21",title:"STAVA",image:"STAVA"),TableViewModel(id:"22",title:"悉尼盾",image:"悉尼盾"),TableViewModel(id:"23",title:"ZADIE",image:"ZADIE")]
        
        shopBook = [TableViewModel(id:"1",title:"奶奶的书屋",image:"奶奶的书屋"),TableViewModel(id:"2",title:"阑韵书屋",image:"阑韵书屋"),TableViewModel(id:"3",title:"21世纪书店",image:"21世纪书店"),TableViewModel(id:"4",title:"年轻人",image:"年轻人"),TableViewModel(id:"5",title:"Bookworld",image:"Bookworld"),TableViewModel(id:"6",title:"COCOBOOK",image:"COCOBOOK"),TableViewModel(id:"7",title:"漫步者",image:"漫步者")]
        
        shopConvenienceStore = [TableViewModel(id: "1", title: "711便利店", image: "711便利店"),TableViewModel(id: "2", title: "wowo超市", image: "wowo超市"),TableViewModel(id: "3", title: "快乐便利", image: "快乐便利")]

        switch storeCategoryName {
        case "特产":
            shopChoose = shopLocalSpecialty
        case "服饰":
            shopChoose = shopClothes
        case "图书":
            shopChoose = shopBook
        case "便利店":
            shopChoose = shopConvenienceStore
        default:
            print("店铺类别选择出错！")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //DataSource两个必须实现的方法
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shopChoose.count
    }
    
    //加载TableView的内容
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = self.categoryTableView.dequeueReusableCellWithIdentifier("categoryCell")! as UITableViewCell
        let shoppingTogo : TableViewModel = shopChoose[indexPath.row] as TableViewModel
        let title = cell.viewWithTag(112) as! UILabel
        
        //显示tableView中的图片
        let image = cell.viewWithTag(111) as! UIImageView
        image.image = UIImage(named: shoppingTogo.image)
        title.text = shoppingTogo.title
        
        return cell
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "StoreHasBeenChosen" {
            let indexPath = categoryTableView.indexPathForSelectedRow
            if let index = indexPath {
                store = shopChoose[index.row]
                storeName = store.getEntityName(store)
            }
        }
    }
    
    //点击cell，实现终点的选择
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //判断是否已收藏
        var results : [NSManagedObject]?
        var showAlert = true
        do {
            results = try managedObjectContents?.executeFetchRequest(fetchRequest) as? [NSManagedObject]
            if let collectStores = results {
                if collectStores != [] {
                    for var i = 0;i < collectStores.count;i++ {
                        if shopChoose[indexPath.row].title == collectStores[i].valueForKey("title") as! String {
                            showAlert = false
                        }
                    }
                }
                else {
                    showAlert = true
                }
            }
        } catch let error as NSError {
            print("Fetch failed: \(error.localizedDescription)")
        }

        
        if showAlert {
            let alert : SIAlertView = SIAlertView(title: "收藏", andMessage: "是否将此店收藏")
            alert.addButtonWithTitle("是", type: SIAlertViewButtonType.Default) { (alert:SIAlertView!) -> Void in
                self.saveUser(shopChoose[indexPath.row].title)
                if isInsertingMiddleDestination {
                    destinations.insert(entityData[shopChoose[indexPath.row].title]!, atIndex: 0)
                } else {
                    destinations.removeAll(keepCapacity: false)
                    destinations.insert(entityData[shopChoose[indexPath.row].title]!, atIndex: destinations.count)
                }
                ifChangeDestination = true
                
                //调用 totalRouteMake生成路径
                let getdata = GetDataFromDataModel()
                getdata.totalRouteMake()
                self.performSegueWithIdentifier("StoreHasBeenChosen", sender: self)
            }
            alert.addButtonWithTitle("否", type: SIAlertViewButtonType.Default) { (alert2:SIAlertView!) -> Void in
                if isInsertingMiddleDestination {
                    destinations.insert(entityData[shopChoose[indexPath.row].title]!, atIndex: 0)
                } else {
                    destinations.removeAll(keepCapacity: false)
                    destinations.insert(entityData[shopChoose[indexPath.row].title]!, atIndex: destinations.count)
                }
                ifChangeDestination = true
                
                //调用 totalRouteMake生成路径
                let getdata = GetDataFromDataModel()
                getdata.totalRouteMake()
                self.performSegueWithIdentifier("StoreHasBeenChosen", sender: self)
            }
            alert.transitionStyle = SIAlertViewTransitionStyle.Bounce
            alert.show()
        }
        else {
            if isInsertingMiddleDestination {
                destinations.insert(entityData[shopChoose[indexPath.row].title]!, atIndex: 0)
            } else {
                destinations.removeAll(keepCapacity: false)
                destinations.insert(entityData[shopChoose[indexPath.row].title]!, atIndex: destinations.count)
            }
            ifChangeDestination = true
            
            //调用 totalRouteMake生成路径
            let getdata = GetDataFromDataModel()
            getdata.totalRouteMake()
            self.performSegueWithIdentifier("StoreHasBeenChosen", sender: self)
        }
    }
    
    //保存信息进入coreData
    func saveUser(title: String) {
        //1、获取总代理和托管对象内容总管
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedObjectContents = appDelegate.managedObjectContext
        
        //2、建立一个entity，建立一个person，归入到entity
        let entity = NSEntityDescription.entityForName("Collect", inManagedObjectContext: managedObjectContents!)
        
        let store = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedObjectContents)
        
        //3、保存文本框中的值到person
        store.setValue(title, forKey: "title")
        
        //4、保存entity到托管对象总管中
        appDelegate.saveContext()
    }
}
