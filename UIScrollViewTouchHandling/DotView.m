//
//  DotView.m
//  UIScrollViewTouchHandling
//
//  Created by wangliang on 2017/12/16.
//  Copyright © 2017年 wangliang. All rights reserved.
//

#import "DotView.h"

@interface DotView()

@property (nonatomic, strong)UIColor* bgColor;

@end

@implementation DotView{
    
}

+ (instancetype)dotViewFactoryMethod{
    
    DotView* dotView = [[DotView alloc]initWithFrame:CGRectMake(0, 0, 60, 60)];
    
    dotView.layer.cornerRadius = CGRectGetWidth(dotView.frame)/2;
    
    dotView.backgroundColor = [[self class] randomBgColor];
    
    dotView.bgColor = dotView.backgroundColor;
    
    return dotView;
}


+ (UIColor*)randomBgColor{
    
    int random =  rand();
    
    if (random %2 == 0) {
        return [UIColor redColor];
    }
    else{
        return [UIColor blueColor];
    }
}

- (void)setHighlighted:(BOOL)highlighted{
    
    [super setHighlighted:highlighted];
    
    if (highlighted) {
        
        self.backgroundColor = [UIColor yellowColor];
        
        
//        [UIView animateKeyframesWithDuration:0.3f delay:0 options:UIViewKeyframeAnimationOptionCalculationModeLinear animations:^{
//
//            [UIView addKeyframeWithRelativeStartTime:0.0   // 相对于6秒所开始的时间（第0秒开始动画）
//                                    relativeDuration:1/3.0 // 相对于6秒动画的持续时间（动画持续2秒）
//                                          animations:^{
//                                              self.transform = CGAffineTransformMakeScale(1.3, 1.3);
//                                          }];
//
//            [UIView addKeyframeWithRelativeStartTime:1/3.0 // 相对于6秒所开始的时间（第2秒开始动画）
//                                    relativeDuration:1/3.0 // 相对于6秒动画的持续时间（动画持续2秒）
//                                          animations:^{
//                                              self.transform = CGAffineTransformMakeScale(0.8, 0.8);
//                                          }];
//            [UIView addKeyframeWithRelativeStartTime:2/3.0 // 相对于6秒所开始的时间（第4秒开始动画）
//                                    relativeDuration:1/3.0 // 相对于6秒动画的持续时间（动画持续2秒）
//                                          animations:^{
//                                              self.transform = CGAffineTransformMakeScale(1.3, 1.3);
//                                          }];
//
//
//        } completion:^(BOOL finished) {
//
//            self.transform = CGAffineTransformIdentity;
//
//        }];
        
    }
    else{
        
        self.backgroundColor = _bgColor;
        
    }
}


@end
