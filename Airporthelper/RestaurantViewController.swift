//
//  ViewController.swift
//  UserInterfaceGoldMasterVersion
//
//  Created by Fantask on 15/4/16.
//  Copyright (c) 2015年 Fantask. All rights reserved.
//

import UIKit
import CoreData

//美食的TableViewModel数组
var foods : [TableViewModel] = []

class RestaurantViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIGestureRecognizerDelegate {
   
    @IBOutlet weak var tableView: UITableView!


    @IBOutlet weak var label: UILabel!
    @IBAction func cancel(sender: UIButton) {
        //清空用于存放目的地的数组的最后一项
        if !destinations.isEmpty {
            destinations.removeLast()
        }
        
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        foods = [TableViewModel(id: "1", title: "汉堡王", image: "汉堡王"),TableViewModel(id: "2", title: "府城", image: "府城"), TableViewModel(id: "3", title: "厚道人家", image: "厚道人家"),TableViewModel(id: "4", title: "乡村基", image: "乡村基"),TableViewModel(id: "5", title: "银树西餐厅", image: "银树西餐厅"),TableViewModel(id: "6", title: "欧洲之星", image: "欧洲之星"),TableViewModel(id: "7", title: "德克士", image: "德克士"),TableViewModel(id: "8", title: "肯德基", image: "肯德基"),TableViewModel(id: "9", title: "麦当劳", image: "麦当劳"),TableViewModel(id: "10", title: "三生三味", image: "三生三味"),TableViewModel(id: "11", title: "圆缘苑", image: "圆缘苑"),TableViewModel(id: "12", title: "必胜客", image: "必胜客"),TableViewModel(id: "13", title: "爱丽丝西餐厅", image: "爱丽丝西餐厅"),TableViewModel(id: "14", title: "Business Name", image: "Business Name")]
            
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //DataSource两个必须实现的方法
    //得出TableView中cell的个数
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foods.count
    }
    
    //向TableView中添加图片和文字
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("eatCell")! as UITableViewCell
        let food : TableViewModel = foods[indexPath.row] as TableViewModel
        let title = cell.viewWithTag(101) as! UILabel
        
        //实现图片的显示
        let image = cell.viewWithTag(102) as! UIImageView
        image.image = UIImage(named: food.image)
        title.text = food.title
        
        return cell
    }
    
    
    //界面之间的跳转，通过segue实现
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "RestaurantHasBeenChosen" {
            var indexPath = tableView.indexPathForSelectedRow
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
                        if foods[indexPath.row].title == collectStores[i].valueForKey("title") as! String {
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
                self.saveUser(foods[indexPath.row].title)
                if isInsertingMiddleDestination {
                    destinations.insert(entityData[foods[indexPath.row].title]!, atIndex: 0)
                } else {
                    destinations.removeAll(keepCapacity: false)
                    destinations.insert(entityData[foods[indexPath.row].title]!, atIndex: destinations.count)
                }
                ifChangeDestination = true
                
                //调用 totalRouteMake生成路径
                let getdata = GetDataFromDataModel()
                getdata.totalRouteMake()
                self.performSegueWithIdentifier("RestaurantHasBeenChosen", sender: self)
            }
            alert.addButtonWithTitle("否", type: SIAlertViewButtonType.Default) { (alert2:SIAlertView!) -> Void in
                if isInsertingMiddleDestination {
                    destinations.insert(entityData[foods[indexPath.row].title]!, atIndex: 0)
                } else {
                    destinations.removeAll(keepCapacity: false)
                    destinations.insert(entityData[foods[indexPath.row].title]!, atIndex: destinations.count)
                }
                ifChangeDestination = true
                
                //调用 totalRouteMake生成路径
                let getdata = GetDataFromDataModel()
                getdata.totalRouteMake()
                self.performSegueWithIdentifier("RestaurantHasBeenChosen", sender: self)
            }
            alert.transitionStyle = SIAlertViewTransitionStyle.Bounce
            alert.show()
        }
        else {
            if isInsertingMiddleDestination {
                destinations.insert(entityData[foods[indexPath.row].title]!, atIndex: 0)
            } else {
                destinations.removeAll(keepCapacity: false)
                destinations.insert(entityData[foods[indexPath.row].title]!, atIndex: destinations.count)
            }
            ifChangeDestination = true
            
            //调用 totalRouteMake生成路径
            let getdata = GetDataFromDataModel()
            getdata.totalRouteMake()
            self.performSegueWithIdentifier("RestaurantHasBeenChosen", sender: self)
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


