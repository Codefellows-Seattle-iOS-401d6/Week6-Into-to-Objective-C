//
//  ViewController.m
//  Week6-Class26
//
//  Created by Sean Champagne on 7/11/16.
//  Copyright © 2016 Sean Champagne. All rights reserved.
//

#import "ViewController.h"
#import "MyProtocol.h"
#import "Person.h"
#import "Employee.h"

@interface ViewController () <MyProtocol>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *sentence = @"Hi, I love Sean and Objective-C programming.";
    NSArray *newArray = [[NSArray alloc]init];
    newArray = [sentence stringToArray:(sentence)];
    
    [self checkInputType:@[@"Hi", @2]];
    [self doThisThing];
    
    Person *person = [[Person alloc]init];
    
    [person setName:@"Sean"];
    NSLog(@"%@", person.name);
    
    Employee *employee = [[Employee alloc]init];
    [employee giveTitle];
    NSLog(@"%@", employee.employeeTitle);
}

- (void)checkInputType: (id)testData
{
    if ([testData isKindOfClass:[NSNumber class]])
    {
    NSNumber * squareRoot = [NSNumber numberWithDouble:sqrt([testData doubleValue])];
        NSLog(@"%@", squareRoot);
    }
    if ([testData isKindOfClass:[NSString class]])
    {
        NSMutableString *reversedInput = [NSMutableString string];
        NSInteger charIndex = [testData length];
        while (charIndex > 0)
        {
            charIndex--;
            NSRange subStringRange = NSMakeRange(charIndex, 1);
            [reversedInput appendString:[testData substringWithRange:subStringRange]];
        }
        NSLog(@"%@", reversedInput);
    }
    if ([testData isKindOfClass:[NSArray class]])
    {
        NSInteger counter = 0;
        NSInteger count = 0;
     for (NSString *index in testData)
     {
         if ([index isKindOfClass:[NSString class]])
         {
             counter += 1;
             NSLog(@"Contains %li strings", (long)counter);
         } else {
             count += 1;
             NSLog(@"Contains %li integers", (long)count);
         }
     }
    }
}

- (void)doThisThing
{
    NSLog(@"Hello");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
