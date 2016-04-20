//
//  TableHeadView.h
//  Calendar
//
//  Created by lushouxiang on 16/1/30.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ToolCalendar.h"
#import "MonthModel.h"
#import "DateModel.h"
#import "WeekModel.h"
#define kSize(view) view.bounds.size

typedef void(^didAddAction)();

@interface TableHeadView : UIView

@property (nonatomic ,strong) NSDate * currentDate;

- (void)setDidAddButtonAction:(didAddAction)block;

@end
