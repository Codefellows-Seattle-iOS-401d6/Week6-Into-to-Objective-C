//
//  main.m
//  MRC
//
//  Created by Jess Malesh on 7/12/16.
//  Copyright © 2016 Jess Malesh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        
        Person *adam = [[Person alloc]init];
        
        [adam setName: @"Adam"];
        [adam setEmail:@"Adam@gmail.com"];
        
        NSLog(@"Name: %@",adam.name);
        NSLog(@"Email: %@", adam.email);
        
        
        NSLog(@"Description: %@", [adam description]);
        
        [adam release];
       
    }
    return 0;
}
