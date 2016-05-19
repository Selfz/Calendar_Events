//
//  TaskTableViewCell.m
//  Calendar
//
//  Created by lushouxiang on 16/1/30.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "TaskTableViewCell.h"



@interface TaskTableViewCell ()

@property (nonatomic ,strong) UILabel * leftLabel;
@property (nonatomic ,strong) UILabel * rightLabe;

@end


@implementation TaskTableViewCell


- (void)setModel:(TaskModel *)model{
    _model = model;
    
    self.leftLabel.text = model.time;
    self.rightLabe.text = model.adress;
}




- (UILabel *)leftLabel{
    
    if (!_leftLabel) {
        _leftLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.height, self.bounds.size.height)];
        _leftLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_leftLabel];
    }
    return _leftLabel;
}


- (UILabel *)rightLabe{
    if (!_rightLabe) {
        _rightLabe = [[UILabel alloc] initWithFrame:CGRectMake(self.bounds.size.height + 10 , 0, self.bounds.size.width - self.bounds.size.height - 10, self.bounds.size.height)];
        _rightLabe.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_rightLabe];
    }
    return _rightLabe;
}





- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
