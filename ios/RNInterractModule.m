//
//  RNInterractModule.m
//  AwesomeProject
//
//  Created by 吴畏 on 2019/8/12.
//  Copyright © 2019年 Facebook. All rights reserved.
//

#import "RNInterractModule.h"
#import <SVProgressHUD.h>
#import "RNDSWebviewController.h"

@implementation RNInterractModule

// RCT_EXPORT_MODULE接受字符串作为其Module的名称，如果不设置名称的话默认就使用类名作为Modul的名称
RCT_EXPORT_MODULE();

//==============1、提示==============
RCT_EXPORT_METHOD(showInfo:(NSString *) info){
  dispatch_sync(dispatch_get_main_queue(), ^{
    [SVProgressHUD showInfoWithStatus:info];
  });
}

RCT_EXPORT_METHOD(openDSWebview){
  dispatch_sync(dispatch_get_main_queue(), ^{
    UINavigationController *rootVC = (UINavigationController*)[[[[UIApplication sharedApplication] delegate] window] rootViewController];

    RNDSWebviewController *webviewController = [[RNDSWebviewController alloc] init];
    webviewController.view.backgroundColor = [UIColor redColor];
    [rootVC pushViewController:webviewController animated:YES];
  });


}

@end


