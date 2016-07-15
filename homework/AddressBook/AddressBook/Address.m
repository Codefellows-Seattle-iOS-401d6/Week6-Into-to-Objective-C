//
//  Address.m
//  AddressBook
//
//  Created by Sung Kim on 7/12/16.
//  Copyright © 2016 Sung Kim. All rights reserved.
//

#import "Address.h"

@implementation Address

#pragma mark: setters/getters

- (void)setName:(NSString *)name
{
    if (_name != name) {
        [name retain];
        [_name release];
        _name = name;
    }
}

- (NSString *)name
{
    return _name;
}

- (void)setEmail:(NSString *)email
{
    if (_email != email) {
        [email retain];
        [_email release];
        _email = email;
    }
}

- (NSString *)email
{
    return _email;
}

- (NSString *)description
{
    NSString *description = [[[NSString alloc]initWithFormat:@"Name: %@, Email: %@", self.name, self.email]autorelease];
    return description;
}

-(void)dealloc
{
    [_name release];
    [_email release];
    
    NSLog(@"Retain Count: %li", [self retainCount]);
    
    
    [super dealloc];
}

@end
