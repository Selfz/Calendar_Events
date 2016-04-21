//
//  ToolCalendar.h
//  Calendar
//
//  Created by lushouxiang on 16/1/29.
//  Copyright © 2016年 zzz. All rights reserved.
//
#define T_yyyy_MM_dd @"yyyy-MM-dd"
#define T_yyyy_MM_dd_HH_mm @"yyyy-MM-dd HH:mm"
#define T_HH_mm @"HH:mm"
#define T_yyyy__MM @"yyyy.MM"
#define T_yyyyMMddHHmm @"yyyyMMddHHmm"


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
+ (NSString *)holidayWithDate:(NSDate *)day;

+ (NSDate *)firstDayOfCurrentMonth:(NSDate *) date;

+ (NSDate *)DateWithday:(NSInteger )day Month:(NSInteger )month Year:(NSInteger)year;
+ (NSString *)dateToString:(NSDate *)date;
+ (NSString *)dateToStringNODay:(NSDate *)date;


+ (BOOL)isSameMonthWithToday:(NSDate *)date;



@end
