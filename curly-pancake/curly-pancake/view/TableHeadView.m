//
//  TableHeadView.m
//  Calendar
//
//  Created by lushouxiang on 16/1/30.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "TableHeadView.h"
#import "AddTableViewController.h"


@interface TableHeadView ()
{
    
}
@property (nonatomic ,strong) didAddAction addAcitonBlock;


@end


@implementation TableHeadView



CGFloat itemHs = 25;
- (instancetype) initWithFrame:(CGRect)frame{
    
    
    if (self = [super initWithFrame:CGRectMake(0, 0, kSize([UIScreen mainScreen]).width, itemHs*2)]) {
        
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, itemHs, kSize([UIScreen mainScreen]).width, itemHs)];
        view.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1];
        [self addSubview:view];
        
        UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kSize([UIScreen mainScreen]).width, itemHs)];
        view2.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:0.9];
        [self addSubview:view2];

        
        UIButton * button = [[UIButton alloc] initWithFrame:CGRectMake(kSize([UIScreen mainScreen]).width - 80, 0, 50, 50)];
        [button setBackgroundColor:[UIColor colorWithRed:0.98 green:0.6 blue:0 alpha:1]];
        [button setImage:[UIImage imageNamed:@"icon_tianjia"] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:button];
        
    }
    return self;
}

- (void)buttonAction{
    if (self.addAcitonBlock) {
        self.addAcitonBlock();
    }

}


- (void)setDidAddButtonAction:(didAddAction)block{
    _addAcitonBlock = block;
}


@end
