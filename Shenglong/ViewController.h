//
//  ViewController.h
//  Shenglong
//
//  Created by 武田誠一 on 2015/08/29.
//  Copyright (c) 2015年 武田誠一. All rights reserved.
//

#import <UIKit/UIKit.h>

//@interface ViewController : UIViewController
@interface ViewController : UIViewController <UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *webView;


@end

