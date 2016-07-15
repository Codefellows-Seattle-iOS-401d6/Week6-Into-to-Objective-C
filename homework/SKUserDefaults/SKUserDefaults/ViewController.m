//
//  ViewController.m
//  SKUserDefaults
//
//  Created by Sung Kim on 7/12/16.
//  Copyright © 2016 Sung Kim. All rights reserved.
//

#import "ViewController.h"
#import "SKUserDefaults.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *statusLabel;
- (IBAction)preferencesChanged:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    __weak typeof(self) weakSelf = self;
    
    [[NSNotificationCenter defaultCenter]addObserverForName:kSKUserDefaultsDidUpdate
                                                     object:nil
                                                      queue:nil
                                                 usingBlock:^(NSNotification * _Nonnull note) {
                                                     __strong typeof(self) strongSelf = weakSelf;
                                                     NSNumber *number = [[SKUserDefaults shared]objectForKey:@"myUserDefaults"];
                                                     
                                                     if (number.intValue == 0) {
                                                         [strongSelf.statusLabel setText:@"Status: Off"];
                                                     }
                                                     else {
                                                         [strongSelf.statusLabel setText:@"Status: On"];
                                                     }
                                                 }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)preferencesChanged:(UISwitch *)sender {
    [[SKUserDefaults shared]setObject:@(sender.isOn) forKey:@"myUserDefaults"];
}
@end
