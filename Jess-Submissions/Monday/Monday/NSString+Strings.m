//
//  NSString+Strings.m
//  Monday
//
//  Created by Jessica Malesh on 7/11/16.
//  Copyright © 2016 Jess Malesh. All rights reserved.
//

#import "NSString+Strings.h"

@implementation NSString (Strings)

NSString *myString = @"This is a test";

- (NSArray *)arrayOfWords
{
    NSArray *randomArray = [self componentsSeparatedByString:@" "];
    NSLog (@"%@", randomArray);
    return randomArray;
}

@end
