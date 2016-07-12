//
//  ViewController.m
//  LabClass1Week6
//
//  Created by Erin Roby on 7/11/16.
//  Copyright © 2016 Erin Roby. All rights reserved.
//

#import "ViewController.h"
#import "NSString+Array.h"
#import "NSObject+Id.h"
#import "Employee.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Test homework question one:
    NSString *myString = @"This is my sample string";
    NSArray *myArray = [myString toArray];
    NSLog(@"%@", myArray);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
