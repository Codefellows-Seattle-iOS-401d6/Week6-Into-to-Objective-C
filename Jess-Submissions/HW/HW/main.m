//
//  main.m
//  HW
//
//  Created by Jessica Malesh on 7/11/16.
//  Copyright © 2016 Jess Malesh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSString+myString.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
    }
    
    NSString *myString;
    myString = @"This is a test";
    
    NSArray *randomArray = [myString arrayOfWords];
    NSLog(@"%@", randomArray);
    
    
    
    return 0;
}
