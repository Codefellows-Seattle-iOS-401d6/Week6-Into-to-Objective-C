//
//  NSString+Array.m
//  hannahGaskinsObjCPractice
//
//  Created by hannah gaskins on 7/11/16.
//  Copyright © 2016 hannah gaskins. All rights reserved.
//

#import "NSString+Array.h"


@implementation NSString (Array)

-(NSArray *)toArray : (NSString*)input
{
 
    NSString * myString = self;
    NSArray * myArray = [myString componentsSeparatedByString:@" "];
    return myArray;
    
}

@end
