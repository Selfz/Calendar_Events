//
//  DateModel.m
//  Calendar
//
//  Created by lushouxiang on 16/1/29.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "DateModel.h"

@implementation DateModel

+ (instancetype)dateModelWithDate:(NSDate *)date{
    
    return [[self alloc] initWithDatez:date];
}


- (instancetype)initWithDatez:(NSDate *)date{
    
    if (self = [super init]) {
        
        self.day = [ToolCalendar day:date];
        self.month = [ToolCalendar month:date];
        self.year = [ToolCalendar year:date];
        
        if ([[ToolCalendar dateToString:[NSDate date]] isEqualToString:[ToolCalendar dateToString:date]]) {
            self.isToday = YES;
        }
        
        NSString * str = [ToolCalendar getChineseCalendarWithDate:date];
        NSArray * arr = [str componentsSeparatedByString:@"_"];

        self.lunarCalendar = [arr lastObject];
        
        NSString * strH = [ToolCalendar holidayWithDate:date];
        if (strH) {
            self.lunarCalendar = strH;
        }
    }
    return self;
}



@end
