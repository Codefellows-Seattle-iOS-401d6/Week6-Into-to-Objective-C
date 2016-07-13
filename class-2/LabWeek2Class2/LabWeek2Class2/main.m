//
//  main.m
//  LabWeek2Class2
//
//  Created by Erin Roby on 7/12/16.
//  Copyright © 2016 Erin Roby. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "Person.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        Person *erin = [[Person alloc]init];
        [erin setName:@"Erin"];
        [erin setEmail:@"erin.a.roby@gmail.com"];
        
        NSLog(@"Name: %@", erin.name);
        NSLog(@"Email: %@", erin.name);
        NSLog(@"Description: %@", [erin description]);
        
        [erin release];
    }
    return 0;
}
