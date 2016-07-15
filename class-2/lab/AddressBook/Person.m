//
//  Person.m
//  MRClecture
//
//  Created by Derek Graham on 7/12/16.
//  Copyright © 2016 Derek Graham. All rights reserved.
//

#import "Person.h"

@implementation Person

#pragma mark - setters - getters
-(void)setFirstName:(NSString *)firstName {
    if(_firstName != firstName){
        [firstName retain];
        [_firstName release];
        _firstName = firstName;
    }
}

-(NSString *)firstName {
    return _firstName;
}

-(void)setLastName:(NSString *)lastName {
    if(_lastName != lastName){
        [lastName retain];
        [_lastName release];
        _lastName = lastName;
    }
}

-(NSString *)lastName {
    return _lastName;
}

-(void)setEmail:(NSString *)email {
    if(_email != email) {
        [email retain];
        [_email release];
        _email = email;
    }
}

-(NSString *)email {
    return _email;
}

-(NSString *)getKey
{
    return [NSString stringWithFormat:@"%@%@",_firstName,_lastName];
}


-(NSString *)description {
 NSString *description = [[[NSString alloc]initWithFormat:@"Name: %@ %@, Email: %@", self.firstName, self.lastName, self.email]autorelease];
    
    
    
    return description;
}


-(void)dealloc {
    [_firstName release];
    [_email release];
 
    NSLog(@"Retain count: %li", [self retainCount]);
    
    [super dealloc];
}


@end
