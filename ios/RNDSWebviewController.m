//
//  RNDSWebview.m
//  AwesomeProject
//
//  Created by 吴畏 on 2019/8/12.
//  Copyright © 2019年 Facebook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RNDSWebviewController.h"
#import "dsbridge.h"
#import "JsApiTest.h"

@implementation RNDSWebviewController

- (void)viewDidLoad {
  DWKWebView * dwebview=[[DWKWebView alloc] initWithFrame:self.view.bounds];
  [self.view addSubview: dwebview];
  
  [dwebview addJavascriptObject:[[JsApiTest alloc] init] namespace:nil];

  NSString * htmlPath = [[NSBundle mainBundle] pathForResource:@"test"
                                                        ofType:@"html"];
  NSString * htmlContent = [NSString stringWithContentsOfFile:htmlPath
                                                     encoding:NSUTF8StringEncoding
                                                        error:nil];
  NSString *path = [[NSBundle mainBundle] bundlePath];
  NSURL *baseURL = [NSURL fileURLWithPath:path];
  [dwebview loadHTMLString:htmlContent baseURL:baseURL];
  
//  [dwebview loadUrl:@"https://www.baidu.com"];

}

@end
