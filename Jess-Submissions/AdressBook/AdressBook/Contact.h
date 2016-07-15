//
//  Contact.h
//  AdressBook
//
//  Created by Jessica Malesh on 7/12/16.
//  Copyright © 2016 Jess Malesh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Contact : NSObject
{
    NSString *_name;
    NSString *_email;
}

- (void)setName: (NSString *)name;
- (NSString *)name;

- (void)setEmail: (NSString *)email;
- (NSString *)email;

- (NSString *)description;




@end
