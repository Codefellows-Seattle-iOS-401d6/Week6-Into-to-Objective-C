//
//  main.m
//  Week6-Class27
//
//  Created by Sean Champagne on 7/12/16.
//  Copyright © 2016 Sean Champagne. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "Person.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        Person *sean = [[Person alloc]init];
        
        [sean setName:@"Sean"];
        [sean setEmail:@"Sean@gmail.com"];
        
        NSLog(@"%@", sean.name);
        NSLog(@"%@", sean.email);
        
        [sean description];
        
        [sean release];
    }
    return 0;
    }
