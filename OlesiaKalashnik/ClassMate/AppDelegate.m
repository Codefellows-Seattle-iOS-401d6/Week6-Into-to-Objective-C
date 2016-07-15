//
//  AppDelegate.m
//  ClassMate
//
//  Created by Olesia Kalashnik on 7/13/16.
//  Copyright © 2016 Olesia Kalashnik. All rights reserved.
//

#import "AppDelegate.h"
#import "Store.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    UINavigationController * navContr = (UINavigationController *)self.window.rootViewController;
    ViewController *viewController = (ViewController *)navContr.topViewController;
    
    [viewController updateStudents];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    [[Store shared]save];
}

- (void)applicationWillTerminate:(UIApplication *)application {
        [[Store shared]save];
}

@end
