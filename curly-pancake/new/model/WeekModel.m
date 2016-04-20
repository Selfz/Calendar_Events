//
//  WeekModel.m
//  Calendar
//
//  Created by lushouxiang on 16/2/1.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "WeekModel.h"


@implementation WeekModel

+ (instancetype)weekModelWithDate:(NSDate *)date{
    
    return [[self alloc] initWithDatez:date];
}



- (instancetype)initWithDatez:(NSDate *)date{
    if (self = [super init]) {
        
        [self addDatasWithDate:date];
        
    }
    return self;
    
}


- (void)addDatasWithDate:(NSDate *)date{
    
    NSArray * arr = [ToolCalendar currentWeekens:date];
    NSMutableArray * dates = [NSMutableArray array];
    for (NSInteger i = 0; i < 7; i ++) {
        
        NSDate * Newdate = arr[i];
        
        DateModel * dateModel = [DateModel dateModelWithDate:Newdate];
        dateModel.weak = i;
        
        [dates addObject:dateModel];
    }
    self.dates = dates;
}

@end
