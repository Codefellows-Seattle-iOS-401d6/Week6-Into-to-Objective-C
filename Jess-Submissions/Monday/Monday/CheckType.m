//
//  CheckType.m
//  Monday
//
//  Created by Jessica Malesh on 7/11/16.
//  Copyright © 2016 Jess Malesh. All rights reserved.
//

#import "CheckType.h"

@implementation CheckType

+(void) checkType: (id) isType;
{
    if ([isType isKindOfClass:[NSNumber class]])
    {
        float number = [isType integerValue];
        int newNumber = number * number;
        
        NSLog (@"%d", newNumber);
    } else if ([isType isKindOfClass:[NSString class]])
    {
        NSMutableString *reverseString = [[NSMutableString alloc]init];
        
        for (int i = 0; i < [isType length]; i++)
        {
            unichar newChar = [isType characterAtIndex:(i)];
            NSString *newString = [NSString stringWithFormat:@"%C", newChar];
            [reverseString insertString:newString atIndex:0];
        }
        NSLog(@"%@", reverseString);
    } else if ([isType isKindOfClass:[NSArray class]])
    {
        int numberStringsInArray = 0;
        int numberNumbersInArray = 0;
        
        for (id type in isType)
        {
            if ([type isKindOfClass:[NSNumber class]])
            {
                numberStringsInArray ++;
            } else if ([type isKindOfClass:[NSString class]])
            {
                numberNumbersInArray ++;
            }
        } NSLog(@"Contains %d strings. Contains %d numbers.", numberStringsInArray, numberNumbersInArray);
    }
}


@end
