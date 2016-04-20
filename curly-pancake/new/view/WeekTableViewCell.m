//
//  WeekTableViewCell.m
//  Calendar
//
//  Created by lushouxiang on 16/2/1.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "WeekTableViewCell.h"
#import "WeekCollectionViewCell.h"


@interface WeekTableViewCell () <UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic ,strong) didScrollerTo didscroller;   // 每次切换一次月份，就会调用一次该Block

@property (nonatomic ,strong) WeekModel * leftModel;
@property (nonatomic ,strong) WeekModel * rightModel;


@property (nonatomic ,strong) UICollectionView * collectionView;

@end

@implementation WeekTableViewCell

//- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
//    
//    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
//        
//        self.currentDate = [NSDate date];
//        
//        [self addBodyView];
//        
//    }
//    return self;
//}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
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
    
    WeekCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellUp" forIndexPath:indexPath];
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
        
        self.currentDate = [[ToolCalendar lastWeekens:self.currentDate] firstObject];
        
    }else if (scrollView.contentOffset.x > kSize([UIScreen mainScreen]).width){
        
        self.currentDate = [[ToolCalendar nextWeekens:self.currentDate] firstObject];
        
    }

    
    [self.collectionView reloadData];
    [self.collectionView setContentOffset:CGPointMake(kSize([UIScreen mainScreen]).width, 0)];

    if (self.didscroller) {
        self.didscroller(self.currentDate);
        
    }
}










- (void)setCurrentDate:(NSDate *)currentDate{
    _currentDate = currentDate;
    self.currentModel = [WeekModel weekModelWithDate:_currentDate];
    self.leftModel = [WeekModel weekModelWithDate:[[ToolCalendar lastWeekens:_currentDate] firstObject]];
    self.rightModel = [WeekModel weekModelWithDate:[[ToolCalendar nextWeekens:_currentDate] firstObject]];
    [self.collectionView reloadData];
}


- (WeekModel *)leftModel{
    if (!_leftModel) {
        _leftModel = [WeekModel weekModelWithDate:[[ToolCalendar lastWeekens:self.currentDate] firstObject]];
    }
    return _leftModel;
}


- (WeekModel *)currentModel{
    if (!_currentModel) {
        _currentModel = [WeekModel weekModelWithDate:self.currentDate];
    }
    return _currentModel;
}


- (WeekModel *)rightModel{
    if (!_rightModel) {
        _rightModel = [WeekModel weekModelWithDate:[[ToolCalendar nextWeekens:self.currentDate] firstObject]];
    }
    return _rightModel;
}



- (void)addBodyView{
    
    UICollectionViewFlowLayout * flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(kSize([UIScreen mainScreen]).width, 55);
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    flowLayout.minimumLineSpacing = 0;
    flowLayout.minimumInteritemSpacing = 0;
    
    UICollectionView * collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, kSize([UIScreen mainScreen]).width, 55) collectionViewLayout:flowLayout];
    
    [collectionView registerClass:[WeekCollectionViewCell class] forCellWithReuseIdentifier:@"cellUp"];
    collectionView.backgroundColor = [UIColor colorWithRed:0.4 green:0.7 blue:0.8 alpha:1];
    collectionView.pagingEnabled = YES;
    collectionView.delegate = self;
    collectionView.dataSource  = self;
    collectionView.showsHorizontalScrollIndicator = NO;
    [self addSubview:collectionView];
    
    
    self.collectionView = collectionView;
    self.collectionView.contentOffset = CGPointMake(kSize([UIScreen mainScreen]).width, 0);
    

}

- (void)reloadDate{
    [self.collectionView reloadData];
}



@end
