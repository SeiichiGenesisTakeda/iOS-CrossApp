//
//  ViewController.m
//  Shenglong
//
//  Created by 武田誠一 on 2015/08/29.
//  Copyright (c) 2015年 武田誠一. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


-(NSString *)getUniqueDeviceIdentifierAsString
{
    UIDevice *device = [UIDevice currentDevice];
    NSString *ident = nil;
    ident = [device.identifierForVendor UUIDString];

    return ident;
}


- (void)viewDidLoad {
    [super viewDidLoad];

    NSURL *myURL = [NSURL URLWithString:@"http://test.arice.in/app/connect/"];
    //リクエストを作成
    NSURLRequest *myRequest = [NSURLRequest requestWithURL:myURL];
    //リクエストされた URLを読み込み
    [self.webView loadRequest:myRequest];
    
}

/*
- (void)webViewDidFinishLoad:(UIWebView *)webView  {
    if (webView.isLoading)
        return;
    return;
    // do some work
}
*/

/**
 * Webページのロード時にインジケータを動かす
 */
- (void)webViewDidStartLoad:(UIWebView*)webView
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}


/**
 * Webページのロード完了時にインジケータを非表示にする
 */
- (void)webViewDidFinishLoad:(UIWebView*)webView
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    
    NSString *ident = [self getUniqueDeviceIdentifierAsString];
    NSString *strMethod = [NSString stringWithFormat:@"setDeviceId('%@')", ident];
    [webView stringByEvaluatingJavaScriptFromString:strMethod];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
