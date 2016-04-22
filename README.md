![(logo)](http://a1.qpic.cn/psb?/V14KCrca0Bom6u/eZ7E9uvIqmpK6mHm9eRs2mmKSOz*HHlZ7Dh9yoFisj4!/b/dHEBAAAAAAAA&bo=gACAAAAAAAADByI!&rf=viewer_4)
## curly-pancake
* An easy way to use load Calendar view

## Contents
* Getting Started
    * [Features【curly-pancake是个什么】](#curly-pancake是个什么)
    * [Installation【如何使用curly-pancake】](#如何使用curly-pancak)


* Examples
   * [Reference【参考】](#参考)
   *  [提醒](#提醒)
   * [期待](#期待)


## <a id="curly-pancake是个什么"></a>curly-pancake是个什么
* 其实就是一个日历的视图控制器，可以用来做日程管理的。

## <a id="如何使用curly-pancakh"></a>如何使用curly-pancak
* cocoapods导入：`pod 'curly-pancakh'`
* 手动导入：
    * 将`curly-pancakh`文件夹中的所有文件拽入项目中
    * 导入主头文件：`#import "CPCalendarViewController.h"`

## <a id="参考"></a>参考
```objc
* 由于这个框架的用法非常简单，
* CPCalendarViewController * MVC = [[CPCalendarViewController alloc] init];
* [self.navigationController pushViewController:MVC animated:YES];
* 直接就可以使用了，如果要自定义日期的事件的时候，可以在 DownCollectionViewCell 文件中进行编辑。
```


## <a id="提醒"></a>提醒
* 本框架纯ARC，暂时不支持横屏展示,

## <a id="期待"></a>期待
* 如果在使用过程中遇到BUG，希望你能Issues我，谢谢（或者尝试下载最新的框架代码看看BUG修复没有）
* 如果在使用过程中发现功能不够用，希望你能Issues我，我非常想为这个框架增加更多好用的功能，谢谢
* 如果你想为curly-pancake输出代码，请拼命Pull Requests我

