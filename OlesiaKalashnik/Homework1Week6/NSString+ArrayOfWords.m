//
//  NSString+ArrayOfWords.m
//  Homework1Week6
//
//  Created by Olesia Kalashnik on 7/11/16.
//  Copyright © 2016 Olesia Kalashnik. All rights reserved.
//

#import "NSString+ArrayOfWords.h"

@implementation NSString (ArrayOfWords)

//Task1
- (NSArray *)getWords {
    NSError *error;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"\\w+" options:NSRegularExpressionCaseInsensitive error:&error];
    
    NSRange range = NSMakeRange(0, [self length]);
    if (error == nil) {
    NSArray<NSTextCheckingResult *> *matches = [regex matchesInString:self options:0 range:range];
    NSMutableArray<NSString *> *results = [[NSMutableArray alloc]initWithCapacity:[self length]];
    for (NSTextCheckingResult *match in matches) {
        NSRange range = [match range];
        [results addObject:[self substringWithRange:range]];
    }
    
    return results;
    }
    else {
        NSLog(@"Invalid regex pattern");
        return nil;
    }
}
@end
