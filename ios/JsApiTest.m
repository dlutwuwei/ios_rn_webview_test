//
//  JsApiTest.m
//  AwesomeProject
//
//  Created by 吴畏 on 2019/8/12.
//  Copyright © 2019年 Facebook. All rights reserved.
//

#import "JsApiTest.h"
#import "dsbridge.h"

@interface JsApiTest(){
  NSTimer * timer ;
  void(^hanlder)(id value,BOOL isComplete);
  int value;
}
@end

@implementation JsApiTest

// 同步调用方法
- (NSString *) testSyn: (NSString *) msg
{
  return [msg stringByAppendingString:@"[ syn call]"];
}

// 接受回调
- (void) testAsyn:(NSString *) msg :(JSCallback) completionHandler
{
  completionHandler([msg stringByAppendingString:@" [ asyn call]"],YES);
}

- (NSString *)testNoArgSyn:(NSDictionary *) args
{
  return  @"testNoArgSyn called [ syn call]";
}

- ( void )testNoArgAsyn:(NSDictionary *) args :(JSCallback)completionHandler
{
  completionHandler(@"testNoArgAsyn called [ asyn call]",YES);
}

- ( void )callProgress:(NSDictionary *) args :(JSCallback)completionHandler
{
  value=10;
  hanlder=completionHandler;
  timer =  [NSTimer scheduledTimerWithTimeInterval:1.0
                                            target:self
                                          selector:@selector(onTimer:)
                                          userInfo:nil
                                           repeats:YES];
}

-(void)onTimer:t{
  if(value!=-1){
    hanlder([NSNumber numberWithInt:value--],NO);
  }else{
    hanlder(0,YES);
    [timer invalidate];
  }
}

/**
 * Note: This method is for Fly.js
 * In browser, Ajax requests are sent by browser, but Fly can
 * redirect requests to native, more about Fly see  https://github.com/wendux/fly
 * @param requestInfo passed by fly.js, more detail reference https://wendux.github.io/dist/#/doc/flyio-en/native
 */
-(void)onAjaxRequest:(NSDictionary *) requestInfo  :(JSCallback)completionHandler{
  
}

@end
