//
//  Person.m
//  Homework1Week6
//
//  Created by Olesia Kalashnik on 7/11/16.
//  Copyright © 2016 Olesia Kalashnik. All rights reserved.
//

#import "Person.h"

//Task4
@implementation Person

- (void) getNameAndLastName {
    NSLog(@"Name is %@, last name is %@", [self firstName], [self lastName]);
}

//initializers
+ (Person *)person {
    return [[Person alloc] initWithName:@"Name" surname:@"Last Name"];
}

- (instancetype)initWithName:(NSString*)name surname: (NSString*) surname {
    self = [super init];
    if (self) {
        _firstName = name;
        _lastName = surname;
    }
    return self;
}

@end
