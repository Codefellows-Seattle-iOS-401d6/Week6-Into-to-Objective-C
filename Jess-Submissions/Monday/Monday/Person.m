//
//  Person.m
//  Monday
//
//  Created by Jessica Malesh on 7/11/16.
//  Copyright © 2016 Jess Malesh. All rights reserved.
//

#import "Person.h"

@implementation Person

- (instancetype)initWith: (NSString *)firstName lastName: (NSString *)lastName
{
    self = [super init];
    
    if (self)
    {
        _firstName = firstName;
        _lastName = lastName;
    }
    return self;
}


- (void)setFirstName:(NSString *)firstName;
{
    _firstName = firstName;
}

- (NSString *) firstName;
{
    return _firstName;
}

- (void)setLastName:(NSString *)lastName
{
    _lastName = lastName;
}

- (NSString *)lastName
{
    return _lastName;
}


@end


@implementation Employee : Person
- (instancetype)initWith:(NSString *)jobTitle
{
    self = [super init];
    if (self)
    {
        _jobTitle = jobTitle;
    }
    return self;
}

- (void)setJobTitle:(NSString *)jobTitle
{
    _jobTitle = jobTitle;
}
- (NSString *)jobTitle
{
    return _jobTitle;
}

@end