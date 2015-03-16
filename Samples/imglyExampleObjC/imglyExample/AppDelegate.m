//
//  AppDelegate.m
//  imglyExample
//
//  Created by Sascha Schwabbauer on 16/03/15.
//  Copyright (c) 2015 9elements GmbH. All rights reserved.
//

#import "AppDelegate.h"
@import imglyKit;

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [UIApplication sharedApplication].statusBarHidden = YES;
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    // Backend example
    UIImage *image = [UIImage imageNamed:@"photo-1423439793616-f2aa4356b37e.jpeg"];
    IMGLYSteelFilter *steelFilter = [[IMGLYSteelFilter alloc] init]; // Unfortunately the instance factory cannot be exported to Objective-C, so we allocate the filters directly
    
    IMGLYTextFilter *textFilter = [[IMGLYTextFilter alloc] init];
    textFilter.text = @"ABC";
    textFilter.fontScaleFactor = 0.3;
    textFilter.color = [UIColor redColor];
    
    __unused UIImage *processedImage = [IMGLYPhotoProcessor processWithUIImage:image filters:@[steelFilter, textFilter]];
    
    // Frontend example
    IMGLYCameraViewController *cameraViewController = [[IMGLYCameraViewController alloc] init];
    self.window.rootViewController = cameraViewController;
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