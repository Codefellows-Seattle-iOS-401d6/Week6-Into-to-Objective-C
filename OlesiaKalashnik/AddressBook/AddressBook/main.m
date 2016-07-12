//
//  main.m
//  AddressBook
//
//  Created by Olesia Kalashnik on 7/12/16.
//  Copyright © 2016 Olesia Kalashnik. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSMutableArray *cards = [[[NSMutableArray alloc]init]autorelease]; //autorelease the array
        
        Card *sam = [Card new];
        [sam setName:@"Sam"];
        [sam setLastName:@"Who"];
        [sam setEmail:@"sam@icloud.com"];
        [sam setAddress:@"Seattle, WA"];
        [cards addObject:sam];
        
        Card *phil = [Card new];
        [phil setName:@"Philip"];
        [phil setLastName:@"Silverstone"];
        [phil setEmail:@"phil@gmail.com"];
        [phil setAddress:@"Spokane, WA"];
        [cards addObject:phil];
        
        Card *sara = [Card new];
        [sara setName:@"Sara"];
        [sara setLastName:@"Rose"];
        [sara setEmail:@"sara@icloud.com"];
        [sara setAddress:@"San Francisco, CA"];
        [cards addObject:sara];
        
        for (Card *card in cards) {
            NSLog(@"%@",[card description]);
        }
       
        //release cards
        [sam release];
        [phil release];
        [sara release];
        
    }
    return 0;
}
