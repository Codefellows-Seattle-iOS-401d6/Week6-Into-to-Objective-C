//
//  Person.m
//  Week6-Class26
//
//  Created by Sean Champagne on 7/11/16.
//  Copyright © 2016 Sean Champagne. All rights reserved.
//

#import "Person.h"

@interface Person ()


@end
@implementation Person

-(void)_setName:(NSString *)name
{
    name = [name copy];
}


-(NSString *)name
{
    return _name;
}

+ (Person *)person
{
    Person * name = [[Person alloc]init];
    return name;
}

@end
