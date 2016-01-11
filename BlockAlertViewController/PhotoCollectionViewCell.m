//
//  PhotoCollectionViewCell.m
//  BlockAlertViewController
//
//  Created by jackyshan on 1/11/16.
//  Copyright © 2016 jackyshan. All rights reserved.
//

#import "PhotoCollectionViewCell.h"

@interface PhotoCollectionViewCell() {
    UIImageView *_imgV;
    NSString *_url;
}

@end

@implementation PhotoCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        UIImageView *imgV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 130, 180)];
        [self.contentView addSubview:imgV];
        _imgV = imgV;
    }
    
    return self;
}

- (void)updateWithUrl:(NSString *)url {
    if ([_url isEqualToString:url]) {
        return;
    }
    
    _url = url;
    
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:url]];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        if (connectionError) {
            return;
        }
        
        UIImage *img = [UIImage imageWithData:data];
        [_imgV setImage:img];
    }];
}

@end
