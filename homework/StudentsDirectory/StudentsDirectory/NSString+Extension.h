//
//  NSString+Extension.h
//  StudentsDirectory
//
//  Created by Sung Kim on 7/13/16.
//  Copyright © 2016 Sung Kim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Extension)

+ (NSString *)archivePath;

- (BOOL)isValidEmail;

@end
