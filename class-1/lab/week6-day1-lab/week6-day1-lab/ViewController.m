//
//  ViewController.m
//  week6-day1-lab
//
//  Created by Derek Graham on 7/11/16.
//  Copyright © 2016 Derek Graham. All rights reserved.
//


//Create a category method on NSString that takes in itself and returns an array of words

//Write a method that takes in id type, checks if its NSNumber, NSString, NSArray and performs the following:
//if number, calculate the square root

//if string, reverses it

//if array, checks for object type and calculates how many time specific type is mentioned (if array contains 3 strings, NSLog = contains 3 strings)

//Declare a simple protocol with optional and required methods. Name it whatever you like

//Declare a class called Person. Extend (indirectly - subclass) this class. Add appropriate behavior to your subclass (Person -> Employee)


#import "ViewController.h"
#import "NSString+NSSTringCategory.h"
#import "Savant.h"
#import "Person.h"
#import "SavantProtocol.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSString *test = @"This is a test";
    NSLog(@"%@",test);
    NSLog(@"%@",test.getWordsFromString);
    
    NSString *myString = @"This is a string person";
    
    NSArray *myArray = [NSArray arrayWithObjects: @1, @"test", @2, myString, @"test2", @"word3", [NSArray arrayWithObjects: @"one", @"two", @"three", nil ], nil];
    
    NSNumber *myNumber = @5;
    
    Savant *stringPerson, *arrayPerson, *numberPerson;
    stringPerson = [[Savant alloc] initWithString: myString];
    
    [stringPerson spewTypeFromID:(myString)];
    
    arrayPerson = [[Savant alloc] initWithArray: myArray];
    [arrayPerson printType];
    [arrayPerson spewTypeFromID:(myArray)];
    
    numberPerson = [[Savant alloc] initWithNumber: myNumber];
    [numberPerson spewTypeFromID:(myNumber)];
//    [stringPerson ];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
