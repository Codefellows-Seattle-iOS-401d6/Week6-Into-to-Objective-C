//
//  MBUserDefaults.h
//  addressBook
//
//  Created by hannah gaskins on 7/12/16.
//  Copyright © 2016 hannah gaskins. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString * _Nonnull const kMBUserDefaultsDidUpdate = @"com.hannahgaskins.com.kMBUserDefaultsDidUpdate";

@interface MBUserDefaults : NSObject

+ (nonnull instancetype)sharedDefaults; // singleton that needs initialization right when you start the project

- (void)setObject:(nonnull id)object forKey:(nonnull NSString *)key; // setting the object
- (nullable id)objectForKey:(nonnull NSString *)key; // getting the object

- (void)reset; // method to delete files

@end
