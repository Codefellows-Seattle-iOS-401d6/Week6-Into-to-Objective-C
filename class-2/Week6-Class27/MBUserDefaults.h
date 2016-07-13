//
//  MBUserDefaults.h
//  Week6-Class27
//
//  Created by Sean Champagne on 7/12/16.
//  Copyright © 2016 Sean Champagne. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString * _Nonnull const kMBUserDefaultsDidUpdate = @"com.seanchampagne.kMBUserDefaultsDidUpdate";

@interface MBUserDefaults : NSObject

+(nonnull instancetype)sharedDefaults; //writing a singleton class method.

-(void)setObject:(nonnull id)object forKey: (nonnull NSString *)key; //this instance method sets the object as the key.
-(nonnull id)objectForKey:(nonnull NSString *)key; //returns the id when a key is passed in.

-(void)reset; //deletes all.


@end
