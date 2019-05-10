//
//  AppDelegate.m
//  SafariOpenApp
//
//  Created by 小飞鸟 on 2019/05/10.
//  Copyright © 2019 小飞鸟. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    /*路由配置*/
    [[GMURLRouter sharedGMURLRouter]registerModules:@[@"TestModule"]];
    
   UIAlertView * al =  [[UIAlertView alloc]initWithTitle:@"1" message:nil delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:nil, nil];
    [al  show];
  
    return YES;
}

-(BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options{
    if (!url) {
        return  YES;
    }
    UIAlertView * al =  [[UIAlertView alloc]initWithTitle:@"2" message:nil delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:nil, nil];
    [al  show];
    
    return [self handleAPPURL:url];
}


-(BOOL)handleAPPURL:(NSURL*)url{
    NSString * scheme = url.scheme;
    NSString * urlstr= url.absoluteString;
    
    if ([@"gomeshop"isEqualToString:scheme]) {
        NSString *formatUrl = [urlstr stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSArray * defineArray = [formatUrl componentsSeparatedByString:@"params="];
        
        if (defineArray.count>1) {
            NSString * paramStr = [defineArray objectAtIndex:1];
            NSString * patternURL = [defineArray objectAtIndex:0];
            
            paramStr = [self changeSingleToDouble:paramStr];
            NSLog(@"paramStr%@",paramStr);
            NSDictionary * paramJson = [self stringToJson:paramStr];
            NSLog(@"paramJson%@",paramJson);
            [GMURLRouter pushURLString:patternURL query:paramJson animated:YES completion:nil];
        }
    }
    return YES;
}

-(NSDictionary*)stringToJson:(NSString*)Jsonstr{
    if (!Jsonstr) {
        return nil;
    }
  NSDictionary * json = [NSJSONSerialization JSONObjectWithData:[Jsonstr dataUsingEncoding:NSUTF8StringEncoding] options:(NSJSONReadingMutableContainers) error:nil];
    return json;
}


-(NSString*)changeSingleToDouble:(NSString*)str{
    
    if (!str) {
        return nil;
    }
    return [str stringByReplacingOccurrencesOfString:@"'" withString:@"\""];
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
