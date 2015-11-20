//
//  nearbyViewController.swift
//  UserInterfaceGoldMasterVersion
//
//  Created by Fantask on 15/4/19.
//  Copyright (c) 2015年 Fantask. All rights reserved.
//

import UIKit

var stores : [TableViewModel] = []
var filteredTogos : [TableViewModel] = []
class NearbyViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchDisplayDelegate {
    
    @IBAction func cancel(sender: UIButton) {
        stores.removeAll(keepCapacity: false)
    }
    
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var alartLabel: UILabel!
    @IBOutlet weak var alartLabel_xwx: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        stores.removeAll(keepCapacity: false)
        
        let nearBy = GetDataFromDataModel()
        var i = 1
        if !nearBy.findNearby().isEmpty {
            tipLabel.hidden = false
    
            //根据不同类别显示标题图片
            for item in nearBy.findNearby() {
                if (item.hasPrefix("电梯")) {
                    stores.insert(TableViewModel(id: "\(i)", title: item, image: "elevator"), atIndex: stores.count)
                }
                else if (item.hasPrefix("卫生间")) {
                    stores.insert(TableViewModel(id: "\(i)", title: item, image: "toilet"), atIndex: stores.count)
                }
                else if (item.hasPrefix("饮水处")) {
                    stores.insert(TableViewModel(id: "\(i)", title: item, image: "drinkWater"), atIndex: stores.count)
                }
                else if (item.hasPrefix("出入口")) {
                    stores.insert(TableViewModel(id: "\(i)", title: item, image: "exit"), atIndex: stores.count)
                }
                else if (item.hasPrefix("问讯处")) {
                    stores.insert(TableViewModel(id: "\(i)", title: item, image: "inquiryDesk"), atIndex: stores.count)
                }
                else if (item.hasPrefix("值机柜台")) {
                    stores.insert(TableViewModel(id: "\(i)", title: item, image: "check-in"), atIndex: stores.count)
                }
                else if (item.hasPrefix("安检口")) {
                    stores.insert(TableViewModel(id: "\(i)", title: item, image: "safetyCheck"), atIndex: stores.count)
                }
                else if (item.hasPrefix("行李盘")) {
                    stores.insert(TableViewModel(id: "\(i)", title: item, image: "luggage"), atIndex: stores.count)
                }
                else {
                    stores.insert(TableViewModel(id: "\(i)", title: item, image: "\(item)"), atIndex: stores.count)
                }
                i++
            }
        } else {
            tipLabel.hidden = true
            if currentPosition[2] == 0.0 {
                alartLabel.text = "停车场附近什么也没有"
                alartLabel_xwx.text = "（x ω x）"
            } else {
                alartLabel.text = "您已经走到荒郊野岭啦"
                alartLabel_xwx.text = "（x ω x）"
            }
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //DataSource两个必须实现的方法
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == searchDisplayController?.searchResultsTableView {
            return filteredTogos.count
        }
        else {
            return stores.count
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("nearbyCell")! as UITableViewCell
        //var togo : TodoModel = nearbyTogos[indexPath.row] as TodoModel
        var nearbyEntity : TableViewModel
        if tableView == searchDisplayController?.searchResultsTableView {
            nearbyEntity = filteredTogos[indexPath.row] as TableViewModel
        }
        else {
            nearbyEntity = stores[indexPath.row] as TableViewModel
        }
        let title = cell.viewWithTag(105) as! UILabel
        
        //这两句可以实现tableView中图片的显示
        let image = cell.viewWithTag(106) as! UIImageView
        image.image = UIImage(named: nearbyEntity.image)
        title.text = nearbyEntity.title
        
        return cell
    }
    
    //搜索栏
    func searchDisplayController(controller: UISearchDisplayController, shouldReloadTableForSearchString searchString: String?) -> Bool {
        filteredTogos = stores.filter(){$0.title.rangeOfString(searchString!) != nil}
        return true
    }
    //设置搜索显示的tableView的每一个高
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        for (entityName, entity) in entityData {
            ///////////////////////////
            if tableView == searchDisplayController?.searchResultsTableView {
                if entityName == filteredTogos[indexPath.row].getEntityName(filteredTogos[indexPath.row]) {
                    
                    if !destinations.isEmpty {
                        destinations.removeAll(keepCapacity: false)     //清除destinations目的地数组
                    }
                    
                    destinations.insert(entityData[filteredTogos[indexPath.row].getEntityName(filteredTogos[indexPath.row])]!, atIndex: destinations.count)
                    ifChangeDestination = true
                    ifAddDestination = true
                    ifAddDestinationAtEnd = true
                    
                    let getdata = GetDataFromDataModel()
                    getdata.totalRouteMake()        //生成路径
                    
                }
            }
            else {
                if entityName == stores[indexPath.row].getEntityName(stores[indexPath.row]) {
                    
                    if !destinations.isEmpty {
                        destinations.removeAll(keepCapacity: false)     //清除destinations目的地数组
                    }
                    
                    destinations.insert(entityData[stores[indexPath.row].getEntityName(stores[indexPath.row])]!, atIndex: destinations.count)
                    ifChangeDestination = true
                    ifAddDestination = true
                    ifAddDestinationAtEnd = true
                    
                    let getdata = GetDataFromDataModel()
                    getdata.totalRouteMake()        //生成路径
                    
                }
            }

        }
        
    }
    
}