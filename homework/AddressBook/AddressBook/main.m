//
//  main.m
//  AddressBook
//
//  Created by Sung Kim on 7/12/16.
//  Copyright © 2016 Sung Kim. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Address.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {

        Address *address1 = [[Address alloc]init];
        address1.name = @"Sung";
        address1.email = @"sung@gmail.com";
        
        NSLog(@"Name: %@", address1.name);
        NSLog(@"Email: %@", address1.email);
        NSLog(@"Description: %@", [address1 description]);
        
        [address1 release];
    }
    return 0;
}
