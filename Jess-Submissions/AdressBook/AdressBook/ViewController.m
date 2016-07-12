//
//  ViewController.m
//  AdressBook
//
//  Created by Jessica Malesh on 7/12/16.
//  Copyright © 2016 Jess Malesh. All rights reserved.
//

#import "ViewController.h"
#import "UserDefault.h"
#import "Contact.h"

@interface ViewController ()
@property (retain, nonatomic) IBOutlet UILabel *switchLabel;
- (IBAction)preferencesChanged:(UISwitch *)sender;


@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
        
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [[NSNotificationCenter defaultCenter]addObserverForName:kUserDefaultDidUpdate object:nil queue:nil usingBlock:^(NSNotification * _Nonnull note) {
        NSNumber *number = [[UserDefault shared]objectForKey:@"myUserDefaults"];
        
        if (number.intValue == 0) {
            [self.switchLabel setText:@"Status Off"];
        }
        else {
            [self.switchLabel setText:@"Status On"];
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_switchLabel release];
    [super dealloc];
}
- (IBAction)preferencesChanged:(UISwitch *)sender
{
    [[UserDefault shared]setObject:@(sender.isOn) forKey:@"myUserDefaults"];
}
@end
