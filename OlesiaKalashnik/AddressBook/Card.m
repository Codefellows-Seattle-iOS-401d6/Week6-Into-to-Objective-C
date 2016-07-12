//
//  Card.m
//  AddressBook
//
//  Created by Olesia Kalashnik on 7/12/16.
//  Copyright © 2016 Olesia Kalashnik. All rights reserved.
//

#import "Card.h"

@implementation Card

//public getters
-(NSString *)name {
    return _name;
}
-(NSString *)lastName {
    return _lastName;
}
-(NSString *)email {
    return _email;
}
-(NSString *)address {
    return _address;
}

//public setters
-(void)setName:(NSString *)name {
    if (_name != name) {
        [name retain];
        [_name release];
        // _name is a dangling reference at this point
        _name = name;
    }
}

-(void)setLastName:(NSString *)lastName {
    if (_lastName != lastName) {
        [lastName retain];
        [_lastName release];
        
        _lastName = lastName;
    }
}

-(void)setEmail:(NSString *)email {
    if (_email != email) {
        [email retain];
        [_email release];
        
        _email = email;
    }
}

-(void)setAddress:(NSString *)address {
    if (_address != address) {
        [address retain];
        [_address release];
        
        _address = address;
    }
}

-(NSString *)description {
    NSString *description = [[[NSString alloc]initWithFormat:@"\n\n======================================\n|                                    |\n|   %-31s  |\n|   %-31s  |\n|   %-31s  |\n|   %-31s  |\n|                                    |\n|            o           o           |\n======================================\n\n", [self.name UTF8String], [self.lastName UTF8String], [self.email UTF8String], [self.address UTF8String]]autorelease];
    return description;
    
}

//overriding dealloc
-(void)dealloc {
    [_name release];
    [_lastName release];
    [_email release];
    [_address release];
    
    NSLog(@"Retain count: %li", [self retainCount]);
    [super dealloc];
}


@end
