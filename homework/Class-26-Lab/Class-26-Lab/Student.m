//
//  Student.m
//  Class-26-Lab
//
//  Created by Sung Kim on 7/11/16.
//  Copyright © 2016 Sung Kim. All rights reserved.
//

#import "Student.h"

@implementation Student

-(instancetype)initWithNameAndSchool: (NSString *)name :(NSString *)school
{
    self = [super init];
    
    if (self)
    {
        [self setName:name];
        _school = school;
    }
    
    return self;
}

-(void)attending
{
    NSLog(@"%@ is attending %@ for school.", [self name], [self school]);
}
@end
