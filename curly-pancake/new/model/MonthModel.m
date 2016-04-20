//
//  MonthModel.m
//  Calendar
//
//  Created by lushouxiang on 16/1/29.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "MonthModel.h"


@implementation MonthModel

+ (instancetype)monthModelWithDate:(NSDate *)date{
    
    return [[self alloc] initWithDatez:date];
}



- (instancetype)initWithDatez:(NSDate *)date{
    if (self = [super init]) {
        
        [self addDatasWithDate:date];
        
    }
    return self;

}


- (void)addDatasWithDate:(NSDate *)date{
    
    NSInteger count = [ToolCalendar totaldaysInThisMonth:date];
    NSInteger month = [ToolCalendar month:date];
    NSInteger year = [ToolCalendar year:date];
    NSInteger weak = [ToolCalendar firstWeekdayInThisMonth:date];
    NSMutableArray * dates = [NSMutableArray array];
    
    
    for (NSInteger i = 1; i <= count; i ++) {
        
        NSDate * Newdate = [ToolCalendar DateWithday:i Month:month Year:year];

        weak = weak >= 7?weak - 7:weak;
        DateModel * dateModel = [DateModel dateModelWithDate:Newdate];
        dateModel.weak = weak;
        
        [dates addObject:dateModel];
    }
    self.dates = dates;
}




@end
