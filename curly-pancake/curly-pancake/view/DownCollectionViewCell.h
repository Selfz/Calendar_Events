//
//  DownCollectionViewCell.h
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

@interface DownCollectionViewCell : UITableViewCell

@property (nonatomic ,strong) NSDate * currentDate;

@property (nonatomic ,weak) UIViewController *superVC;



- (void)reloadData;

@end
