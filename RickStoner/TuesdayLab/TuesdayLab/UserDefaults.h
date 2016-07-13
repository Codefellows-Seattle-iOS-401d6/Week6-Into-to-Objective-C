//
//  UserDefaults.h
//  TuesdayLab
//
//  Created by Rick  on 7/12/16.
//  Copyright © 2016 Rick . All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString * _Nonnull const kMBUserDefaultsDidUpadate = @"com.ricks.kMBUserDefaultsDidUpdate";

@interface MBUserDefaults : NSObject

//creating a singelton, start in this file

+ (nonnull instancetype)shared;

- (void)setObject:(nonnull id)object forKey:(nonnull NSString *)key;
- (nonnull id)objectForKey:(nonnull NSString *)key;

- (void)reset;


@end
