//
//  AddressBook.h
//  AddressBook
//
//  Created by Derek Graham on 7/12/16.
//  Copyright © 2016 Derek Graham. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString * _Nonnull const kDGUserDefaultsDidUpdate = @"com.derekgraham.kDGUserDefaultsDidUpdate";

@interface AddressBook : NSObject
{
    NSMutableDictionary *_addressBook;

}

+ (nonnull instancetype)shared;


- (void) setObject:(nonnull id)object forKey: (nonnull NSString *)key;
- (nonnull id)objectForKey:(nonnull NSString *)key;
- (void) reset;


@end
