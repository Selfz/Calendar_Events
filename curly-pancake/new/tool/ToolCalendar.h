//
//  ToolCalendar.h
//  Calendar
//
//  Created by lushouxiang on 16/1/29.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ToolCalendar : NSObject

+ (NSInteger)day:(NSDate *)date;

+ (NSInteger)month:(NSDate *)date;

+ (NSInteger)year:(NSDate *)date;

+ (NSInteger)firstWeekdayInThisMonth:(NSDate *)date;

+ (NSInteger)totaldaysInThisMonth:(NSDate *)date;

+ (NSInteger)totaldaysInMonth:(NSDate *)date;

+ (NSInteger)currentWeekInThisMonth:(NSDate *)date;


+ (NSDate *)lastMonth:(NSDate *)date;

+ (NSDate*)nextMonth:(NSDate *)date;

+ (NSArray *)lastWeekens:(NSDate *)date;
+ (NSArray *)nextWeekens:(NSDate *)date;
+ (NSArray *)currentWeekens:(NSDate *)date;


+(NSString*)getChineseCalendarWithDate:(NSDate *)date;
+(NSString*)getChineseMonthWithDate:(NSDate *)date;


+ (NSDate *)firstDayOfCurrentMonth:(NSDate *) date;

+ (NSDate *)DateWithday:(NSInteger )day Month:(NSInteger )month Year:(NSInteger)year;
+ (NSString *)dateToString:(NSDate *)date;
+ (NSString *)dateToStringNODay:(NSDate *)date;


+ (BOOL)isSameMonthWithToday:(NSDate *)date;



@end
