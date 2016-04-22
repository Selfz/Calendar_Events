//
//  CPCalendarViewController.h
//  Calendar
//
//  Created by lushouxiang on 16/1/29.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import <UIKit/UIKit.h>
#define kMainCellUpH kSize([UIScreen mainScreen]).width - 50;
#define kMainCellDownH kSize([UIScreen mainScreen]).height - 55 - 94 - 19;
#define kSize(view) view.bounds.size

typedef void(^didScroll)(CGPoint contentOffset);


@interface CPCalendarViewController : UITableViewController



@end
