//
//  main.m
//  AddressBook
//
//  Created by Derek Graham on 7/12/16.
//  Copyright © 2016 Derek Graham. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Addressbook.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        if (argc!=2)
        {
            // output usage
            printf("Usage: stringsextract <dir>\n");
            
            // leave with code 1
            exit(1);
        }
        
        for (int i=0; i<argc; i++)
        {
            NSString *str = [NSString stringWithUTF8String:argv[i]];
            NSLog(@"argv[%d] = '%@'", i, str);
        }
        
        
        Person *adam = [[Person alloc]init];
        
        
        [adam setFirstName:@"Adam"];
        [adam setLastName: @"LastName"];
        [adam setEmail:@"adam@gamil.com"];
        
        NSLog(@"%@", [adam getKey]);
        
        Person *Derek = [[Person alloc]init];
        
        [Derek setFirstName:@"Derek"];
        [Derek setLastName:@"Graham"];
        [Derek setEmail:@"derekg@derekg.com"];
        
        
        
//        [[AddressBook shared] setObject: adam forKey:[adam getKey]];
        
    }
    return 0;
}
