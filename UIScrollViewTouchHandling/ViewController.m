//
//  ViewController.m
//  UIScrollViewTouchHandling
//
//  Created by wangliang on 2017/12/16.
//  Copyright © 2017年 wangliang. All rights reserved.
//

#import "ViewController.h"
#import "DotView.h"
#import "CustomScrollView.h"

#define k_dot_width (80)

@interface ViewController ()<UIGestureRecognizerDelegate>

@property (nonatomic, strong) CustomScrollView* scrollView;

@property (nonatomic, strong) UIVisualEffectView* blurEffectView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSInteger column = CGRectGetWidth(self.view.frame) / k_dot_width;
    NSInteger row = CGRectGetHeight(self.view.frame) / k_dot_width;
    
    for (NSInteger i=0; i<column; i++) {
        
        for (NSInteger j=0; j<row; j++) {
            
            DotView* dotView = [DotView dotViewFactoryMethod];
            [self.view addSubview:dotView];
            dotView.center = CGPointMake(k_dot_width/2+i*k_dot_width, k_dot_width/2+j*k_dot_width);
            
            UILongPressGestureRecognizer* longPressGesture = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(onLongPressed:)];
            longPressGesture.cancelsTouchesInView = NO;//不会在识别出手势后，调用touchCancel，可以一直保持高亮
            longPressGesture.delegate = self;
            [dotView addGestureRecognizer:longPressGesture];
        }
    }
    
    _scrollView = [[CustomScrollView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:_scrollView];
    
    UIBlurEffect *effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
    _blurEffectView = [[UIVisualEffectView alloc] initWithEffect:effect];
    _blurEffectView.tag = 100;
    _blurEffectView.frame = CGRectMake(0, -CGRectGetHeight(_scrollView.frame),
                                       CGRectGetWidth(_scrollView.frame),
                                       CGRectGetHeight(_scrollView.frame)*2);
    [_scrollView addSubview:_blurEffectView];
    
    for (NSInteger i=0; i<column; i++) {
        
        DotView* dotView = [DotView dotViewFactoryMethod];
        [_blurEffectView.contentView addSubview:dotView];
        dotView.center = CGPointMake(k_dot_width/2+i*k_dot_width, CGRectGetHeight(_blurEffectView.frame)-k_dot_width);
        
        UILongPressGestureRecognizer* longPressGesture = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(onLongPressed:)];
        longPressGesture.cancelsTouchesInView = NO;
        longPressGesture.delegate = self;
        [dotView addGestureRecognizer:longPressGesture];
        
    }
    
    _scrollView.contentSize = CGSizeMake(CGRectGetWidth(_scrollView.frame), CGRectGetHeight(_scrollView.frame)*2);
    _scrollView.contentOffset = CGPointMake(0, CGRectGetHeight(_scrollView.frame));
    [self.view addGestureRecognizer:_scrollView.panGestureRecognizer];
    
}

- (void)onLongPressed:(UILongPressGestureRecognizer*)longGesture{
    
    DotView* dotView = (DotView*)longGesture.view;
    CGPoint ptInVCView = [longGesture locationInView:self.view];
    
    switch (longGesture.state) {
        case UIGestureRecognizerStateBegan:{
            
            dotView.center = [self.view convertPoint:dotView.center fromView:dotView.superview];
            
            [self.view addSubview:dotView];
            
            [UIView animateWithDuration:0.2 animations:^{
               
                dotView.transform = CGAffineTransformMakeScale(1.3, 1.3);
                dotView.alpha = 0.8;
                dotView.center = ptInVCView;
            }];
        }
            break;
        case UIGestureRecognizerStateChanged:{
            dotView.center = ptInVCView;
        }
            break;
        case UIGestureRecognizerStateEnded:
        case UIGestureRecognizerStateCancelled:{
            
            CGPoint ptInBluerContentView = [self.view convertPoint:ptInVCView toView:_blurEffectView.contentView];
            
            if (CGRectContainsPoint(_blurEffectView.contentView.frame, ptInBluerContentView)) {
                
                [_blurEffectView.contentView addSubview:dotView];
            }
            else{
                [self.view insertSubview:dotView belowSubview:_scrollView];
            }
            dotView.center = [self.view convertPoint:ptInVCView toView:dotView.superview];
            
            [UIView animateWithDuration:0.2 animations:^{
                
                dotView.transform = CGAffineTransformIdentity;
                dotView.alpha = 1;
            }];
        }
            break;
        default:
            break;
    }
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
    
    return YES;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
