//
//  Address.m
//  TuesdayLab
//
//  Created by Rick  on 7/12/16.
//  Copyright © 2016 Rick . All rights reserved.
//

#import "Address.h"

@implementation Address

- (NSString *)name {
    return _name;
}


- (void)setName:(NSString *)name {
    if (_name != name) {
        [name retain];
        [_name release];
        
        _name = name;
    }
}

- (NSString *)city{
    return _city;
}

- (void)setCity:(NSString *)city {
    if (_city != city) {
        [city retain];
        [_city release];
        
        _city = city;
    }
}

- (NSString *)state{
    return _state;
}

- (void)setState:(NSString *)state {
    if (_state != state) {
        [state retain];
        [_state release];
        
        _state = state;
    }
}

-(NSString *)description{
    NSString *description = [[[NSString alloc]initWithFormat:@"Name: %@, Location: %@, %@", self.name, self.city, self.state]autorelease];
    
    return description;
}

- (void)dealloc{
    
    [_name release];
    [_city release];
    [_state release];
    
    NSLog(@"Retain count: %li", [self retainCount]);
    
    [super dealloc];
}


@end
