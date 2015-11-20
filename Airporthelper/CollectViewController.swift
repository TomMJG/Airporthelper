//
//  CollectViewController.swift
//  UserInterfaceGoldMasterVersion
//
//  Created by 马家固 on 15/8/19.
//  Copyright (c) 2015年 Xu_Alex. All rights reserved.
//

import UIKit
import CoreData

class CollectViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    //coreData对象,NSManagedObject相当于任意类型的字典
    var collectStores : [NSManagedObject]?
    var collectEntity = [String]()
    @IBAction func cancel(sender: UIBarButtonItem) {
        //判断目的地数组是否为空
        if !destinations.isEmpty {
            destinations.removeLast()
        }
    }
    
    @IBOutlet weak var collectTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    
    //DataSource两个必须实现的方法
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return collectEntity.count
    }
    
    //加载TableView的内容
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.collectTableView.dequeueReusableCellWithIdentifier("collectCell")! as UITableViewCell
        let collectTogo : String = collectEntity[indexPath.row]
        let title = cell.viewWithTag(121) as! UILabel
        
        //显示tableView中的图片
        let image = cell.viewWithTag(130) as! UIImageView
        image.image = UIImage(named: collectTogo)
        title.text = collectTogo
        
        return cell
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "collectHasBeenChoosed" {
            let indexPath = collectTableView.indexPathForSelectedRow
            if let index = indexPath {
                store = TableViewModel(id: String(index.row),title: collectEntity[index.row],image: collectEntity[index.row])
                storeName = store.getEntityName(store)
            }
        }
        self.navigationController?.navigationBar.hidden = true
    }
    
    //删除收藏中的某一项
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            collectEntity.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
            //清除保存的数据
            let fetchedResults = (try? managedObjectContents!.executeFetchRequest(fetchRequest)) as![NSManagedObject]? //因为people是[NSManagedObject]()
            let deleteUser = fetchedResults![indexPath.row] as NSManagedObject
            managedObjectContents?.deleteObject(deleteUser)
            appDelegate.saveContext()
        }
        tableView.reloadData()
    }
    //点击cell，实现终点的选择
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        switch indexPath.row {
        case 0:
            if isInsertingMiddleDestination {
                destinations.insert(entityData[collectEntity[0]]!, atIndex: 0)
            } else {
                destinations.removeAll(keepCapacity: false)
                destinations.insert(entityData[collectEntity[0]]!, atIndex: destinations.count)
            }
            ifChangeDestination = true
        case 1:
            if isInsertingMiddleDestination {
                destinations.insert(entityData[collectEntity[1]]!, atIndex: 0)
            } else {
                destinations.removeAll(keepCapacity: false)
                destinations.insert(entityData[collectEntity[1]]!, atIndex: destinations.count)
            }
            ifChangeDestination = true
        case 2:
            if isInsertingMiddleDestination {
                destinations.insert(entityData[collectEntity[2]]!, atIndex: 0)
            } else {
                destinations.removeAll(keepCapacity: false)
                destinations.insert(entityData[collectEntity[2]]!, atIndex: destinations.count)
            }
            ifChangeDestination = true
        case 3:
            if isInsertingMiddleDestination {
                destinations.insert(entityData[collectEntity[3]]!, atIndex: 0)
            } else {
                destinations.removeAll(keepCapacity: false)
                destinations.insert(entityData[collectEntity[3]]!, atIndex: destinations.count)
            }
            ifChangeDestination = true
        case 4:
            if isInsertingMiddleDestination {
                destinations.insert(entityData[collectEntity[4]]!, atIndex: 0)
            } else {
                destinations.removeAll(keepCapacity: false)
                destinations.insert(entityData[collectEntity[4]]!, atIndex: destinations.count)
            }
            ifChangeDestination = true
        case 5:
            if isInsertingMiddleDestination {
                destinations.insert(entityData[collectEntity[5]]!, atIndex: 0)
            } else {
                destinations.removeAll(keepCapacity: false)
                destinations.insert(entityData[collectEntity[5]]!, atIndex: destinations.count)
            }
            ifChangeDestination = true
        case 6:
            if isInsertingMiddleDestination {
                destinations.insert(entityData[collectEntity[6]]!, atIndex: 0)
            } else {
                destinations.removeAll(keepCapacity: false)
                destinations.insert(entityData[collectEntity[6]]!, atIndex: destinations.count)
            }
            ifChangeDestination = true
        case 7:
            if isInsertingMiddleDestination {
                destinations.insert(entityData[collectEntity[7]]!, atIndex: 0)
            } else {
                destinations.removeAll(keepCapacity: false)
                destinations.insert(entityData[collectEntity[7]]!, atIndex: destinations.count)
            }
            ifChangeDestination = true
        case 8:
            if isInsertingMiddleDestination {
                destinations.insert(entityData[collectEntity[8]]!, atIndex: 0)
            } else {
                destinations.removeAll(keepCapacity: false)
                destinations.insert(entityData[collectEntity[8]]!, atIndex: destinations.count)
            }
            ifChangeDestination = true
        case 9:
            if isInsertingMiddleDestination {
                destinations.insert(entityData[collectEntity[9]]!, atIndex: 0)
            } else {
                destinations.removeAll(keepCapacity: false)
                destinations.insert(entityData[collectEntity[9]]!, atIndex: destinations.count)
            }
            ifChangeDestination = true
        case 10:
            if isInsertingMiddleDestination {
                destinations.insert(entityData[collectEntity[10]]!, atIndex: 0)
            } else {
                destinations.removeAll(keepCapacity: false)
                destinations.insert(entityData[collectEntity[10]]!, atIndex: destinations.count)
            }
            ifChangeDestination = true
        case 11:
            if isInsertingMiddleDestination {
                destinations.insert(entityData[collectEntity[11]]!, atIndex: 0)
            } else {
                destinations.removeAll(keepCapacity: false)
                destinations.insert(entityData[collectEntity[11]]!, atIndex: destinations.count)
            }
            ifChangeDestination = true
        case 12:
            if isInsertingMiddleDestination {
                destinations.insert(entityData[collectEntity[12]]!, atIndex: 0)
            } else {
                destinations.removeAll(keepCapacity: false)
                destinations.insert(entityData[collectEntity[12]]!, atIndex: destinations.count)
            }
            ifChangeDestination = true
        case 13:
            if isInsertingMiddleDestination {
                destinations.insert(entityData[collectEntity[13]]!, atIndex: 0)
            } else {
                destinations.removeAll(keepCapacity: false)
                destinations.insert(entityData[collectEntity[13]]!, atIndex: destinations.count)
            }
            ifChangeDestination = true
        case 14:
            if isInsertingMiddleDestination {
                destinations.insert(entityData[collectEntity[14]]!, atIndex: 0)
            } else {
                destinations.removeAll(keepCapacity: false)
                destinations.insert(entityData[collectEntity[14]]!, atIndex: destinations.count)
            }
            ifChangeDestination = true
        case 15:
            if isInsertingMiddleDestination {
                destinations.insert(entityData[collectEntity[15]]!, atIndex: 0)
            } else {
                destinations.removeAll(keepCapacity: false)
                destinations.insert(entityData[collectEntity[15]]!, atIndex: destinations.count)
            }
            ifChangeDestination = true
        case 16:
            if isInsertingMiddleDestination {
                destinations.insert(entityData[collectEntity[16]]!, atIndex: 0)
            } else {
                destinations.removeAll(keepCapacity: false)
                destinations.insert(entityData[collectEntity[16]]!, atIndex: destinations.count)
            }
            ifChangeDestination = true
        case 17:
            if isInsertingMiddleDestination {
                destinations.insert(entityData[collectEntity[17]]!, atIndex: 0)
            } else {
                destinations.removeAll(keepCapacity: false)
                destinations.insert(entityData[collectEntity[17]]!, atIndex: destinations.count)
            }
            ifChangeDestination = true
        case 18:
            if isInsertingMiddleDestination {
                destinations.insert(entityData[collectEntity[18]]!, atIndex: 0)
            } else {
                destinations.removeAll(keepCapacity: false)
                destinations.insert(entityData[collectEntity[18]]!, atIndex: destinations.count)
            }
            ifChangeDestination = true
        case 19:
            if isInsertingMiddleDestination {
                destinations.insert(entityData[collectEntity[19]]!, atIndex: 0)
            } else {
                destinations.removeAll(keepCapacity: false)
                destinations.insert(entityData[collectEntity[19]]!, atIndex: destinations.count)
            }
            ifChangeDestination = true
        case 20:
            if isInsertingMiddleDestination {
                destinations.insert(entityData[collectEntity[20]]!, atIndex: 0)
            } else {
                destinations.removeAll(keepCapacity: false)
                destinations.insert(entityData[collectEntity[20]]!, atIndex: destinations.count)
            }
            ifChangeDestination = true
        case 21:
            if isInsertingMiddleDestination {
                destinations.insert(entityData[collectEntity[21]]!, atIndex: 0)
            } else {
                destinations.removeAll(keepCapacity: false)
                destinations.insert(entityData[collectEntity[21]]!, atIndex: destinations.count)
            }
            ifChangeDestination = true
        case 22:
            if isInsertingMiddleDestination {
                destinations.insert(entityData[collectEntity[22]]!, atIndex: 0)
            } else {
                destinations.removeAll(keepCapacity: false)
                destinations.insert(entityData[collectEntity[22]]!, atIndex: destinations.count)
            }
            ifChangeDestination = true
        default:
            if isInsertingMiddleDestination {
                destinations.insert(entityData[collectEntity[23]]!, atIndex: 0)
            } else {
                destinations.removeAll(keepCapacity: false)
                destinations.insert(entityData[collectEntity[23]]!, atIndex: destinations.count)
            }
            ifChangeDestination = true
        }
        
        //调用totalRouteMake方法生成路径
        let getdata = GetDataFromDataModel()
        getdata.totalRouteMake()
    }
    
    override func viewWillAppear(animated: Bool) {
        do {
            collectStores = try managedObjectContents?.executeFetchRequest(fetchRequest) as?  [NSManagedObject]
            
            if let collects = collectStores {
                if collects != [] {
                    for var i = 0;i < collects.count;i++ {
                        collectEntity.append(collects[i].valueForKey("title") as! String)
                    }
                }
            }
        } catch let error as NSError {
            print("Fetch failed: \(error.localizedDescription)")
        }
    }
}
