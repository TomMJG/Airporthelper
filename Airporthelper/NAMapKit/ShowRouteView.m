//
//  NUIImageView.m
//  Pods
//
//  Created by Xingjeever on 4/20/15.
//
//

#import "ShowRouteView.h"
#import "Airporthelper-Swift.h"

@implementation ShowRouteView
//
  //getRoute *hello = [[getRoute alloc] init];

- (void)drawRect:(CGRect)rect {
     GetDataFromDataModel *h = [[GetDataFromDataModel alloc] init];
    
    if (h.returnTotalRouteX.count == 0) {
        //NSLog(@"it is empty");
    }
    else{
        double zoom = [h returnZoom];
        CGFloat framex = [h returnFrameX];
        CGFloat framey = [h returnFrameY];
        double centerx = framex/2/zoom;
        double centery = framey/2/zoom;
        double currentx = [h returnCurrentPositionX];
        double currenty = [h returnCurrentPositionY];
        double x;
        int latestCurrentFloorDestinationX = [h returnLatestCurrentFloorDestinationX];
        int latestCurrentFloorDestinationY = [h returnLatestCurrentFloorDestinationY];
        
        
        CGContextRef context = UIGraphicsGetCurrentContext();
        //设置线条样式
        CGContextSetLineCap(context, kCGLineCapSquare);
        //设置线条粗细宽度
        CGContextSetLineWidth(context, 3.0);
        //设置颜色
        CGContextSetRGBStrokeColor(context, 1.0, 0.0, 0.0, 1.0);
        //开始一个起始路径
        CGContextBeginPath(context);
        //起始点设置为(当前位置)
        CGContextMoveToPoint(context,framex/2 + (currentx - centerx) * zoom , framey/2 + (currenty - centery) * zoom);
        x = h.returnCurrentFloor;
        if(h.returnTotalRouteCount >= 2){
        if([h.returnTotalRouteFloor[1] intValue] != h.returnCurrentFloor) {
//            CGContextAddLineToPoint(context, framex/2 + ([h.returnTotalRouteX[0] intValue] - centerx) * zoom,framey/2 + ([h.returnTotalRouteY[0] intValue] - centery) * zoom);
        }
        
        else{
            double x1 = [h.returnTotalRouteX[0] doubleValue] - currentx;
            double y1 = [h.returnTotalRouteY[0] doubleValue] - currenty;
            double x2 = [h.returnTotalRouteX[1] doubleValue] - currentx;
            double y2 = [h.returnTotalRouteY[1] doubleValue] - currenty;
            if ((x1*x2+y1*y2)>0){
                CGContextAddLineToPoint(context, framex/2 + ([h.returnTotalRouteX[0] intValue] - centerx) * zoom,framey/2 + ([h.returnTotalRouteY[0] intValue] - centery) * zoom);
            }
        }
        }
        int i = 1 ;
        while(i < h.returnTotalRouteX.count && h.returnCurrentFloor == [h.returnTotalRouteFloor[i] intValue]){
//            NSLog(@"nowx%d\n",[h.returnTotalRouteX[i] intValue]);
//            NSLog(@"nowy%d\n",[h.returnTotalRouteY[i] intValue]);
            CGContextAddLineToPoint(context, framex/2 + ([h.returnTotalRouteX[i] intValue] - centerx) * zoom,framey/2 + ([h.returnTotalRouteY[i] intValue] - centery) * zoom);
            i++;
        }
        if(latestCurrentFloorDestinationX !=0 && latestCurrentFloorDestinationY!=0){
        CGContextAddLineToPoint(context, framex/2 + (latestCurrentFloorDestinationX - centerx) * zoom,framey/2 + (latestCurrentFloorDestinationY - centery) * zoom);
        }
        
        
        CGContextStrokePath(context);
    
    }
}


@end
