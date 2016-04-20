//
//  WeekTableViewCell.h
//  Calendar
//
//  Created by lushouxiang on 16/2/1.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ToolCalendar.h"
#import "MonthModel.h"
#import "DateModel.h"
#import "WeekModel.h"
#define kSize(view) view.bounds.size

typedef void(^didScrollerTo)(NSDate * date);

@interface WeekTableViewCell : UIView

@property (nonatomic ,strong) WeekModel * currentModel;

@property (nonatomic ,strong) NSDate * currentDate;


- (void)setDidscroller:(didScrollerTo)didscroller;
- (void)reloadDate;

@end
