//
//  CustomizedUserDefaults.h
//  CustomizedUserDefaults
//
//  Created by Olesia Kalashnik on 7/12/16.
//  Copyright © 2016 Olesia Kalashnik. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString * _Nonnull const kCustomizedUserDefaultsDidUpdate = @"com.ok.kCustomizedUserDefaultsDidUpdate";

@interface CustomizedUserDefaults : NSObject

+ (nonnull instancetype)shared; //singleton
- (void)setObject:(nonnull id)object forKey:(nonnull NSString *)key;
- (nonnull id)objectForKey:(nonnull NSString *)key;
- (void)reset;

@end
