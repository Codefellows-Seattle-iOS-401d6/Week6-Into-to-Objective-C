//
//  ViewController.m
//  Monday
//
//  Created by Rick  on 7/11/16.
//  Copyright © 2016 Rick . All rights reserved.
//

#import "ViewController.h"
#import "NSString+ArrayOfStrings.h"
#import "AppDelegate.h"
#import "DamnObjectiveC.h"

@interface ViewController () <DamnObjectiveC>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 1st task
    NSString *testSentence = @"I am not a fan of Objective-C";
    [testSentence convertToArray:testSentence];
    
    //2nd task is written and tested in App Delegate.m
    // 3rd Task
    [self thisIsARequiredMethod];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)thisIsARequiredMethod{
    NSLog(@"Protocols are better in Swift... it seems as though there's a theme.");
}

@end
