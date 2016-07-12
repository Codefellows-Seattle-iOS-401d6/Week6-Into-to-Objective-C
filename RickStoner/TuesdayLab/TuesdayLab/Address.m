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


@end
