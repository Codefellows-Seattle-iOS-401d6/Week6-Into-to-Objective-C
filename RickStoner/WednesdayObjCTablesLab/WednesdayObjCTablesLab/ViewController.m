//
//  ViewController.m
//  WednesdayObjCTablesLab
//
//  Created by Rick  on 7/13/16.
//  Copyright © 2016 Rick . All rights reserved.
//

#import "ViewController.h"
#import "Store.h"
#import "Student.h"
#import "InputViewController.h"

@interface ViewController () <UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString: [InputViewController identifier]]) {
        InputViewController *inputViewController = (InputViewController *)segue.destinationViewController;
        inputViewController.completion = ^ {
            [self.tableView reloadData];
        };
    }
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[Store shared]count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *studentCell = [tableView dequeueReusableCellWithIdentifier:@"studentCell" forIndexPath:indexPath];
    
    Student *student = [[Store shared]studentForIndexPath:indexPath];
    studentCell.textLabel.text = [NSString stringWithFormat:@"%@ %@", student.firstName, student.lastName];
    studentCell.detailTextLabel.text = [NSString stringWithFormat:@"Email: %@ Course: %@", student.email, student.course];
    
    return studentCell;
}

#pragma mark - UITableViewDelegate

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;

}

@end

