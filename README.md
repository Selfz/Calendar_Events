![(logo)](http://a1.qpic.cn/psb?/V14KCrca0Bom6u/eZ7E9uvIqmpK6mHm9eRs2mmKSOz*HHlZ7Dh9yoFisj4!/b/dHEBAAAAAAAA&bo=gACAAAAAAAADByI!&rf=viewer_4)
## curly-pancake
* An easy way to use load Calendar view

## Contents
* Getting Started
    * [Features【curly-pancake是个什么】](#curly-pancake是个什么)
    * [Installation【如何使用curly-pancake】](#如何使用curly-pancak)
<!--* 常见API-->
<!--	* [MJRefreshComponent.h](#MJRefreshComponent.h)-->
<!--	* [MJRefreshHeader.h](#MJRefreshHeader.h)-->
<!--	* [MJRefreshFooter.h](#MJRefreshFooter.h)-->
<!--	* [MJRefreshAutoFooter.h](#MJRefreshAutoFooter.h)-->

* Examples
    * [Reference【参考】](#参考)
* [期待](#期待)

## <a id="curly-pancake是个什么"></a>curly-pancake是个什么
* 其实就是一个日历的视图控制器，可以用来做日程管理的。

## <a id="如何使用curly-pancakh"></a>如何使用curly-pancak
* cocoapods导入：`pod 'curly-pancakh'`
* 手动导入：
    * 将`curly-pancakh`文件夹中的所有文件拽入项目中
    * 导入主头文件：`#import "CPCalendarViewController.h"`

<!--```objc-->
<!--Base                        Custom-->
<!--MJRefresh.bundle            MJRefresh.h-->
<!--MJRefreshConst.h            MJRefreshConst.m-->
<!--UIScrollView+MJExtension.h  UIScrollView+MJExtension.m-->
<!--UIScrollView+MJRefresh.h    UIScrollView+MJRefresh.m-->
<!--UIView+MJExtension.h        UIView+MJExtension.m-->
<!--```-->


<!--## <a id="MJRefreshComponent.h"></a>MJRefreshComponent.h-->
<!--```objc-->
<!--/** 刷新控件的基类 */-->
<!--@interface MJRefreshComponent : UIView-->
<!--#pragma mark - 刷新状态控制-->
<!--/** 进入刷新状态 */-->
<!--- (void)beginRefreshing;-->
<!--/** 结束刷新状态 */-->
<!--- (void)endRefreshing;-->
<!--/** 是否正在刷新 */-->
<!--- (BOOL)isRefreshing;-->

<!--#pragma mark - 其他-->
<!--/** 根据拖拽比例自动切换透明度 */-->
<!--@property (assign, nonatomic, getter=isAutomaticallyChangeAlpha) BOOL automaticallyChangeAlpha;-->
<!--@end-->
<!--```-->

<!--## <a id="MJRefreshHeader.h"></a>MJRefreshHeader.h-->
<!--```objc-->
<!--@interface MJRefreshHeader : MJRefreshComponent-->
<!--/** 创建header */-->
<!--+ (instancetype)headerWithRefreshingBlock:(MJRefreshComponentRefreshingBlock)refreshingBlock;-->
<!--/** 创建header */-->
<!--+ (instancetype)headerWithRefreshingTarget:(id)target refreshingAction:(SEL)action;-->

<!--/** 这个key用来存储上一次下拉刷新成功的时间 */-->
<!--@property (copy, nonatomic) NSString *lastUpdatedTimeKey;-->
<!--/** 上一次下拉刷新成功的时间 */-->
<!--@property (strong, nonatomic, readonly) NSDate *lastUpdatedTime;-->

<!--/** 忽略多少scrollView的contentInset的top */-->
<!--@property (assign, nonatomic) CGFloat ignoredScrollViewContentInsetTop;-->
<!--@end-->
<!--```-->

<!--## <a id="MJRefreshFooter.h"></a>MJRefreshFooter.h-->
<!--```objc-->
<!--@interface MJRefreshFooter : MJRefreshComponent-->
<!--/** 创建footer */-->
<!--+ (instancetype)footerWithRefreshingBlock:(MJRefreshComponentRefreshingBlock)refreshingBlock;-->
<!--/** 创建footer */-->
<!--+ (instancetype)footerWithRefreshingTarget:(id)target refreshingAction:(SEL)action;-->

<!--/** 提示没有更多的数据 */-->
<!--- (void)endRefreshingWithNoMoreData;-->
<!--/** 重置没有更多的数据（消除没有更多数据的状态） */-->
<!--- (void)resetNoMoreData;-->

<!--/** 忽略多少scrollView的contentInset的bottom */-->
<!--@property (assign, nonatomic) CGFloat ignoredScrollViewContentInsetBottom;-->

<!--/** 自动根据有无数据来显示和隐藏（有数据就显示，没有数据隐藏） */-->
<!--@property (assign, nonatomic) BOOL automaticallyHidden;-->
<!--@end-->
<!--```-->

<!--## <a id="MJRefreshAutoFooter.h"></a>MJRefreshAutoFooter.h-->
<!--```objc-->
<!--@interface MJRefreshAutoFooter : MJRefreshFooter-->
<!--/** 是否自动刷新(默认为YES) */-->
<!--@property (assign, nonatomic, getter=isAutomaticallyRefresh) BOOL automaticallyRefresh;-->

<!--/** 当底部控件出现多少时就自动刷新(默认为1.0，也就是底部控件完全出现时，才会自动刷新) */-->
<!--@property (assign, nonatomic) CGFloat triggerAutomaticallyRefreshPercent;-->
<!--@end-->
<!--```-->

## <a id="参考"></a>参考
```objc
* 由于这个框架的用法非常简单，
* CPCalendarViewController * MVC = [[CPCalendarViewController alloc] init];
* [self.navigationController pushViewController:MVC animated:YES];
* 直接就可以使用了，如果要自定义日期的事件的时候，可以在 DownCollectionViewCell 文件中进行编辑。
```


## 提醒
* 本框架纯ARC，暂时不支持横屏展示,

## <a id="期待"></a>期待
* 如果在使用过程中遇到BUG，希望你能Issues我，谢谢（或者尝试下载最新的框架代码看看BUG修复没有）
* 如果在使用过程中发现功能不够用，希望你能Issues我，我非常想为这个框架增加更多好用的功能，谢谢
* 如果你想为curly-pancake输出代码，请拼命Pull Requests我

