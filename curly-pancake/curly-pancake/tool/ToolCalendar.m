//
//  ToolCalendar.m
//  Calendar
//
//  Created by lushouxiang on 16/1/29.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "ToolCalendar.h"

@implementation ToolCalendar


#pragma mark - date

+ (NSInteger)day:(NSDate *)date{
    NSDateComponents *components = [[NSCalendar currentCalendar] components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:date];
    return [components day];
}


+ (NSInteger)month:(NSDate *)date{
    NSDateComponents *components = [[NSCalendar currentCalendar] components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:date];
    return [components month];
}

+ (NSInteger)year:(NSDate *)date{
    NSDateComponents *components = [[NSCalendar currentCalendar] components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:date];
    return [components year];
}


+ (NSInteger)firstWeekdayInThisMonth:(NSDate *)date{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    [calendar setFirstWeekday:1];//1.Sun. 2.Mon. 3.Thes. 4.Wed. 5.Thur. 6.Fri. 7.Sat.
    NSDateComponents *comp = [calendar components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:date];
    [comp setDay:1];
    NSDate *firstDayOfMonthDate = [calendar dateFromComponents:comp];
    
    NSUInteger firstWeekday = [calendar ordinalityOfUnit:NSCalendarUnitWeekday inUnit:NSCalendarUnitWeekOfMonth forDate:firstDayOfMonthDate];
    return firstWeekday - 1;
}

+ (NSInteger)totaldaysInThisMonth:(NSDate *)date{
    NSRange totaldaysInMonth = [[NSCalendar currentCalendar] rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:date];
    return totaldaysInMonth.length;
}

+ (NSInteger)totaldaysInMonth:(NSDate *)date{
    NSRange daysInLastMonth = [[NSCalendar currentCalendar] rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:date];
    return daysInLastMonth.length;
}





+ (NSInteger)currentWeekInThisMonth:(NSDate *)date{
    
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSInteger day = [calendar components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:date].day;
    
    NSInteger week = [ToolCalendar firstWeekdayInThisMonth:date] - 1;
    
    NSInteger index = (day + week) / 7;
    
    return index;
}



+ (NSDate *)lastMonth:(NSDate *)date{
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    dateComponents.month = -1;
    NSDate *newDate = [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents toDate:date options:0];
    return newDate;
}

+ (NSDate *)firstDayOfCurrentMonth:(NSDate *) date
{
    NSDate *startDate = nil;
    [[NSCalendar currentCalendar] rangeOfUnit:NSCalendarUnitMonth startDate:&startDate interval:NULL forDate:date];
    return startDate;
}


+ (NSDate*)nextMonth:(NSDate *)date{
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    dateComponents.month = +1;
    NSDate *newDate = [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents toDate:date options:0];
    return newDate;
}


+ (NSArray *)lastWeekens:(NSDate *)date{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSInteger week = [calendar ordinalityOfUnit:NSCalendarUnitWeekday inUnit:NSCalendarUnitWeekOfMonth forDate:date] - 1;
    
    NSMutableArray * arr = [NSMutableArray array];
    
    
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    
    
    for (int i = 0; i < 7; i++) {
        dateComponents.day = +i -week - 7;
        NSDate *newDate = [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents toDate:date options:0];
        [arr addObject:newDate];
        
    }
    return arr;
}




+ (NSArray *)currentWeekens:(NSDate *)date{
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSInteger week = [calendar ordinalityOfUnit:NSCalendarUnitWeekday inUnit:NSCalendarUnitWeekOfMonth forDate:date] - 1;
    
    NSMutableArray * arr = [NSMutableArray array];
    
    
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
   
    
    for (int i = 0; i < 7; i++) {
        dateComponents.day = +i -week;
         NSDate *newDate = [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents toDate:date options:0];
        [arr addObject:newDate];
        
    }
    return arr;
}


+ (NSArray *)nextWeekens:(NSDate *)date{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSInteger week = [calendar ordinalityOfUnit:NSCalendarUnitWeekday inUnit:NSCalendarUnitWeekOfMonth forDate:date] - 1;
    
    NSMutableArray * arr = [NSMutableArray array];
    
    
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    
    
    for (int i = 0; i < 7; i++) {
        dateComponents.day = +i -week + 7;
        NSDate *newDate = [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents toDate:date options:0];
        [arr addObject:newDate];
        
    }
    return arr;
}







+(NSString*)getChineseCalendarWithDate:(NSDate *)date{
    
    NSArray *chineseYears = [NSArray arrayWithObjects:
                             @"甲子", @"乙丑", @"丙寅", @"丁卯",  @"戊辰",  @"己巳",  @"庚午",  @"辛未",  @"壬申",  @"癸酉",
                             @"甲戌",   @"乙亥",  @"丙子",  @"丁丑", @"戊寅",   @"己卯",  @"庚辰",  @"辛己",  @"壬午",  @"癸未",
                             @"甲申",   @"乙酉",  @"丙戌",  @"丁亥",  @"戊子",  @"己丑",  @"庚寅",  @"辛卯",  @"壬辰",  @"癸巳",
                             @"甲午",   @"乙未",  @"丙申",  @"丁酉",  @"戊戌",  @"己亥",  @"庚子",  @"辛丑",  @"壬寅",  @"癸丑",
                             @"甲辰",   @"乙巳",  @"丙午",  @"丁未",  @"戊申",  @"己酉",  @"庚戌",  @"辛亥",  @"壬子",  @"癸丑",
                             @"甲寅",   @"乙卯",  @"丙辰",  @"丁巳",  @"戊午",  @"己未",  @"庚申",  @"辛酉",  @"壬戌",  @"癸亥", nil];
    
    NSArray *chineseMonths=[NSArray arrayWithObjects:
                            @"正月", @"二月", @"三月", @"四月", @"五月", @"六月", @"七月", @"八月",
                            @"九月", @"十月", @"冬月", @"腊月", nil];
    
    
    NSArray *chineseDays=[NSArray arrayWithObjects:
                          @"初一", @"初二", @"初三", @"初四", @"初五", @"初六", @"初七", @"初八", @"初九", @"初十",
                          @"十一", @"十二", @"十三", @"十四", @"十五", @"十六", @"十七", @"十八", @"十九", @"二十",
                          @"廿一", @"廿二", @"廿三", @"廿四", @"廿五", @"廿六", @"廿七", @"廿八", @"廿九", @"三十",  nil];
    
    
    NSCalendar *localeCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierChinese];
    
    unsigned unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth |  NSCalendarUnitDay;
    
    NSDateComponents *localeComp = [localeCalendar components:unitFlags fromDate:date];
    
    NSString *y_str = [chineseYears objectAtIndex:localeComp.year-1];
    NSString *m_str = [chineseMonths objectAtIndex:localeComp.month-1];
    NSString *d_str = [chineseDays objectAtIndex:localeComp.day-1];
    
    if ([d_str isEqualToString:@"初一"]) {
        d_str = [self getChineseMonthWithDate:date];
    }
    
    NSString *chineseCal_str =[NSString stringWithFormat: @"%@_%@_%@",y_str,m_str,d_str];

    return chineseCal_str;
}


+(NSString*)getChineseMonthWithDate:(NSDate *)date{
    
    NSArray *chineseMonths=[NSArray arrayWithObjects:
                            @"正月", @"二月", @"三月", @"四月", @"五月", @"六月", @"七月", @"八月",
                            @"九月", @"十月", @"冬月", @"腊月", nil];
    
    
    NSCalendar *localeCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierChinese];
    
    unsigned unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth |  NSCalendarUnitDay;
    
    NSDateComponents *localeComp = [localeCalendar components:unitFlags fromDate:date];
    
    
    NSString *m_str = [chineseMonths objectAtIndex:localeComp.month-1];
    
    return m_str;
    
}

//获取年月日对象


//节日的判断
+ (NSString *)holidayWithDate:(NSDate *)day{
    //这里来判断节日
    //今天
    
    NSString *str;
    NSDate *nowDay = [NSDate date];
    
    NSCalendar * calendar = [NSCalendar currentCalendar];
    
    NSDateComponents *calendarToDay  = [calendar components:NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit|NSWeekdayCalendarUnit fromDate:day];
    
    NSDateComponents *calendarDay  = [calendar components: NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit|NSWeekdayCalendarUnit fromDate:nowDay];//今天
    
    if (calendarToDay.year == calendarDay.year &&
        calendarToDay.month == calendarDay.month &&
        calendarToDay.day == calendarDay.day) {
        //        str = @"今天";
        
    }else if (calendarToDay.month == 1 &&
              calendarToDay.day == 1){
        str = @"元旦";
        
        //2.14情人节
    }else if (calendarToDay.month == 2 &&
              calendarToDay.day == 14){
        str = @"情人节";
        
        //3.8妇女节
    }else if (calendarToDay.month == 3 &&
              calendarToDay.day == 8){
        str = @"妇女节";
        
        //3.12 植树节
    }else if (calendarToDay.month == 3 &&
              calendarToDay.day == 12){
        str = @"植树节";
        
        //4.1 愚人节
    }else if (calendarToDay.month == 4 &&
              calendarToDay.day == 1){
        str = @"愚人节";
        
        //4.5 清明节
    }else if (calendarToDay.month == 4 &&
              calendarToDay.day == 4){
        str = @"清明节";
        
        //5.1 劳动节
    }else if (calendarToDay.month == 5 &&
              calendarToDay.day == 1){
        str = @"劳动节";
        
        //6.1 儿童节
    }else if (calendarToDay.month == 6 &&
              calendarToDay.day == 1){
        str = @"儿童节";
        
        //7.1 建党节
    }else if (calendarToDay.month == 7 &&
              calendarToDay.day == 1){
        str = @"建党节";
        
        //8.1 建军节
    }else if (calendarToDay.month == 8 &&
              calendarToDay.day == 1){
        str = @"建军节";
        
        //9.10教师节
    }else if (calendarToDay.month == 9 &&
              calendarToDay.day == 10){
        str = @"教师节";
        
        //10.1国庆节
    }else if (calendarToDay.month == 10 &&
              calendarToDay.day == 1){
        str = @"国庆节";
        
        //11.11光棍节
    }else if (calendarToDay.month == 11 &&
              calendarToDay.day == 11){
        str = @"光棍节";
        
        //12.24 平安夜
    }else if (calendarToDay.month == 12 &&
              calendarToDay.day == 24){
        str = @"平安夜";
        
        //12.25 圣诞节
    }else if (calendarToDay.month == 12 &&
              calendarToDay.day == 25) {
        str = @"圣诞节";
        
    }else{
        
        //这里添加其他节日
        
    }
    
    //获取农历
    NSString *chineseHoliday = [self getChineseCalendarWithDate:day];
    
    NSArray *solarYear_arr= [chineseHoliday componentsSeparatedByString:@"_"];
    
    if([solarYear_arr[1]isEqualToString:@"正月"] &&
       [solarYear_arr[2]isEqualToString:@"正月"]){
        
        //正月初一：春节
        str = @"春节";
        
    }else if([solarYear_arr[1]isEqualToString:@"正月"] &&
             [solarYear_arr[2]isEqualToString:@"十五"]){
        
        //正月十五：元宵节
        str = @"元宵";
        
    }else if([solarYear_arr[1]isEqualToString:@"二月"] &&
             [solarYear_arr[2]isEqualToString:@"初二"]){
        
        //二月初二：春龙节(龙抬头)
        str = @"龙抬头";
        
    }else if([solarYear_arr[1]isEqualToString:@"五月"] &&
             [solarYear_arr[2]isEqualToString:@"初五"]){
        
        //五月初五：端午节
        str = @"端午节";
        
    }else if([solarYear_arr[1]isEqualToString:@"七月"] &&
             [solarYear_arr[2]isEqualToString:@"初七"]){
        
        //七月初七：七夕情人节
        str = @"七夕";
        
    }else if([solarYear_arr[1]isEqualToString:@"八月"] &&
             [solarYear_arr[2]isEqualToString:@"十五"]){
        
        //八月十五：中秋节
        str = @"中秋";
        
    }else if([solarYear_arr[1]isEqualToString:@"九月"] &&
             [solarYear_arr[2]isEqualToString:@"初九"]){
        
        //九月初九：重阳节、中国老年节（义务助老活动日）
        str = @"重阳";
        
    }else if([solarYear_arr[1]isEqualToString:@"腊月"] &&
             [solarYear_arr[2]isEqualToString:@"初八"]){
        
        //腊月初八：腊八节
        str = @"腊八";
        
    }else if([solarYear_arr[1]isEqualToString:@"腊月"] &&
             [solarYear_arr[2]isEqualToString:@"二十四"]){
        
        //腊月二十四 小年
        str = @"小年";
        
    }else if([solarYear_arr[1]isEqualToString:@"腊月"] &&
             [solarYear_arr[2]isEqualToString:@"三十"]){
        
        //腊月三十（小月二十九）：除夕
        str = @"除夕";
    }
    
    //返回节日
    return str;
}



+ (NSDate *)DateWithday:(NSInteger )day Month:(NSInteger )month Year:(NSInteger)year{
    
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyy-MM-dd";
    NSString * dateStr = [NSString stringWithFormat:@"%ld-%ld-%ld",year,month,day];
    NSDate * date = [dateFormatter dateFromString:dateStr];

    return date;
}

+ (NSString *)dateToString:(NSDate *)date{
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyy-MM-dd";
    
    return [dateFormatter stringFromDate:date];
}

+ (NSString *)dateToStringNODay:(NSDate *)date{
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyy.MM";
    return [dateFormatter stringFromDate:date];
}

+ (BOOL)isSameMonthWithToday:(NSDate *)date{
    return [[self dateToStringNODay:[NSDate date]] isEqualToString:[self dateToStringNODay:date]];
}





@end
