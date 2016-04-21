//
//  DateModel.h
//  Calendar
//
//  Created by lushouxiang on 16/1/29.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ToolCalendar.h"
#import "MonthModel.h"
#import "WeekModel.h"
#define kSize(view) view.bounds.size

@interface DateModel : NSObject

@property (nonatomic ,assign) NSInteger month;
@property (nonatomic ,assign) NSInteger weak;
@property (nonatomic ,assign) NSInteger year;
@property (nonatomic ,assign) NSInteger day;

@property (nonatomic ,strong)  NSString * lunarCalendar;

@property (nonatomic ,strong) NSArray * tasks;

@property (nonatomic ,assign) BOOL isToday;


+ (instancetype)dateModelWithDate:(NSDate *)date;
- (instancetype)initWithDatez:(NSDate *)date;


@end
