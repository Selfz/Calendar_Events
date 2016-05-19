//
//  DataTool.m
//  curly-pancake
//
//  Created by tianshikechuang on 16/4/22.
//  Copyright © 2016年 tianshikechuang. All rights reserved.
//

#import "DataTool.h"

@implementation DataTool


- (NSMutableArray *)queryScheduleWithDay:(NSDate *)date{
    
    static NSString *sqlString =
    @"select t.* from SCHEDULE_TABEL t where t.status = 1 and t.if_repeat = 1 and t.repeat_type = 6 and substr(t.start_time, 1, 10) <= ? and (t.repeat_end_date is null or length(t.repeat_end_date) = 0 or t.repeat_end_date >= ?) and strftime('%w', ?) in ('1', '2', '3', '4', '5') and ? not in (select aa.year || '-' || case when aa.month <= 9 then 0||aa.month else aa.month end || '-' || case when aa.day<=9 then 0||aa.day else aa.day end start_date from T_HOLIDAY_TABLE aa where (if_off = 1 or if_duty = 1) and status = 1) and t.syncstatus != 3 union all select t.* from SCHEDULE_TABEL t where t.status = 1 and t.if_repeat = 1 and t.repeat_type <>6 and substr(t.start_time, 1, 10) <= ? and (t.repeat_end_date is null or length(t.repeat_end_date) = 0 or t.repeat_end_date >= ?) and (case when t.repeat_type = 2 then strftime('%w', substr(t.start_time, 1, 10)) when t.repeat_type = 3 then ((julianday(?) - julianday(substr(t.start_time, 1, 10))) %14) when t.repeat_type = 4 then strftime('%d', substr(t.start_time, 1, 10)) when t.repeat_type = 5 then strftime('%m', substr(t.start_time, 1, 10)) || strftime('%d', substr(t.start_time, 1, 10)) else 1 end) = (case when t.repeat_type = 2 then strftime('%w', ?) when t.repeat_type = 3 then 0 when t.repeat_type = 4 then strftime('%d', ?) when t.repeat_type = 5 then strftime('%m', ?) || strftime('%d', ?) else 1 end) and t.syncstatus != 3 union all select tt.* from SCHEDULE_TABEL tt where tt.status = 1 and tt.if_repeat = 0 and substr(tt.start_time, 1, 10) = ? and tt.syncstatus != 3";
    
    
//    NSString *dateStr1 = [date toYYYY_MM_DD];
//    NSMutableArray *arr = [[NSMutableArray alloc] initWithObjects:dateStr1,dateStr1,dateStr1,dateStr1,dateStr1,dateStr1,dateStr1,dateStr1,dateStr1,dateStr1,dateStr1,dateStr1,nil];
//    Database *db = [[Database alloc] init];
//    NSMutableArray *arrRet = [db executeQuery:sqlString withArray:arr];
    
//    return [TaskModel mj_objectArrayWithKeyValuesArray:arrRet];
    
    return nil;
}

@end
