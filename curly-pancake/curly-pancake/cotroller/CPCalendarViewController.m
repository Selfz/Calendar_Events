//
//  CPCalendarViewController.m
//  Calendar
//
//  Created by lushouxiang on 16/1/29.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "CPCalendarViewController.h"
#import "AddTableViewController.h"
#import "HeadView.h"
#import "TableHeadView.h"


#import "UPCollectionViewCell.h"
#import "DownCollectionViewCell.h"

#import "WeekTableViewCell.h"

@interface CPCalendarViewController ()
{
    
}

@property(nonatomic, assign) CGFloat begin;
@property(nonatomic, assign) CGFloat end;
@property(nonatomic, assign) BOOL isWeek;

@property (nonatomic ,strong) NSDate * currentDate;
@property (nonatomic ,assign) NSInteger currentYear;
@property (nonatomic ,assign) NSInteger currentMonth;

@property (nonatomic ,strong) NSArray * currentWeeks;

@property(nonatomic, strong) WeekTableViewCell * weekCell;
@property(nonatomic, weak) UPCollectionViewCell * UPCell;
@property(nonatomic, weak) DownCollectionViewCell * DownCell;
@property(nonatomic, assign) BOOL isAddView;


@end

@implementation CPCalendarViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:(79/255.0) green:(166/255.0) blue:0.98 alpha:1];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    self.tableView.bounces = NO;
    self.tableView.backgroundColor = [UIColor lightGrayColor];
    self.tableView.showsVerticalScrollIndicator = NO;
    
    self.currentDate = self.currentDate?self.currentDate:[NSDate date];
    self.currentWeeks = [ToolCalendar currentWeekens:self.currentDate];
    
    self.title = [ToolCalendar dateToStringNODay:self.currentDate];
    
    
    UIButton * button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
    [button setTitle:@"今" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(todayButton) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem * item1 = [[UIBarButtonItem alloc] initWithCustomView:button];

    self.navigationItem.rightBarButtonItems = @[item1];
    
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
        UPCollectionViewCell * UPcell = [[UPCollectionViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UPcell"];
        cell = UPcell;
        self.UPCell = UPcell;
        
    }else{
        DownCollectionViewCell * Downcell = [[DownCollectionViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cell = Downcell;
        self.DownCell = Downcell;
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    cell.backgroundColor = [UIColor whiteColor];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        
        UPCollectionViewCell *UPcell = (UPCollectionViewCell *)cell;
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
        
    }else{
        DownCollectionViewCell * Downcell = (DownCollectionViewCell *)cell;
        Downcell.currentDate = self.currentDate;
        Downcell.superVC = self;
    }
    
    
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
    
    CGPoint point = scrollView.contentOffset;
    self.end = point.y;
    
    CGFloat uph = kMainCellUpH;
    
    CGFloat width = uph / 6;
    
    if (ABS(self.end - self.begin) > 80) {
        self.isWeek = !self.isWeek;
    }
    
    if (self.isWeek) {
        [self.tableView setContentOffset:CGPointMake(0, width * 5 + 3 - 64)];
       
    }else{
        
        [self.tableView setContentOffset:CGPointMake(0, - 64)];
    }

}

// 开始拖拽时调用该方法
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    
    CGPoint point = scrollView.contentOffset;
    self.begin = point.y;
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
            
            self.weekCell.frame = CGRectMake(0, uph / 6 * [ToolCalendar currentWeekInThisMonth:self.currentDate] - space + 94 - 1, kSize(self.view).width, kSize(self.view).height / 6);

            
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
            [weakSelf.UPCell setCurrentDate:date];
            weakSelf.title = [ToolCalendar dateToStringNODay:date];
            [weakSelf.UPCell reloadData];
            [weakSelf.DownCell reloadData];
        }];
    }
    return _weekCell;
}




- (void)todayButton{
    
    if ([self.currentDate.description isEqualToString:[NSDate date].description]) {
        return;
    }
    self.currentDate = [NSDate date];
    [self.tableView reloadData];
    self.weekCell.currentDate = [NSDate date];
    [self.weekCell reloadDate];
    
    self.title = [ToolCalendar dateToStringNODay:self.currentDate];
    
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}






@end
