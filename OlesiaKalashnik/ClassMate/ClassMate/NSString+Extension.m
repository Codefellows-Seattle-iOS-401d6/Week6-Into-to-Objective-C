//
//  NSString+Extension.m
//  ClassMate
//
//  Created by Olesia Kalashnik on 7/13/16.
//  Copyright © 2016 Olesia Kalashnik. All rights reserved.
//

#import "NSString+Extension.h"

@implementation NSString (Extension)
+ (NSString *) archivePath {
    NSArray *documentsDirectories = [[NSFileManager defaultManager]URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask];
    NSURL *documentsDirectory = [documentsDirectories firstObject];
    return [[documentsDirectory URLByAppendingPathComponent:@"store"]path];
}

-(BOOL)isValidEmail {
    NSString *pattern = @"^.+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*$";

    return [[NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern]evaluateWithObject:self];
}

@end
