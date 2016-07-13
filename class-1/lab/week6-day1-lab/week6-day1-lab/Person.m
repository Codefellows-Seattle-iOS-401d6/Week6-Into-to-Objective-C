//
//  Person.m
//  week6-day1-lab
//
//  Created by Derek Graham on 7/11/16.
//  Copyright © 2016 Derek Graham. All rights reserved.
//

#import "Person.h"

@implementation Person

- (instancetype) initWithString: (NSString *) typeID
{
    self = [super init];
    if (self) {
        [self setPersonType: typeID];
    }
    return self;
}

- (instancetype) initWithArray: (NSArray *) typeID
{
    self = [super init];
    if (self) {
        [self setPersonType: typeID];
    }
    return self;
}
- (instancetype) initWithNumber: (NSNumber *) typeID
{
    self = [super init];
    if (self) {
        [self setPersonType: typeID];
    }
    return self;
}


- (void) printType
{
    NSLog(@"Person Type is: %@", [[self personType]  class]);
}

@end
