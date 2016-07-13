//
//  NSString+Array.m
//  LabClass1Week6
//
//  Created by Erin Roby on 7/11/16.
//  Copyright © 2016 Erin Roby. All rights reserved.
//

#import "NSString+Array.h"

@implementation NSString (Array)

- (NSArray *) toArray {
    NSString *myString = self;
    NSArray *myArray = [myString componentsSeparatedByString:@" "];
    return myArray;
}

@end

