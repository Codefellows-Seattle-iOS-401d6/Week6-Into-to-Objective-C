//
//  SKUserDefaults.h
//  SKUserDefaults
//
//  Created by Sung Kim on 7/12/16.
//  Copyright © 2016 Sung Kim. All rights reserved.
//

#import <Foundation/Foundation.h>


static NSString * _Nonnull const kSKUserDefaultsDidUpdate = @"com.sungkim.kSKUserDefaultsDidUpdate";

@interface SKUserDefaults : NSObject

+ (nonnull instancetype)shared;

- (void)setObject:(nonnull id)object forKey:(nonnull NSString *)key;

- (nonnull id)objectForKey:(nonnull NSString *)key;

- (void)reset;

@end
