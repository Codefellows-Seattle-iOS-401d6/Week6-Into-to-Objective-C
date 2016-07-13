//
//  main.m
//  TuesdayLab
//
//  Created by Rick  on 7/12/16.
//  Copyright © 2016 Rick . All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "Address.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        
        NSMutableArray *addresses = [[[NSMutableArray alloc]init]autorelease];
        
        Address *personOne = [[Address alloc]init];
        [personOne setName:@"Rick"];
        [personOne setCity:@"Redmond"];
        [personOne setState:@"Washington"];
        [addresses addObject:personOne];
        
        Address *personTwo = [[Address alloc]init];
        [personTwo setName:@"Paul"];
        [personTwo setCity:@"Grand Junction"];
        [personTwo setState:@"Colorado"];
        [addresses addObject:personTwo];
        
        Address *personThree = [[Address alloc]init];
        [personThree setName:@"Peggy"];
        [personThree setCity:@"Fayetteville"];
        [personThree setState:@"Arkansas"];
        [addresses addObject:personThree];
        
        for (int i = 0; i < addresses.count; i++) {
            NSLog(@"%@", [addresses[i] description]);
        }
        
        [personOne release];
        [personTwo release];
        [personThree release];
        
        
        
        return 0;
        
        
    }
}
