//
//  UPCollectionViewCell.h
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

typedef void(^didScrollerTo)(NSDate * date);

@interface UPCollectionViewCell : UITableViewCell



@property (nonatomic ,strong) NSDate * currentDate;
@property (nonatomic ,strong) MonthModel * currentModel;


- (void)setDidscroller:(didScrollerTo)didscroller;
- (void)reloadData;

@end
