//
//  HelperViewController.swift
//  UserInterfaceGoldMasterVersion
//
//  Created by Fantask on 15/4/19.
//  Copyright (c) 2015年 Fantask. All rights reserved.
//

//帮助界面
import UIKit

class HelperViewController: UIViewController,UIPageViewControllerDataSource {
    
    var pageViewController:UIPageViewController!
    var pageTitles = ["绿色大头针代表当前位置", "导航", "根据提示即可开始导航", "附近可导航至附近地点", "中途可选择添加目的地", "也可以选择取消导航", "在这里选择偏好设置", "选择通知方式"]
    var pageImage = ["page3", "page4", "page5", "page6", "page7", "page8", "page9", "page10"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.pageViewController = self.storyboard?.instantiateViewControllerWithIdentifier("PageViewController") as! UIPageViewController
        
        self.pageViewController.dataSource = self
        
        let startVC = self.viewControllerAtIndex(0) as ContentViewController
        let viewControllers = NSArray(object:  startVC)
        
//        self.pageViewController.setViewControllers(viewControllers as [AnyObject] as [AnyObject], direction: .Forward, animated:true , completion:nil )
        
        self.pageViewController.setViewControllers(viewControllers as [AnyObject] as? [UIViewController], direction: .Forward, animated: true, completion: nil)
        
        self.pageViewController.view.frame = CGRectMake(0,30, self.view.frame.width,self.view.frame.size.height-60)
        
        self.addChildViewController(self.pageViewController)
        self.view.addSubview(self.pageViewController.view)
        self.pageViewController.didMoveToParentViewController(self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func viewControllerAtIndex(index:Int) -> ContentViewController{
        if(self.pageTitles.count == 0)||(index >= self.pageTitles.count)
        {
            return ContentViewController()
        }
        
        let vc:ContentViewController = self.storyboard?.instantiateViewControllerWithIdentifier("ContentViewController") as! ContentViewController
        
        
        vc.imageFile = self.pageImage[index] as String
        vc.titleText = self.pageTitles[index] as String
        vc.pageIndex = index
        
        return vc
    }
    
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        let vc = viewController as! ContentViewController
        var index = vc.pageIndex as Int
        if (index == 0 || index == NSNotFound)
        {
            return nil
        }
        index--
        return self.viewControllerAtIndex(index)
        
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        let vc = viewController.self as! ContentViewController
        var index = vc.pageIndex as Int
        if(index == NSNotFound)
        {
            return nil
        }
        index++
        if(index == self.pageTitles.count)
        {
            return nil
        }
        
        return self.viewControllerAtIndex(index)
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return self.pageTitles.count
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 0
    }
    
    
}
