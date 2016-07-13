//
//  AppDelegate.m
//  StudentsDirectory
//
//  Created by Sung Kim on 7/13/16.
//  Copyright © 2016 Sung Kim. All rights reserved.
//

#import "AppDelegate.h"
#import "Store.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    [[Store shared]save];
}


@end
