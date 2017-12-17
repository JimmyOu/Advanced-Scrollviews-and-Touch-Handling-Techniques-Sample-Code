# Advanced-Scrollviews-and-Touch-Handling-Techniques-Sample-Code
wwdc 2014 Advanced Scrollviews and Touch Handling Techniques



### 前言：

这个是wwdc关于这个主题的一个简单版本实现，主要是为了研究iOS的手势处理事件，通过此demo可以理解iOS事件传递的原理，hitTest究竟是怎么一回事，多个gestureRecognizer如何处理，坐标系统如何在父控件和子控件中轻松转化



### 与wwdc演示效果差异:

1 圆点放置后并未排列整齐

2 各个圆点半径是一样大的



### 疑问与思考：

1 原文中说过，在识别了长按手势之后，要取消pan手势，否则在拖动按钮的同时，也会触发scrollView的pan手势，实际测试使用iOS10系统，并没有出现此问题，所以并没有使用相关技巧来取消pan Gesture

```
            _scrollView.panGestureRecognizer.enabled = NO;
            _scrollView.panGestureRecognizer.enabled = YES;
```



2 原文中提级，类似scrollView的delaysContentTouches的实现，是通过添加一个UIScrollViewDelayedTouchesBeganGestureRecognizer来实现，自己可以子类化一个UIGestureRecognizer，并将delayTouchesBegan=YES来达到延迟touch事件向子view的分发，从而避免在滑动时，会有一个highlighten效果，实际测试过程中（iOS10），也并未出现，所以并没有实现这部分代码



[wwdc视频地址](https://developer.apple.com/videos/play/wwdc2014/235/)