//
//  UmengSdkPlugin.m
//  panart
//
//  Created by zsly on 16/1/27.
//
//

#import "UmengSdkPlugin.h"
#import "MobClick.h"
@implementation UmengSdkPlugin
- (void)init:(CDVInvokedUrlCommand*)command
{
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"UmengConfig" ofType:@"plist"];
    NSDictionary *data = [[NSDictionary alloc] initWithContentsOfFile:plistPath];
    NSString* appKey=[data objectForKey:@"appKey"];
    //NSString* channelId=[data objectForKey:@"channelId"];
    
    //友盟统计服务
    [MobClick startWithAppkey:appKey reportPolicy:BATCH channelId:nil];
    NSString *version = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    [MobClick setAppVersion:version];
    //开启测试模式
#ifdef DEBUG
    [MobClick setLogEnabled:YES];
#endif

}
@end
