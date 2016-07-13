//
//  NSString+Extension.m
//  PeopleList
//
//  Created by Derek Graham on 7/13/16.
//  Copyright © 2016 Derek Graham. All rights reserved.
//

#import "NSString+Extension.h"

@implementation NSString (Extension)

+ (NSString *)archivePath
{
    NSArray *documentsDirectories = [[NSFileManager defaultManager]URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask];
    NSURL *documentsDirectory = [documentsDirectories firstObject];
    
    return [documentsDirectory URLByAppendingPathComponent:@"store"];
}


- (BOOL)isValidEmail
{
//    return [[NSPredicate predicateWithFormat:@"SELF MATCHES %@, @"]]
    return YES;
}


@end
