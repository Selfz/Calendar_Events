//
//  WeekCollectionViewCell.m
//  Calendar
//
//  Created by lushouxiang on 16/2/1.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "WeekCollectionViewCell.h"
#import "DateCollectionViewCell.h"
#import "ToolCalendar.h"

@interface WeekCollectionViewCell () <UICollectionViewDelegate,UICollectionViewDataSource>


@property (nonatomic ,weak) DateCollectionViewCell * currentCell;

@property (nonatomic ,strong) didSelectDate selectDate;

@end


@implementation WeekCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        [self addBodyView];
        
    }
    
    return self;
}


- (void)setModel:(WeekModel *)model{
    _model = model;
    
    [self addBodyView];
}

- (void)setDidSelectDate:(didSelectDate)selectDate{
    _selectDate = selectDate;
}




- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return 7;
}




- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    DateCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellUp" forIndexPath:indexPath];
    cell.dateModel = self.model.dates[indexPath.row];
    cell.currentDate = self.currentDate;
  
    
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
