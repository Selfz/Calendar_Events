//
//  AddTableViewController.m
//  Calendar
//
//  Created by lushouxiang on 16/1/30.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "AddTableViewController.h"
#import "ToolCalendar.h"

@interface AddTableViewController ()

@end

@implementation AddTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = [ToolCalendar dateToString:self.currentDate];
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    [self loadSubViews];
    
}

- (void)loadSubViews{
    
//    UITableView * tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    
    
    
    
    
}










- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
