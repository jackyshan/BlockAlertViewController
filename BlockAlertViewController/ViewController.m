//
//  ViewController.m
//  BlockAlertViewController
//
//  Created by apple on 8/23/15.
//  Copyright (c) 2015 jackyshan. All rights reserved.
//

#import "ViewController.h"
#import "BlockAlertView.h"
#import "PhotoCollectionViewCell.h"

@interface ViewController ()<UICollectionViewDataSource, UICollectionViewDelegate> {
    BlockAlertView *_blockView;
    NSArray *_dataArr;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"BlockAlertView";
    
    _dataArr = @[@"http://pic.putaojiayuan.com/uploadfile/tuku/KaTongChaHua/12190515346673.jpg",
                 @"http://img05.tooopen.com/images/20150830/tooopen_sy_140703593676.jpg",
                 @"http://www.qqwind.com/upload/2010/7/31/20107311904131568.jpg",
                 @"http://pic2.sc.chinaz.com/Files/pic/pic9/201601/apic17807_s.jpg",
                 @"http://p2.wmpic.me/article/2015/03/12/1426128451_oYeEMsCo.jpg",
                 @"http://himg2.huanqiu.com/attachment2010/2015/1231/08/25/20151231082548181.jpg",
                 @"http://sc.websbook.com/sc/upimg/allimg/090223/115_1600x1200_websbook_com.jpg",
                 @"http://i2.sinaimg.cn/jc/photo/idx/2014/0612/U1335P27T203D1F5618DT20140612174432.jpg",
                 @"http://2.im.guokr.com/2W1oJ9weYo25lqYW4dwszHEna4ozfjL0Q_Vr2E6LZUR2AgAApAEAAEpQ.jpg",
                 @"http://www.818dxs.com/uploads/allimg/130811/1-130Q1221R0460.jpg"];
    
    UICollectionViewLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:layout];
    collectionView.backgroundColor = [UIColor whiteColor];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    [collectionView registerClass:[PhotoCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    [self.view addSubview:collectionView];
}

- (void)_showAction {
    BlockAlertView *alertView = [[BlockAlertView alloc] initWithTitle:@"图片" style:AlertStyleSheet];
    [alertView addTitle:@"保存" block:^(id result) {
        NSLog(@"保存");
    }];
    [alertView addTitle:@"分享到微信" block:^(id result) {
        NSLog(@"分享到微信");
    }];
    [alertView addTitle:@"分享到QQ" block:^(id result) {
        NSLog(@"分享到QQ");
    }];
    
    [alertView show];
    _blockView = alertView;
}

#pragma mark - UICollectionViewDataSource, UICollectionViewDelegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _dataArr.count;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    PhotoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    [cell updateWithUrl:_dataArr[indexPath.row]];
    
    return cell;
}

#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    
    [self _showAction];
}

- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

#pragma mark - UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(130, 180);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0, 25, 0, 25);
}

@end
