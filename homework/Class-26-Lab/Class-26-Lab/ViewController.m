//
//  ViewController.m
//  Class-26-Lab
//
//  Created by Sung Kim on 7/11/16.
//  Copyright © 2016 Sung Kim. All rights reserved.
//



//Create a category method on NSString that takes in itself and returns an array of words
//Write a method that takes in id type, checks if its NSNumber, NSString, NSArray and performs the following:
//if number, calculate the square root
//if string, reverses it
//if array, checks for object type and calculates how many time specific type is mentioned (if array contains 3 strings, NSLog = contains 3 strings)
//Declare a simple protocol with optional and required methods. Name it whatever you like
//Declare a class called Person. Extend (indirectly - subclass) this class. Add appropriate behavior to your subclass (Person -> Employee)

#import "ViewController.h"
#import "NSString+WordsArray.h"
#import "CheckIdType.h"
#import "Person.h"
#import "Student.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString *sentence = @"testing a string";
    NSArray *array = [sentence wordsArray];
    NSLog(@"%@", array);
    
    NSNumber *numberOne = [NSNumber numberWithInt:5];
    NSNumber *numberTwo = [NSNumber numberWithInt:2];
    NSNumber *numberThree = [NSNumber numberWithInt:0];
    NSString *wordOne = @"hello";
    NSArray *newArray = [NSArray array];
    
    
    NSArray *objectsArray = [[NSArray alloc]initWithObjects:numberOne, numberTwo, wordOne, newArray, numberThree, nil];

    [CheckIdType performAction:numberOne];
    [CheckIdType performAction:sentence];
    [CheckIdType performAction:objectsArray];
    
    Person *person = [[Person alloc]initWithNameAndArmCount:@"Sung" :[NSNumber numberWithInt:2]];
    [person talk];
    
    Student *student = [[Student alloc]initWithNameAndSchool:@"Sung" :@"Code Fellows"];
    [student attending];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
