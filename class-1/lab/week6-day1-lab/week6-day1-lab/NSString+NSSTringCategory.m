//
//  NSString+NSSTringCategory.m
//  week6-day1-lab
//
//  Created by Derek Graham on 7/11/16.
//  Copyright © 2016 Derek Graham. All rights reserved.
//

#import "NSString+NSSTringCategory.h"

@implementation NSString (NSSTringCategory)
- (NSArray *) getWordsFromString
{
    return [self componentsSeparatedByString:@" "];
}

- (NSString *) reverseString {
    
    NSMutableString *returnString =  [NSMutableString new];
    
    for (int i = 0; i < [self length]; i++) {
        [returnString insertString:[self substringWithRange:NSMakeRange(i, 1)] atIndex:0 ];
        
        }
    return returnString;
}


@end
