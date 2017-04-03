//
//  AppDelegate.m
//  News
//
//  Created by 徐伟博 on 2017/4/3.
//  Copyright © 2017年 徐伟博. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    
    UIViewController *vc = [[UIViewController alloc] init];
    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:vc];
    
    [NSThread sleepForTimeInterval:2.0];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
