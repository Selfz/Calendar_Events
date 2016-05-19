//
//  TaskModel.h
//  Calendar
//
//  Created by lushouxiang on 16/1/29.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TaskModel : NSObject <NSCoding>

@property (nonatomic ,assign) int type;
@property (nonatomic ,strong) NSString * content;
@property (nonatomic ,strong) NSString * adress;
@property (nonatomic ,strong) NSString * time;
@property (nonatomic ,assign) BOOL isShare;


@end
