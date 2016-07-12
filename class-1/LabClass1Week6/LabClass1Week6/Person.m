//
//  Person.m
//  LabClass1Week6
//
//  Created by Erin Roby on 7/11/16.
//  Copyright © 2016 Erin Roby. All rights reserved.
//

#import "Person.h"

@implementation Person

- (instancetype)initWithName:(NSString *)name
{
    self = [super init];
    
    if (self) {
        _name = name;
    }
    
    return self;
}

+(Person *)person
{
    return [[Person alloc]initWithName:@""];
}

- (void)setName:(NSString *)name
{
    if (_name != name) {
        _name = [name copy];
    }
}

- (NSString *)name
{
    return _name;
}

@end
