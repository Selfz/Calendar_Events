//
//  UPCollectionViewCell.m
//  Calendar
//
//  Created by lushouxiang on 16/1/29.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "UPCollectionViewCell.h"
#import "MainTableViewController.h"

#import "WeekTableViewCell.h"
#import "MonthCollectionViewCell.h"

#import "FYLayer.h"


@interface UPCollectionViewCell ()<UICollectionViewDataSource,UICollectionViewDelegate>
{
    
}
@property (nonatomic ,strong) didScrollerTo didscroller;   // 每次切换一次月份，就会调用一次该Block

@property (nonatomic ,strong) MonthModel * leftModel;
@property (nonatomic ,strong) MonthModel * rightModel;

@property (nonatomic ,strong) UICollectionView * collectionView;



@end


@implementation UPCollectionViewCell



- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {

        self.currentDate = [NSDate date];
        
        [self addBodyView];

    }
    return self;
}

- (void)setDidscroller:(didScrollerTo)didscroller{
    _didscroller = didscroller;
}




- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return 3;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    MonthCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellUp" forIndexPath:indexPath];
    cell.currentDate = self.currentDate;
    
    [cell setDidSelectDate:^(NSDate *date) {
        self.currentDate = date;
        if (self.didscroller) {
            self.didscroller(self.currentDate);
        }
    }];
    
    if (indexPath.row == 0) {
        cell.model = self.leftModel;
        
    }else if (indexPath.row == 1){
        cell.model = self.currentModel;
        
    }else{
        cell.model = self.rightModel;
    }
    return cell;
}




- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    if (scrollView.contentOffset.x < kSize([UIScreen mainScreen]).width) {
        
        if ([ToolCalendar isSameMonthWithToday:[ToolCalendar lastMonth:self.currentDate]]) {
            self.currentDate = [NSDate date];
        }else{
           self.currentDate = [ToolCalendar firstDayOfCurrentMonth:[ToolCalendar lastMonth:self.currentDate]];
        }
        
        
    }else if (scrollView.contentOffset.x > kSize([UIScreen mainScreen]).width){
        if ([ToolCalendar isSameMonthWithToday:[ToolCalendar nextMonth:self.currentDate]]) {
            self.currentDate = [NSDate date];
        }else{
            self.currentDate = [ToolCalendar firstDayOfCurrentMonth:[ToolCalendar nextMonth:self.currentDate]];
        }
    }
    
    [self.collectionView reloadData];
    [self.collectionView setContentOffset:CGPointMake(kSize([UIScreen mainScreen]).width, 0)];
    
    if (self.didscroller) {
        self.didscroller(self.currentDate);
        
    }
}




- (void)setCurrentDate:(NSDate *)currentDate{
    _currentDate = currentDate;
    self.currentModel = [MonthModel monthModelWithDate:_currentDate];
    self.leftModel = [MonthModel monthModelWithDate:[ToolCalendar lastMonth:_currentDate]];
    self.rightModel = [MonthModel monthModelWithDate:[ToolCalendar nextMonth:_currentDate]];
    [self.collectionView reloadData];
}


- (MonthModel *)leftModel{
    if (!_leftModel) {
        _leftModel = [MonthModel monthModelWithDate:[ToolCalendar lastMonth:self.currentDate]];
    }
    return _leftModel;
}


- (MonthModel *)currentModel{
    if (!_currentModel) {
        _currentModel = [MonthModel monthModelWithDate:self.currentDate];
    }
    return _currentModel;
}


- (MonthModel *)rightModel{
    if (!_rightModel) {
        _rightModel = [MonthModel monthModelWithDate:[ToolCalendar nextMonth:self.currentDate]];
    }
    return _rightModel;
}



- (void)addBodyView{
    
    FYLayer * flowLayout = [[FYLayer alloc] init];
    flowLayout.itemSize = CGSizeMake(kSize([UIScreen mainScreen]).width, kSize([UIScreen mainScreen]).width - 50);

    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    flowLayout.minimumLineSpacing = 0;
    flowLayout.minimumInteritemSpacing = 0;
    
    UICollectionView * collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, kSize([UIScreen mainScreen]).width, kSize([UIScreen mainScreen]).width - 50) collectionViewLayout:flowLayout];
    
    [collectionView registerClass:[MonthCollectionViewCell class] forCellWithReuseIdentifier:@"cellUp"];
    collectionView.backgroundColor = [UIColor colorWithRed:0.4 green:0.7 blue:0.8 alpha:1];
    collectionView.pagingEnabled = YES;
    collectionView.delegate = self;
    collectionView.dataSource  = self;
    collectionView.showsHorizontalScrollIndicator = NO;
    [self addSubview:collectionView];
    
    
    self.collectionView = collectionView;
    self.collectionView.contentOffset = CGPointMake(kSize([UIScreen mainScreen]).width, 0);
    
    if (self.didscroller) {
        self.didscroller(self.currentDate);
    }
    
}


- (void)reloadData{
    [self.collectionView reloadData];
}




@end
