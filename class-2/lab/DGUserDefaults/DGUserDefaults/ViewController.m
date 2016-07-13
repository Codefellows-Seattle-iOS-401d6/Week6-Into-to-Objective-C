//
//  ViewController.m
//  DGUserDefaults
//
//  Created by Derek Graham on 7/12/16.
//  Copyright © 2016 Derek Graham. All rights reserved.
//

#import "ViewController.h"
#import "DGUserDefaults.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [[NSNotificationCenter defaultCenter]addObserverForName:kDGUserDefaultsDidUpdate
                                                     object:nil
                                                      queue:nil
                                                 usingBlock:^(NSNotification * _Nonnull note) {
                                                     
                                                     NSNumber *number = [[DGUserDefaults shared]objectForKey:@"myUserDefaults"];
                                                     
                                                     if (number.intValue == 0 ) {
                                                         [self.statusLabel setText:@"status off"];
                                                     } else  {
                                                         [self.statusLabel setText:@"status on"];
                                                         
                                                     }
                                                     
//                                                     [self.statusLabel setText:@"userUpdateed...."];
                                                 }];
}

- (IBAction)preferencesButton:(UISwitch *)sender {
        [[DGUserDefaults shared]setObject:@(sender.isOn) forKey:@"com.derekgraham.kUserPreferences"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
