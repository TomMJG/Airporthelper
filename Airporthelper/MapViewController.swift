//
//  MapViewController.swift
//  UserInterfaceGoldMasterVersion
//
//  Created by papageno on 15/8/13.
//  Copyright (c) 2015年 Xu_Alex. All rights reserved.
//

import UIKit

//浏览全地图功能
class MapViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var backButton: UIButton!
    
    var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        let image = UIImage(named: "map.png")
        imageView = UIImageView(image: image)
        imageView.frame = CGRect(origin: CGPoint(x: 0, y: 0), size:image!.size)
        scrollView.addSubview(imageView)
        scrollView.userInteractionEnabled = true
        self.view.addSubview(backButton)
        backButton.layer.cornerRadius = 10
        backButton.layer.borderWidth = 2
        backButton.layer.borderColor = UIColor.yellowColor().CGColor

        scrollView.contentSize = image!.size

        let doubleTapRecognizer = UITapGestureRecognizer(target: self, action: "doubleTapped:")
        doubleTapRecognizer.numberOfTapsRequired = 2
        doubleTapRecognizer.numberOfTouchesRequired = 1
        scrollView.addGestureRecognizer(doubleTapRecognizer)

        let scrollViewFrame = scrollView.frame
        let scaleWidth = scrollViewFrame.size.width / scrollView.contentSize.width
        let scaleHeight = scrollViewFrame.size.height / scrollView.contentSize.height
        let minScale = min(scaleWidth, scaleHeight)
        
        let screenSize = UIScreen.mainScreen().bounds
        if screenSize.size.width == 414 {   //如果是 iPhone 6 plus 的屏幕大小
            scrollView.minimumZoomScale = minScale * 1.775
        } else if screenSize.size.width == 375 {    //如果是 iPhone 6 的屏幕大小
            scrollView.minimumZoomScale = minScale * 1.65
        } else {    //如果是 iPhone 5 或 iPhone 5s 等屏幕大小
            scrollView.minimumZoomScale = minScale * 1.4
        }
        
        scrollView.maximumZoomScale = 1.0
        scrollView.zoomScale = minScale
        
        centerScrollViewContents()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //内容居中
    func centerScrollViewContents() {
        let boundsSize = scrollView.bounds.size
        var contentsFrame = imageView.frame
        
        if contentsFrame.size.width < boundsSize.width {
            contentsFrame.origin.x = (boundsSize.width - contentsFrame.size.width) / 2.0 - 110
        } else {
            contentsFrame.origin.x = 0.0
        }
    
        if contentsFrame.size.height < boundsSize.height {
            contentsFrame.origin.y = (boundsSize.height - contentsFrame.size.height) / 2.0
        } else {
            contentsFrame.origin.y = 0.0
        }
    
        imageView.frame = contentsFrame
    }
    
    //双击手势操作
    func doubleTapped(recognizer: UITapGestureRecognizer) {

        let pointInView = recognizer.locationInView(imageView)
        
        var newZoomScale = scrollView.zoomScale * 1.5
        newZoomScale = min(newZoomScale, scrollView.maximumZoomScale)
        
        if newZoomScale == scrollView.maximumZoomScale {
            newZoomScale = scrollView.minimumZoomScale
        }
        
        let scrollViewSize = scrollView.bounds.size
        let w = scrollViewSize.width / newZoomScale
        let h = scrollViewSize.height / newZoomScale
        let x = pointInView.x - (w / 2.0)
        let y = pointInView.y - (h / 2.0)
        
        let rectToZoomTo = CGRectMake(x, y, w, h);
        
        scrollView.zoomToRect(rectToZoomTo, animated: true)
    }
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    func scrollViewDidZoom(scrollView: UIScrollView) {
        centerScrollViewContents()
    }
    
}