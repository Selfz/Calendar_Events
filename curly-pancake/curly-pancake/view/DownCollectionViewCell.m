//
//  DownCollectionViewCell.m
//  Calendar
//
//  Created by lushouxiang on 16/1/29.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "DownCollectionViewCell.h"
#import "TaskTableViewCell.h"

@interface DownCollectionViewCell ()<UITableViewDelegate,UITableViewDataSource>
{
    
}
@property (nonatomic ,strong) UITableView * tableView;

@property (nonatomic ,strong) NSArray * sourceData;

@property (nonatomic ,strong) UILabel * label;

@end



@implementation DownCollectionViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
 
    }
    return self;
}




- (void)setCurrentDate:(NSDate *)currentDate{
    _currentDate = currentDate;

    [self addSourceDataWithDate:currentDate];
    
    [self addTableView];
    
    
    if (!self.sourceData.count) {
       
        self.label.hidden = NO;
        
    }else{
        self.label.hidden = YES;
        
    }
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.sourceData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    TaskTableViewCell * cell = [[TaskTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"zzz"];

    cell.model = self.sourceData[indexPath.row];

    return cell;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
//    TaskTableViewCell * cell = [tableView cellForRowAtIndexPath:indexPath];
//    TaskModel * model = cell.model;
    
}



- (void)addSourceDataWithDate:(NSDate *)date{
  
    NSString * file = [NSString stringWithFormat:@"%@.archiver",[ToolCalendar dateToString:date]];
    NSString *filePath = [NSHomeDirectory() stringByAppendingPathComponent:file];
    NSArray * arr = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    
    self.sourceData = arr;
    
}



- (void)addTableView{
    UITableView * table = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kSize([UIScreen mainScreen]).width, self.bounds.size.height) style:UITableViewStyleGrouped];
    self.tableView = table;
    
    table.bounces = NO;
    table.showsVerticalScrollIndicator = NO;
    table.dataSource = self;
    table.delegate = self;
    
    
    [self addSubview:table];
}


- (void)reloadData{
    [self.tableView reloadData];
}


@end
