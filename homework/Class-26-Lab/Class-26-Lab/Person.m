//
//  Person.m
//  Class-26-Lab
//
//  Created by Sung Kim on 7/11/16.
//  Copyright © 2016 Sung Kim. All rights reserved.
//

#import "Person.h"
#import "PersonProtocol.h"

@interface Person() <PersonProtocol>

-(void)pullUp;

@end

@implementation Person

-(instancetype)initWithNameAndArmCount:(NSString *)name :(NSNumber *)arms
{
    self = [super init];
    
    if (self)
    {
        _name = name;
        _arms = arms;
    }
    
    return self;
}

+(Person *)person
{
    return [[Person alloc]initWithNameAndArmCount:@"" :[NSNumber numberWithInt:2]];
}

-(void)eyeCount
{
    NSLog(@"Every person has 2 eyes");
}

-(void)talk
{
    NSLog(@"Hello, my name is %@. It is nice to meet you.", [self name]);
}

-(void)pullUp
{
    NSLog(@"%@ can only do pull ups with %@ arms.", [self name], [self arms]);
}

+(BOOL)canBreathe
{
    return YES;
}

@end
