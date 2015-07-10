//
//  AppDelegate.m
//  GoodIOSExample
//
//  Created by chksong on 15-4-21.
//  Copyright (c) 2015年 chksong company. All rights reserved.
//

#import "AppDelegate.h"
#import "DetailViewController.h"

@interface AppDelegate ()
{
    UIViewController* mainViewControl ;
    UIStoryboard * mainStoryboard ;
}


@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    //注册local notification
    if ([UIApplication instancesRespondToSelector:@selector(registerUserNotificationSettings:)]) {
        [application registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeAlert |UIUserNotificationTypeBadge|UIUserNotificationTypeSound categories:nil]];
    }
    
    [UIApplication sharedApplication].applicationIconBadgeNumber=0 ;
    
    NSString* sildernotication = @"silderNotification" ;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handSilder:) name:sildernotication object:nil];
    
//    自己手动启动 设置启动窗口
    mainStoryboard= [UIStoryboard storyboardWithName:@"Main" bundle:nil] ;
    mainViewControl = [mainStoryboard instantiateViewControllerWithIdentifier:@"mainViewController" ] ;
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = mainViewControl ;
    [self.window makeKeyAndVisible];
    
    return YES;
}

// 在后端，当用户点击通知时候，收到
-(void) application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification {
    
    NSLog(@"%@" ,notification) ;
    
    [UIApplication sharedApplication].applicationIconBadgeNumber=8;
}


-(void) handSilder:(NSNotification*)paramNotifcation {
    NSLog(@"%@" ,paramNotifcation) ;
    
    UIViewController* otherCtr = [mainStoryboard instantiateViewControllerWithIdentifier:@"otherViewCtroller" ] ;
    
    [self.window setHidden:true] ;
    
    self.window.rootViewController = otherCtr ;
    [self.window makeKeyAndVisible] ;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}





@end
