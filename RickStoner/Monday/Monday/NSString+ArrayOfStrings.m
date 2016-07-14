//
//  NSString+ArrayOfStrings.m
//  Monday
//
//  Created by Rick  on 7/11/16.
//  Copyright © 2016 Rick . All rights reserved.
//

#import "NSString+ArrayOfStrings.h"

@implementation NSString (ArrayOfStrings)


- (NSArray *) convertToArray: (NSString *) input {
    
    NSArray *myWords = [input componentsSeparatedByString:@" "];
    for (int i = 0; i < myWords.count; i++) {
        NSLog(myWords[i]);
    }
    return myWords;
}

@end
