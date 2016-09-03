//
//  NSObject+Id.m
//  LabClass1Week6
//
//  Created by Erin Roby on 7/11/16.
//  Copyright © 2016 Erin Roby. All rights reserved.
//

#import "NSObject+Id.h"

@implementation NSObject (Id)

- (void)dynamicType: (id)data {
    if ([data isKindOfClass:[NSNumber class]]) {
        NSNumber *squareRoot = [NSNumber numberWithDouble:sqrt([data doubleValue])];
        NSLog(@"%f", [squareRoot doubleValue]);
    } else if ([data isKindOfClass:[NSString class]]) {
        NSMutableString *reversedString = [NSMutableString string];
        NSInteger charIndex = [data length];
        while (charIndex != 0) {
            charIndex--;
            NSRange subStringRange = NSMakeRange(charIndex, 1);
            [reversedString appendString:[data substringWithRange:subStringRange]];
        }
        NSLog(@"%@", reversedString);
    } else if ([data isKindOfClass:[NSArray class]]) {
        int stringIndex = 0;
        int intIndex = 0;
        for (id item in data) {
            if ([item isKindOfClass:[NSNumber class]]) {
                intIndex++;
            } else if ([item isKindOfClass:[NSString class]]) {
                stringIndex++;
            }
        }
        NSLog(@"This array has %d strings.", stringIndex);
        NSLog(@"This array has %d numbers.", intIndex);
    }
}

@end
