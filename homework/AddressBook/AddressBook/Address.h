//
//  Address.h
//  AddressBook
//
//  Created by Sung Kim on 7/12/16.
//  Copyright © 2016 Sung Kim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Address : NSObject

{
    NSString * _name;
    NSString * _email;
}

- (void)setName:(NSString *)name;
- (NSString *)name;

- (void)setEmail:(NSString *)email;
- (NSString *)email;

- (NSString *)description;



@end
