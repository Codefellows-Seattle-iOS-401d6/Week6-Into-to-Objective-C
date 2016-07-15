//
//  UserDefault.h
//  AdressBook
//
//  Created by Jessica Malesh on 7/12/16.
//  Copyright © 2016 Jess Malesh. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString *_Nonnull const kUserDefaultDidUpdate = @"com.jessmalesh.kUserDefaultDidUpdate";

@interface UserDefault : NSObject

+ (nonnull instancetype)shared;

- (void)setObject:(nonnull id)object forKey:(nonnull NSString *)key;
- (nonnull id)objectForKey:(nonnull NSString *)key;

- (void)reset; 

@end
