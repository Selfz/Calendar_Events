//
//  DateCollectionViewCell.h
//  Calendar
//
//  Created by lushouxiang on 16/1/29.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ToolCalendar.h"
#import "DateModel.h"


#define CellID @"DateCellID"

@interface DateCollectionViewCell : UICollectionViewCell

@property (nonatomic ,strong) DateModel * dateModel;
@property (nonatomic ,strong) NSDate * currentDate;

@end
