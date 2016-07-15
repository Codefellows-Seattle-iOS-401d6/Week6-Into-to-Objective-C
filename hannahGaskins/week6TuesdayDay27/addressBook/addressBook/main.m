//
//  main.m
//  addressBook
//
//  Created by hannah gaskins on 7/12/16.
//  Copyright © 2016 hannah gaskins. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "Person.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        
        Person *hannah = [[Person alloc]init];
        
        [hannah setName:@"Hannah"];
        [hannah setEmail:@"Hannah@gmail.com"];
        
        NSLog(@"NAME: %@", hannah.name);
        NSLog(@"EMAIL: %@", hannah.email);
        
        NSLog(@"Description: %@", [hannah description]);
    }
    
    return 0;
}
