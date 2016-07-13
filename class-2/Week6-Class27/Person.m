//
//  Person.m
//  Week6-Class27
//
//  Created by Sean Champagne on 7/12/16.
//  Copyright © 2016 Sean Champagne. All rights reserved.
//

#import "Person.h"

@implementation Person

#pragma mark - setters/getters

-(void)setName:(NSString *)name{ //get
    if (_name != name){
        [name retain];
        [_name release];
        
        _name = name;
    }
}

-(NSString *)name{ //set
    return _name;
}

-(void)setEmail:(NSString *)email{ //get
    if (_email != email)
    {
        [email retain];
        [_email release];
        
        _email = email;
    }
}

-(NSString *)email{ //set
    return _email;
}

-(NSString *)description{
    NSString *description = [[[NSString alloc]initWithFormat:@"Name: %@, Email: %@", self.name, self.email]autorelease];
    
    return description;
}

-(void)dealloc{
    [_name release];
    [_email release];
    
    NSLog(@"Retain count: %li", [self retainCount]);
    
    [super dealloc];
}

@end
