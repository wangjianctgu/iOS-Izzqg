//
//  XtbTableViewCell.h
//  Ixyb
//
//  Created by wang on 15/8/27.
//  Copyright (c) 2015年 xyb. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "BidProduct.h"
#import "XYUIKit.h" //XYB公共控件
#import "Utility.h"

typedef void(^investBlock)();

@interface XtbTableViewCell : XYTableViewCell

@property (nonatomic, strong) ColorButton *investButton;//出借
@property (nonatomic, strong) XYButton *button;//扩大点击事件
@property (nonatomic,copy) investBlock block;//investButton和button点击时，开始回调
@property (nonatomic, strong) BidProduct *info;
@property (nonatomic, strong) UIImageView *backImageView;



@end