//
//  NSString+Extension.m
//  WednesdayObjCTablesLab
//
//  Created by Rick  on 7/13/16.
//  Copyright © 2016 Rick . All rights reserved.
//

#import "NSString+Extension.h"

@implementation NSString (Extension)

+ (NSString *)archivePath {
    NSArray *documentDirectories = [[NSFileManager defaultManager]URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask];
    NSURL *documentDirectory = [documentDirectories firstObject];
    
    return [[documentDirectory URLByAppendingPathComponent:@"store"]path];
}

- (BOOL)isValidEmail
{
    return [[NSPredicate predicateWithFormat:@"SELF MATCHES %@", @"^.+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*$"] evaluateWithObject:self];
}

@end
