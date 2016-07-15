//
//  Person.h
//  addressBook
//
//  Created by hannah gaskins on 7/12/16.
//  Copyright © 2016 hannah gaskins. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

{
    NSString *_name;
    NSString *_email;
    NSString *_address;
}

- (void)setName:(NSString *)name;
- (NSString *)name;

- (void)setEmail:(NSString *)email;
- (NSString *)email;

- (void)setAddress:(NSString *)address;
- (NSString *)address;

- (NSString *)description;

@end
