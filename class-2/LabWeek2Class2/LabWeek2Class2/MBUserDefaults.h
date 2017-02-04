//
//  MBUserDefaults.h
//  LabWeek2Class2
//
//  Created by Erin Roby on 7/12/16.
//  Copyright © 2016 Erin Roby. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString * _Nonnull const kMBUserDefaultsDidUpdate = @"com.michaelbabiy.kMBUserDefaultsDidUpdate";

@interface MBUserDefaults : NSObject

+ (nonnull instancetype)sharedDefaults;

- (void)setObject:(nonnull id)object forKey:(nonnull NSString *)key;
- (nonnull id)objectForKey: (nonnull NSString *)key;

- (void)reset;

@end
