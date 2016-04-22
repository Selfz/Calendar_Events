//
//  MonthCollectionViewCell.m
//  Calendar
//
//  Created by lushouxiang on 16/1/29.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "MonthCollectionViewCell.h"
#import "DateCollectionViewCell.h"

@interface MonthCollectionViewCell ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic ,weak) DateCollectionViewCell * currentCell;

@property (nonatomic ,strong) didSelectDate selectDate;

@end


@implementation MonthCollectionViewCell


- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        [self addBodyView];
        
    }
    
    return self;
}


- (void)setModel:(MonthModel *)model{
    _model = model;

    [self addBodyView];
}

- (void)setDidSelectDate:(didSelectDate)selectDate{
    _selectDate = selectDate;
}




- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    DateModel * dateModel = self.model.dates[0];
    NSInteger firstWeak = dateModel.weak;
    NSInteger totalCount = firstWeak +  self.model.dates.count;
    return totalCount;
}




- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    DateCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellUp" forIndexPath:indexPath];
    
    DateModel * dateModel = self.model.dates[0];
    NSInteger firstWeak = dateModel.weak;
    cell.hidden = NO;
    
    if (indexPath.row >= firstWeak) {
        cell.dateModel = self.model.dates[indexPath.row - firstWeak];
        cell.currentDate = self.currentDate;
    }else{
        cell.hidden = YES;
    }

    
    return cell;
    
    
    
}



- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    DateCollectionViewCell * cell = (DateCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    
    DateModel * model = cell.dateModel;
    
    self.currentDate = [ToolCalendar DateWithday:model.day Month:model.month Year:model.year];
    if (self.selectDate) {
        self.selectDate(self.currentDate);
    }
    
    [collectionView reloadData];
}




- (void)addBodyView{
    
    UICollectionViewFlowLayout * flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.minimumInteritemSpacing = 1;
    flowLayout.minimumLineSpacing = 1;
    
    flowLayout.itemSize = CGSizeMake((kSize([UIScreen mainScreen]).width / 7) - 1, ((kSize([UIScreen mainScreen]).width - 50)/6 ) - 1);
    
    UICollectionView * collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, kSize([UIScreen mainScreen]).width, kSize([UIScreen mainScreen]).width - 50) collectionViewLayout:flowLayout];
    
    [collectionView registerClass:[DateCollectionViewCell class] forCellWithReuseIdentifier:@"cellUp"];
    
    collectionView.backgroundColor = [UIColor whiteColor];
    collectionView.pagingEnabled = YES;
    collectionView.delegate = self;
    collectionView.dataSource  = self;
    collectionView.showsVerticalScrollIndicator = NO;
    
    [self addSubview:collectionView];
}



@end
