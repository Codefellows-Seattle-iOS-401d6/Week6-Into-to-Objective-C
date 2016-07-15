//
//  CheckIdType.m
//  Class-26-Lab
//
//  Created by Sung Kim on 7/11/16.
//  Copyright © 2016 Sung Kim. All rights reserved.
//

#import "CheckIdType.h"

@implementation CheckIdType

+(void)performAction:(id)anyObject
{
    if ([anyObject isKindOfClass:[NSNumber class]])
    {
        NSLog(@"%f", sqrt([anyObject doubleValue]));
    }
    else if ([anyObject isKindOfClass:[NSString class]])
    {
        NSMutableArray *reverseWordsCollection = [[NSMutableArray alloc]init];
        NSArray *wordsCollection = [anyObject componentsSeparatedByString:@" "];
        
        for (NSString *word in wordsCollection) {
            [reverseWordsCollection insertObject:word atIndex:0];
        }
        NSString *reverseString = [reverseWordsCollection componentsJoinedByString:@", "];
        NSLog(@"%@", reverseString);
    }
    else if ([anyObject isKindOfClass:[NSArray class]])
    {
        NSNumber *numberCount = [NSNumber numberWithInt:0];
        NSNumber *stringCount = [NSNumber numberWithInt:0];
        NSNumber *arrayCount = [NSNumber numberWithInt:0];
        //id is more general than NSObject
        for (id object in anyObject) {
            if ([object isKindOfClass:[NSNumber class]])
            {
                numberCount = [NSNumber numberWithInt:[numberCount intValue] + 1];
            }
            else if ([object isKindOfClass:[NSString class]])
            {
                stringCount = [NSNumber numberWithInt:[stringCount intValue] + 1];
            }
            else if ([object isKindOfClass:[NSArray class]])
            {
                arrayCount = [NSNumber numberWithInt:[arrayCount intValue] + 1];
            }
            else
            {
                NSLog(@"fail");
            }
        }
        
        NSLog(@"Number object count is: %@", numberCount);
        NSLog(@"String object count is: %@", stringCount);
        NSLog(@"Array object count is: %@", arrayCount);
    }
}


@end
