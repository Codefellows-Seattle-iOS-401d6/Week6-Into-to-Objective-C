//
//  AppDelegate.m
//  Monday
//
//  Created by Rick  on 7/11/16.
//  Copyright © 2016 Rick . All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    NSNumber *testNumber = [NSNumber numberWithFloat:16.0];
    NSArray *testArray = @[@"test", @2.0];
    NSString *testString = @"backwards";
    
    [self determineIdType:(testString)];
    [self determineIdType:(testArray)];
    [self determineIdType:(testNumber)];
    
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
    
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)determineIdType:(id)unknownType {
    if ([unknownType isKindOfClass:[NSString class]]) {
        NSString *isString = unknownType;
        NSMutableString *reversed = [NSMutableString string];
        NSInteger character = [isString length];
        while (character > 0) {
            character -= 1;
            NSRange subStrRange = NSMakeRange(character, 1);
            [reversed appendString:[isString substringWithRange:subStrRange]];
        }
        NSLog(@"%@", reversed);
    } else if ([unknownType isKindOfClass:[NSNumber class]]) {
        NSLog(@"Square Root = %f", sqrt([unknownType floatValue]));
    } else if ([unknownType isKindOfClass:[NSArray class]]) {
        NSArray *determinedArray = unknownType;
        int numberOfString = 0;
        int numberOfNumbers = 0;
        int numberOfArrays = 0;
        for (int i = 0; i < determinedArray.count; i++) {
            if ([determinedArray[i] isKindOfClass:[NSNumber class]]) {
                numberOfNumbers += 1;
            } else if ([determinedArray[i] isKindOfClass:[NSString class]]) {
                numberOfString += 1;
            } else if ([determinedArray[i] isKindOfClass:[NSArray class]]) {
                numberOfArrays += 1;
            }
        }
        NSLog(@"This array contains %i strings, %i numbers, and %i arrays", numberOfString, numberOfNumbers, numberOfArrays);
        
    }
    
}

@end
