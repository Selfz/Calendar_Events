//
//  DateCollectionViewCell.m
//  Calendar
//
//  Created by lushouxiang on 16/1/29.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "DateCollectionViewCell.h"
#define donwLabel_font 9
#define upLabel_font 18

@interface DateCollectionViewCell ()
{
    
}

@property (nonatomic ,strong) UILabel * upLabel;
@property (nonatomic ,strong) UILabel * downLabel;
@property (nonatomic ,strong) UILabel * pointLabel;

@property(nonatomic, strong) NSDate * Today;

@end




@implementation DateCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {

        self.Today = [NSDate date];
    }
    
    return self;
}

- (void)setDateModel:(DateModel *)dateModel{
    
    
    _dateModel = dateModel;
    self.upLabel.text = [NSString stringWithFormat:@"%ld",dateModel.day];

    if (dateModel.isToday) {
        self.pointLabel.hidden = NO;
        self.layer.cornerRadius = 20;
        self.layer.backgroundColor = (__bridge CGColorRef _Nullable)([UIColor redColor]);
        
    }else{
        self.pointLabel.hidden = YES;
    }

    self.downLabel.text = dateModel.lunarCalendar;
}



- (void)setCurrentDate:(NSDate *)currentDate{
    
    _currentDate = currentDate;
    
    NSDate * modelDate = [ToolCalendar DateWithday:self.dateModel.day Month:self.dateModel.month Year:self.dateModel.year];
    
    
    if ([[ToolCalendar dateToString:_currentDate] isEqualToString:[ToolCalendar dateToString:modelDate]]) {
        
        self.layer.cornerRadius = self.bounds.size.width/2;
        self.backgroundColor = [UIColor colorWithRed:(79/255.0) green:(166/255.0) blue:0.98 alpha:1];
        self.tintColor = [UIColor whiteColor];
        
    }else{
        
        if ([[ToolCalendar dateToString:self.Today] isEqualToString:[ToolCalendar dateToString:modelDate]]){
            self.layer.cornerRadius = self.bounds.size.width/2;
            self.layer.borderWidth = 0.98;
            self.layer.borderColor = [UIColor colorWithRed:(79/255.0) green:(166/255.0) blue:0.98 alpha:1].CGColor;
            self.backgroundColor = [UIColor clearColor];
            self.tintColor = [UIColor blackColor];
        }else{
            self.layer.cornerRadius = 0;
            self.backgroundColor = [UIColor clearColor];
            self.tintColor = [UIColor blackColor];
        }
        
    }
    
    self.upLabel.textColor = self.tintColor;
    self.pointLabel.textColor = self.tintColor;
    self.downLabel.textColor = self.tintColor;
    
}


- (UILabel *)upLabel{
    
    if (!_upLabel) {
        _upLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 5, self.bounds.size.width, self.bounds.size.height/2-3)];
        _upLabel.textAlignment = NSTextAlignmentCenter;
        _upLabel.font = [UIFont systemFontOfSize:upLabel_font];
        [self addSubview:_upLabel];
    }
    return _upLabel;
}

- (UILabel *)downLabel{
    if (!_downLabel) {
        _downLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, self.bounds.size.height/2 + 3, self.bounds.size.width, self.bounds.size.height/2 - 8)];
        _downLabel.textAlignment = NSTextAlignmentCenter;
        _downLabel.font = [UIFont systemFontOfSize:donwLabel_font];
        [self addSubview:_downLabel];
    }
    return _downLabel;
}

- (UILabel *)pointLabel{
    if (!_pointLabel) {
        _pointLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, self.bounds.size.height-5, self.bounds.size.width,5)];
        _pointLabel.text = @"·";
        _pointLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_pointLabel];
    }
    return _pointLabel;
}

@end
