//
//  NSString+myString.m
//  HW
//
//  Created by Jessica Malesh on 7/11/16.
//  Copyright © 2016 Jess Malesh. All rights reserved.
//

#import "NSString+myString.h"

@implementation NSString (myString)


- (NSArray *)arrayOfWords
{
    NSArray *randomArray = [self componentsSeparatedByString:@" "];
    NSLog (@"%@", randomArray);
    return randomArray;
}



@end
