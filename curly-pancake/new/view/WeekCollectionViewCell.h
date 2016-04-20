//
//  WeekCollectionViewCell.h
//  Calendar
//
//  Created by lushouxiang on 16/2/1.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WeekModel.h"

#define kSize(view) view.bounds.size




typedef void(^didSelectDate)(NSDate * date);

@interface WeekCollectionViewCell : UICollectionViewCell

@property (nonatomic ,strong) WeekModel * model;

@property (nonatomic ,strong) NSDate * currentDate;


- (void)setDidSelectDate:(didSelectDate)selectDate;

@end
