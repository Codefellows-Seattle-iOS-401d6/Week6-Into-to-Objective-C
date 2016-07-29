//
//  ViewController.m
//  Monday
//
//  Created by Jessica Malesh on 7/11/16.
//  Copyright © 2016 Jess Malesh. All rights reserved.
//

#import "ViewController.h"
#import "NSString+Strings.h"
#import "CheckType.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    NSString *myString;
    myString = @"This is a test";
    
    NSArray *randomArray = [myString arrayOfWords];
    NSLog(@"%@", randomArray);
    
    NSArray *anotherArray = @[@"Doggies", @10, @7, @"Cats"];
    
    [CheckType checkType: [NSNumber numberWithInt:10]];
    [CheckType checkType:[NSString stringWithFormat:@"yellow"]];
    [CheckType checkType:[[NSArray alloc]initWithArray:anotherArray]];
    
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
