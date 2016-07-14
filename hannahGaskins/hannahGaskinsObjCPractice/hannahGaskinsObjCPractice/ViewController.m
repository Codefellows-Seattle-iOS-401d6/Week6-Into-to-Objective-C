//
//  ViewController.m
//  hannahGaskinsObjCPractice
//
//  Created by hannah gaskins on 7/11/16.
//  Copyright © 2016 hannah gaskins. All rights reserved.
//

#import "ViewController.h"
#import "NSString+Array.h"
#import "Person.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *myString = @"here is my string";
    
    NSArray *wordReturnArray = [myString toArray:myString];
    
    NSNumber *someNumber = [NSNumber numberWithDouble:12];
    
    NSLog(@"%@",wordReturnArray);
    
    NSLog(@"%i", [someNumber intValue]);
    
    [self checkDataType:@9];
    
    [self checkDataType:@"happy about Objective-C"];
    
    [self checkDataType:@[@"happy", @2, @5, @"Objective-C", [Person new]]];
    
}


- (void)checkDataType: (id)testData
{
    if ([testData isKindOfClass:[NSNumber class]]) {
        NSNumber * squareRoot = [NSNumber numberWithDouble:sqrt([testData doubleValue])];
        NSLog(@"%f", [squareRoot doubleValue]);
    } else if ([testData isKindOfClass:[NSString class]]) {
        NSMutableString *reversedString = [NSMutableString string];
        NSInteger charIndex = [testData length];
        while (charIndex != 0) {
            charIndex--;
            NSRange subStringRange = NSMakeRange(charIndex, 1);
            [reversedString appendString:[testData substringWithRange:subStringRange]];
        }
        NSLog(@"%@", reversedString);
        
    } else if ([testData isKindOfClass:[NSArray class]]) {
        
        NSMutableDictionary *database = [NSMutableDictionary new];
        
        for (id item in testData) {
            if ([database objectForKey:[[item class]description]]) {
                
                NSNumber *countNumber = (NSNumber *)[database objectForKey:[[item class]description]];
                
                int count = countNumber.intValue;
                count++;
                
                [database setObject:[NSNumber numberWithInt:count] forKey:[[item class]description]];
                
            }
            
            else {
                
                [database setObject:[NSNumber numberWithInt:1] forKey:[[item class]description]];
                
            }
            
//            if ([item isKindOfClass:[NSNumber class]]) {
//                counterOneInt++;
//            } else if ([item isKindOfClass:[NSString class]]) {
//                counterTwoString++;
//            }
        }
        
        NSLog(@"%@", database);
//        NSLog(@"The array has %d elements of type Int within it", counterOneInt);
//        NSLog(@"The array has %d elements of type String within it", counterTwoString);
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
