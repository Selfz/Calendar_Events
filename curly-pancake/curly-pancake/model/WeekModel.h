//
//  WeekModel.h
//  Calendar
//
//  Created by lushouxiang on 16/2/1.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ToolCalendar.h"
#import "DateModel.h"

@interface WeekModel : NSObject

@property (nonatomic ,strong) NSArray * dates;


+ (instancetype)weekModelWithDate:(NSDate *)date;
- (instancetype)initWithDatez:(NSDate *)date;

@end
