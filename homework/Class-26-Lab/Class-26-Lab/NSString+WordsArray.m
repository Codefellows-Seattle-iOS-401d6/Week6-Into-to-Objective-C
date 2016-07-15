//
//  NSString+WordsArray.m
//  Class-26-Lab
//
//  Created by Sung Kim on 7/11/16.
//  Copyright © 2016 Sung Kim. All rights reserved.
//

#import "NSString+WordsArray.h"

@implementation NSString (WordsArray)


-(NSArray *)wordsArray
{
    
    NSArray *temp = [self componentsSeparatedByString:@" "];
    
    return temp;
}

@end
