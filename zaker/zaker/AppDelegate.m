//
//  AppDelegate.m
//  zaker
//
//  Created by JaysonWang on 16/6/1.
//  Copyright © 2016年 颢迅网络. All rights reserved.
//

#import "AppDelegate.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	// Override point for customization after application launch.
	
	//创建window
	self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
	
	//创建第一个tab
	FirstViewController * firstViewController = [[FirstViewController alloc]init];
	firstViewController.title = @"111";
	[firstViewController.view setBackgroundColor:[UIColor whiteColor]];
	UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:firstViewController];
	
	//创建第二个tab
	SecondViewController * secondViewController = [[SecondViewController alloc]init];
	secondViewController.title = @"222";
	[secondViewController.view setBackgroundColor:[UIColor whiteColor]];
	UINavigationController *nav2 = [[UINavigationController alloc]initWithRootViewController:secondViewController];
	
	//创建第三个tab
	ThirdViewController * thirdViewController = [[ThirdViewController alloc]init];
	thirdViewController.title = @"333";
	[thirdViewController.view setBackgroundColor:[UIColor whiteColor]];
	UINavigationController *nav3 = [[UINavigationController alloc]initWithRootViewController:thirdViewController];
	
	//创建tabBar
	UITabBarController *tabBar = [[UITabBarController alloc]init];
	NSArray *array = [NSArray arrayWithObjects:nav3, nav, nav2, nil];
	tabBar.viewControllers = array;
	
	self.window.rootViewController = tabBar;
	[self.window makeKeyAndVisible];
	
	return YES;
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
