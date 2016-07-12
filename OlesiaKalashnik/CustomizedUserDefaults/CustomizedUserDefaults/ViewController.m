//
//  ViewController.m
//  CustomizedUserDefaults
//
//  Created by Olesia Kalashnik on 7/12/16.
//  Copyright © 2016 Olesia Kalashnik. All rights reserved.
//

#import "ViewController.h"
#import "CustomizedUserDefaults.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *statusLabel;
- (IBAction)preferencesChanged:(UISwitch *)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [[NSNotificationCenter defaultCenter]addObserverForName:kCustomizedUserDefaultsDidUpdate object:nil queue:nil usingBlock:^(NSNotification * _Nonnull note) {
        //retain cycle!!!
        [self.statusLabel setText:@"User updated defaults"];
        
        NSNumber *number = [[CustomizedUserDefaults shared]objectForKey:@"myUserDefaults"];
        
        if (number.intValue == 0) {
            [self.statusLabel setText:@"Status: Off"];
        } else
            [self.statusLabel setText:@"Status: On"];
    }];
}

- (IBAction)preferencesChanged:(UISwitch *)sender {
    [[CustomizedUserDefaults shared]setObject:@(sender.isOn) forKey:@"myUserDefaults"];
}
@end
