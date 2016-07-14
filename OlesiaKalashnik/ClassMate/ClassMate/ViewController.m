//
//  ViewController.m
//  ClassMate
//
//  Created by Olesia Kalashnik on 7/13/16.
//  Copyright © 2016 Olesia Kalashnik. All rights reserved.
//

#import "ViewController.h"
#import "Student.h"
#import "Store.h"
#import "AddViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView setBackgroundColor:[UIColor clearColor]];
    UIImageView *tableBackgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"texture"]];
     [tableBackgroundView setFrame: self.tableView.frame];
    [self.tableView setBackgroundView:tableBackgroundView];
    self.navigationItem.title = @"ClassMates";
    self.navigationController.navigationBar.tintColor = [UIColor purpleColor];

    self.navigationController.navigationBar.backgroundColor = [UIColor greenColor];

}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:[AddViewController identifier]]) {
        AddViewController *addVC = (AddViewController *)segue.destinationViewController;
        addVC.completion = ^{[self.tableView reloadData];
        };
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[Store shared]count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *studCell = [tableView dequeueReusableCellWithIdentifier:@"StudentCell" forIndexPath:indexPath];
    Student *student = [[Store shared]studentForIndexPath:indexPath];
    studCell.textLabel.text = [NSString stringWithFormat:@"%@, %@", student.name, student.surname];
    studCell.detailTextLabel.text = [NSString stringWithFormat:@"Email: %@, phone number: %@", student.email, student.phoneNumber];
    
    return studCell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [[Store shared]removeAtIndexPath:indexPath];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
                         withRowAnimation:UITableViewRowAnimationFade];
    }
}

@end
