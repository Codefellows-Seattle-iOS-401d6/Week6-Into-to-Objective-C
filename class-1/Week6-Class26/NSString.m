//
//  NSString.m
//  Week6-Class26
//
//  Created by Sean Champagne on 7/11/16.
//  Copyright © 2016 Sean Champagne. All rights reserved.
//

#import "NSString.h"

@implementation NSString (Category)

-(NSArray *)stringToArray:(NSString *)input
{
    return [input componentsSeparatedByString:@" "];
}


@end
