//
//  ViewController.m
//  Homework1Week6
//
//  Created by Olesia Kalashnik on 7/11/16.
//  Copyright © 2016 Olesia Kalashnik. All rights reserved.
//

#import "ViewController.h"
#import "NSString+ArrayOfWords.h"
#import "Person.h"
#import "Employee.h"

@interface ViewController ()
@end

@implementation ViewController

//Task2
- (id)manipulateInput:(id)input {
    if ([input isKindOfClass:[NSNumber class]]) {
        double inputAsDouble = [input doubleValue];
        NSLog(@"Input: %@, output: %@", input, [[NSNumber alloc] initWithDouble:sqrt(inputAsDouble)]);
        return [[NSNumber alloc] initWithDouble:sqrt(inputAsDouble)];
    }
    else if ([input isKindOfClass:[NSString class]]) {
        NSString *result = [self reverseString:input];
        NSLog(@"Input: %@, output: %@", input, result);
        return result;
    }
    else if ([input isKindOfClass:[NSArray class]]) {
        NSInteger numOfStrings = 0;
        NSInteger numOfNumbers = 0;
        NSInteger numOfArrays = 0;

        for (NSUInteger index = 0; index < [input count]; index++) {
            if ([[input objectAtIndex:index] isKindOfClass:[NSString class]]) {
                numOfStrings++;
            }
            else if ([[input objectAtIndex:index] isKindOfClass:[NSNumber class]]) {
                numOfNumbers++;
            }
        }
        NSLog(@"Input %@ contains %li strings, %li numbers, %li arrays", input, (long)numOfStrings, (long)numOfNumbers, (long)numOfArrays);
    }
    return nil;
}

//Helper function for string reversal
- (NSString*)reverseString:(NSString* )string {
    NSUInteger length = [string length];
    NSUInteger currIndex = length;
    NSMutableString *resultString = [[NSMutableString alloc]initWithCapacity:length];
    while (currIndex > 0) {
        currIndex--;
        NSRange substringWithRange = NSMakeRange(currIndex, 1);
        [resultString appendString:[string substringWithRange:substringWithRange]];
    }
    return resultString;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //Test Task1: words in string
    NSString *string = @"; word2, word3 ";
    NSArray *arrayOfWords = [string getWords];
    NSLog(@"Words in string '%@': %@", string, arrayOfWords);
    
    //Test Task2: manipulate
    [self manipulateInput:@"abc"];
    [self manipulateInput:@36];
    [self manipulateInput:[[NSArray alloc]initWithObjects:@"a", @"b", @57, nil]];
    
    //Test Task4: Employee subclass
    Employee *employee1 = [[Employee alloc] initWithName:@"Michael" surname:@"Foulcaut"];
    employee1.ID = [[NSNumber alloc] initWithInt:(int) 1234];
    NSLog(@"Employee1 name: %@, Employee1 last name: %@, Employee1 ID: %@", employee1.firstName, employee1.lastName, employee1.ID);
}

@end
