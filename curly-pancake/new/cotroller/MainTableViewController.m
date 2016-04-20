//
//  MainTableViewController.m
//  Calendar
//
//  Created by lushouxiang on 16/1/29.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "MainTableViewController.h"
#import "AddTableViewController.h"
#import "HeadView.h"
#import "TableHeadView.h"


#import "UPCollectionViewCell.h"
#import "DownCollectionViewCell.h"

#import "WeekTableViewCell.h"

@interface MainTableViewController ()
{
    
}

@property (nonatomic ,strong) NSDate * currentDate;
@property (nonatomic ,assign) NSInteger currentYear;
@property (nonatomic ,assign) NSInteger currentMonth;

@property (nonatomic ,strong) NSArray * currentWeeks;

@property(nonatomic, strong) WeekTableViewCell * weekCell;
@property(nonatomic, strong) UPCollectionViewCell * UPCell;
@property(nonatomic, assign) BOOL isAddView;
@end

@implementation MainTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
        
    
    self.navigationController.navigationBar.backgroundColor = [UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:1];
    
    self.tableView.bounces = NO;
    self.tableView.backgroundColor = [UIColor lightGrayColor];
    self.tableView.showsVerticalScrollIndicator = NO;
    
    self.currentDate = self.currentDate?self.currentDate:[NSDate date];
    self.currentWeeks = [ToolCalendar currentWeekens:self.currentDate];
    
    self.title = [ToolCalendar dateToStringNODay:self.currentDate];
    
    
    UIButton * button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    [button setTitle:@"今" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(todayButton) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem * item1 = [[UIBarButtonItem alloc] initWithCustomView:button];
    
    UIButton * button2 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    [button2 setTitle:@"查" forState:UIControlStateNormal];
    [button2 addTarget:self action:@selector(queryButton) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem * item2 = [[UIBarButtonItem alloc] initWithCustomView:button2];
    
    self.navigationItem.rightBarButtonItems = @[item1,item2];
    
    [self.tableView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
    
 
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell;
 
    if (indexPath.section == 0) {


        UPCollectionViewCell * UPcell = [[UPCollectionViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        UPcell.currentModel = [MonthModel monthModelWithDate:self.currentDate];
        UPcell.currentDate = self.currentDate;
        
        [UPcell setDidscroller:^(NSDate *date) {
            self.weekCell.currentDate = date;
            self.currentDate = date;
            self.currentYear = [ToolCalendar year:date];
            self.currentMonth = [ToolCalendar month:date];
            self.currentWeeks = [ToolCalendar currentWeekens:date];
            
            if (![self.title isEqualToString:[ToolCalendar dateToStringNODay:self.currentDate]]) {
                self.title = [ToolCalendar dateToStringNODay:self.currentDate];
            }
            
            [tableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForItem:0 inSection:1]] withRowAnimation:UITableViewRowAnimationFade];
            
            
        }];

        
        cell = UPcell;
        self.UPCell = UPcell;

    }else{
        DownCollectionViewCell * Downcell = [[DownCollectionViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        Downcell.currentDate = self.currentDate;
        Downcell.superVC = self;
        cell = Downcell;
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    cell.backgroundColor = [UIColor whiteColor];

    return cell;
}



- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 30;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CGFloat height;
    if (indexPath.section == 0) {
        height = kMainCellUpH;

    }else{
        height = kMainCellDownH;
    }
    
    return height;
}





- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIView * headView;
    if (section == 0) {
        
        headView  = [[HeadView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];

    }else{
        
        TableHeadView * headViews = [[TableHeadView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
        [headViews setDidAddButtonAction:^{
            AddTableViewController * addVC = [[AddTableViewController alloc] init];
            addVC.currentDate = self.currentDate;
            
            [self.navigationController pushViewController:addVC animated:YES];
            
        }];
        
        headView = headViews;
    }
    return headView;
    
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{

    if (scrollView.contentOffset.y == -64) {
        self.weekCell.hidden = YES;
    }
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    if (scrollView.contentOffset.y == -64) {
        self.weekCell.hidden = YES;
    }
    
    
}


- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
   
    CGPoint new = [[change valueForKey:@"new"] CGPointValue];
    if (new.y != -64) {
        
        CGFloat uph = kMainCellUpH;
        
        CGFloat yy = uph / 6 * [ToolCalendar currentWeekInThisMonth:self.currentDate] - new.y > 63? uph / 6 * [ToolCalendar currentWeekInThisMonth:self.currentDate] - new.y : 63;
        
        
        if (yy == 63) {

            CGFloat space = uph / 6 * [ToolCalendar currentWeekInThisMonth:self.currentDate] - new.y;
            
            self.weekCell.frame = CGRectMake(0, uph / 6 * [ToolCalendar currentWeekInThisMonth:self.currentDate] - space + 94 - 2, kSize(self.view).width, kSize(self.view).height / 6);

            
            if (self.isAddView == NO) {
                [self.tableView addSubview:self.weekCell];
                self.isAddView = YES;
            }
            
            self.weekCell.hidden = NO;
        }else{
            self.weekCell.hidden = YES;
        }
    }else{
        self.weekCell.hidden = YES;
    }
}






- (WeekTableViewCell *)weekCell{
    if (!_weekCell) {
        WeekTableViewCell * cell = [[WeekTableViewCell alloc] initWithFrame:CGRectMake(0, 30, kSize(self.view).width, kSize(self.view).height / 6)];
        _weekCell = cell;
        _weekCell.currentDate = self.currentDate;
        __block typeof(self) weakSelf = self;
        [_weekCell setDidscroller:^(NSDate *date) {
            weakSelf.currentDate = date;
            weakSelf.UPCell.currentDate = date;
            [weakSelf.UPCell reloadData];
        }];
    }
    return _weekCell;
}


- (void)setCurrentDate:(NSDate *)currentDate{
    _currentDate = currentDate;
    self.weekCell.currentDate = currentDate;
    self.UPCell.currentDate = currentDate;

}


- (void)todayButton{
    
    if ([self.currentDate.description isEqualToString:[NSDate date].description]) {
        return;
    }
    self.currentDate = [NSDate date];
    [self.tableView reloadData];
    self.weekCell.currentDate = [NSDate date];
    [self.weekCell reloadDate];
    
}


- (void)queryButton{
    
    NSLog(@"%d-%d---%s",[NSThread currentThread].isMainThread,__LINE__,__func__);
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}





@end
