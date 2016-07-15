//
//  Person.m
//  Monday
//
//  Created by Rick  on 7/11/16.
//  Copyright © 2016 Rick . All rights reserved.
//

#import "Person.h"

@implementation Person

- (instancetype)initWithName:(NSString *)name {
    self = [super init];
    
    if (self) {
        _name = name;
    }
    
    return self;
}



+ (Person *)person {
    return [[Person alloc]initWithName:@""];
}

- (void)setName:(NSString *)name {
    
    //    _name = name; // this would have two object pointing to the same reference, so... implement
    if (_name != name) {
        _name = [name copy];
    } else {
        _name = name;
    }
}


- (NSString *)name {
    return _name;
}

- (void)talk {
    NSLog(@"Hello, my name is %@, how are you?", [self name]);
}


@end
