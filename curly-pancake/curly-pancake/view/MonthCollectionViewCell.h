//
//  MonthCollectionViewCell.h
//  Calendar
//
//  Created by lushouxiang on 16/1/29.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ToolCalendar.h"
#import "MonthModel.h"
#import "DateModel.h"
#import "WeekModel.h"
#define kSize(view) view.bounds.size

typedef void(^didSelectDate)(NSDate * date);

@interface MonthCollectionViewCell : UICollectionViewCell


@property (nonatomic ,strong) MonthModel * model;

@property (nonatomic ,strong) NSDate * currentDate;


- (void)setDidSelectDate:(didSelectDate)selectDate;

@end
