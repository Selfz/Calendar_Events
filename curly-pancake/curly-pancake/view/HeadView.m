//
//  HeadView.m
//  Calendar
//
//  Created by lushouxiang on 16/1/29.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "HeadView.h"

@implementation HeadView

CGFloat itemH = 30;
- (instancetype) initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:CGRectMake(0, 0, kSize([UIScreen mainScreen]).width, itemH)]) {
        
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kSize([UIScreen mainScreen]).width, itemH)];
        view.backgroundColor = [UIColor colorWithRed:0.32 green:0.99 blue:0.32 alpha:1];
        [self addSubview:view];
        
        NSArray * arr = @[@"日",@"一",@"二",@"三",@"四",@"五",@"六"];
        CGFloat itemW = kSize([UIScreen mainScreen]).width / 7;
        for (int i = 0; i < 7; i++) {
            UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(i * itemW, 0, itemW, itemH)];
            [view addSubview:label];
            label.text = arr[i];
            label.textAlignment = NSTextAlignmentCenter;
        }
        
        [self addSubview:view];
        
    }
    return self;
}



@end
