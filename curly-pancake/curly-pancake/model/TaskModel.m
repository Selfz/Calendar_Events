//
//  TaskModel.m
//  Calendar
//
//  Created by lushouxiang on 16/1/29.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "TaskModel.h"

@implementation TaskModel


- (void)encodeWithCoder:(NSCoder *)aCoder{
    
    [aCoder encodeInt:_type forKey:@"type"];
    [aCoder encodeObject:_content forKey:@"content"];
    [aCoder encodeObject:_adress forKey:@"adress"];
    [aCoder encodeObject:_time forKey:@"time"];
    [aCoder encodeBool:_isShare forKey:@"isShare"];
}


- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super init]) {
        _type = [[aDecoder decodeObjectForKey:@"type"] intValue];
        _content = [aDecoder decodeObjectForKey:@"content"];
        _adress = [aDecoder decodeObjectForKey:@"adress"];
        _time = [aDecoder decodeObjectForKey:@"time"];
        _isShare = [aDecoder decodeObjectForKey:@"isShare"];
    }
    
    return self;
}




@end
