//
//  MonthModel.h
//  Calendar
//
//  Created by lushouxiang on 16/1/29.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ToolCalendar.h"
#import "DateModel.h"


@interface MonthModel : NSObject
{
    
}

@property (nonatomic ,assign) int weekCont;

@property (nonatomic ,strong) NSArray * dates;


+ (instancetype)monthModelWithDate:(NSDate *)date;
- (instancetype)initWithDatez:(NSDate *)date;


@end
