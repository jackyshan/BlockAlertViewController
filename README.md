![](images/block_alert_view.gif)

##步骤

1、初始化

```
BlockAlertView *alertView = [[BlockAlertView alloc] initWithTitle:@"图片" style:AlertStyleSheet];
```

2、添加title和block

```
[alertView addTitle:@"保存" block:^(id result) {
        NSLog(@"保存");
    }];
[alertView addTitle:@"分享到微信" block:^(id result) {
        NSLog(@"分享到微信");
    }];
 [alertView addTitle:@"分享到QQ" block:^(id result) {
        NSLog(@"分享到QQ");
    }];
```

3、showInView

```
[alertView show];
```

4、alertView全局变量以免释放

```
_blockView = alertView;
```