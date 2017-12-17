//
//  CustomScrollView.m
//  UIScrollViewTouchHandling
//
//  Created by wangliang on 2017/12/16.
//  Copyright © 2017年 wangliang. All rights reserved.
//

#import "CustomScrollView.h"

@implementation CustomScrollView


- (UIView*)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    
//    UIView* subView = [self viewWithTag:100];
//
//    if (CGRectContainsPoint(subView.frame, point)) {
//        return [super hitTest:point withEvent:event];
//    }
//
//    return nil;
    
    
    UIView* view = [super hitTest:point withEvent:event];
    
    if (view == self) {
        return nil;
    }
    
    return view;
}

//- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event{
//
//    UIView* subView = [self viewWithTag:100];
//
//    if (CGRectContainsPoint(subView.frame, point)) {
//        return YES;
//    }
//
//    return NO;
//}


@end
