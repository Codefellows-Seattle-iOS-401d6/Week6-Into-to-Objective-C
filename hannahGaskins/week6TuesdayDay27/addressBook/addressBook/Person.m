//
//  Person.m
//  addressBook
//
//  Created by hannah gaskins on 7/12/16.
//  Copyright © 2016 hannah gaskins. All rights reserved.
//

#import "Person.h"

@implementation Person

#pragma mark - setters/getters

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
    NSString *description = [[[NSString alloc]initWithFormat:@"Name: %@. Email: %@", self.name, self.email] autorelease];
                             
    return description;
}

- (void)setAddress:(NSString *)address
{
    if (_address != address) {
        [address retain];
        [_address release];
        
        _address = address;
    }
}
- (NSString *)address
{
    return _address;
}

- (void)dealloc
{
    [_name release];
    [_email release];
    [_address release];
    
    NSLog(@"Reatain count: %li", [self retainCount]);
    
    [super dealloc];
}
                             
@end
