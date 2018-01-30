//
//  NPListTableViewCell.m
//  Ixyb
//
//  Created by wang on 2017/12/13.
//  Copyright © 2017年 xyb. All rights reserved.
//

#import "NPListTableViewCell.h"

@interface NPListTableViewCell () {
    
    UILabel *titleLab;     //产品名称
    UILabel *investCountLab;//剩余可投次数
    UILabel *activityLab;  //活动Lab
    UILabel *addProfitLab; //加息Lab
    UILabel *rateLab;
    UILabel *addLab; //加息多少
    
    UILabel *durationLab;  //出借期限
    UILabel *repaymentLab; //还款方式
    UILabel *remainLab;    //剩余金额
}

@property (nonatomic, strong) ColorButton *investButton;//出借
@property (nonatomic, strong) XYButton *button;//扩大点击事件

@end

@implementation NPListTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
 
        self.backgroundColor = COLOR_COMMON_CLEAR;
        [self createMainUI];
    }
    return self;
}

- (void)createMainUI {
    
    _backImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    _backImageView.image = [UIImage imageNamed:@"cellBackImg"];
    _backImageView.userInteractionEnabled = YES;
    [self addSubview:_backImageView];
    
    [_backImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(Margin_Length - 7);
        make.left.equalTo(self.contentView).offset(11);
        make.width.equalTo(@(MainScreenWidth - 22));
    }];
    
    _button = [[XYButton alloc] initWithGeneralBtnTitle:nil titleColor:nil isUserInteractionEnabled:YES];
    [_button setBackgroundImage:[ColorUtil imageWithColor:COLOR_COMMON_CLEAR] forState:UIControlStateNormal];
    [_button addTarget:self action:@selector(clickinvestButton:) forControlEvents:UIControlEventTouchUpInside];
    [_backImageView addSubview:_button];
    
    [_button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_backImageView.mas_top).offset(1);
        make.bottom.equalTo(_backImageView.mas_bottom).offset(-5);
        make.left.equalTo(_backImageView.mas_left).offset(4);
        make.right.equalTo(_backImageView.mas_right).offset(-4);
    }];
    
    titleLab = [[UILabel alloc] initWithFrame:CGRectZero];
    titleLab.font = TEXT_FONT_16;
    titleLab.textColor = COLOR_MAIN_GREY;
    titleLab.textAlignment = NSTextAlignmentLeft;
    titleLab.lineBreakMode = NSLineBreakByTruncatingTail;
    titleLab.text = XYBString(@"str_common_grxfd", @"个人消费贷集合");
    [_backImageView addSubview:titleLab];
    
    [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_backImageView).offset(19);
        make.top.equalTo(_backImageView).offset(Margin_Length + 7);
        make.height.equalTo(@(17));
    }];
    
    investCountLab = [[UILabel alloc] initWithFrame:CGRectZero];
    investCountLab.font = TEXT_FONT_12;
    investCountLab.textColor = COLOR_ORANGE;
    investCountLab.text = @"0个月";
    [_backImageView addSubview:investCountLab];
    
    [investCountLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(titleLab.mas_right).offset(6);
        make.centerY.equalTo(titleLab.mas_centerY);
        make.width.equalTo(@100);
        make.height.equalTo(@(18));
    }];
    
    activityLab = [[UILabel alloc] initWithFrame:CGRectZero];
    activityLab.backgroundColor = COLOR_ORANGE_BACKGROUND;
    activityLab.font = TEXT_FONT_12;
    activityLab.textColor = COLOR_ORANGE;
    activityLab.layer.borderColor = COLOR_ORANGE_BORDER.CGColor;
    activityLab.layer.borderWidth = Border_Width;
    activityLab.layer.cornerRadius = Corner_Radius_9;
    activityLab.clipsToBounds = YES;
    activityLab.textAlignment = NSTextAlignmentCenter;
    activityLab.text = XYBString(@"str_financing_activity", @"活动");
    activityLab.hidden = YES;
    [_backImageView addSubview:activityLab];
    
    [activityLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(investCountLab.mas_right).offset(8);
        make.centerY.equalTo(titleLab.mas_centerY);
        make.width.equalTo(@45);
        make.height.equalTo(@(18));
    }];
    
    addProfitLab = [[UILabel alloc] initWithFrame:CGRectZero];
    addProfitLab.backgroundColor = COLOR_ORANGE_BACKGROUND;
    addProfitLab.font = TEXT_FONT_12;
    addProfitLab.textColor = COLOR_ORANGE;
    addProfitLab.layer.borderColor = COLOR_ORANGE_BORDER.CGColor;
    addProfitLab.layer.borderWidth = Border_Width;
    addProfitLab.layer.cornerRadius = Corner_Radius_9;
    addProfitLab.clipsToBounds = YES;
    addProfitLab.textAlignment = NSTextAlignmentCenter;
    addProfitLab.text = XYBString(@"str_financing_addProfit", @"加息");
    addProfitLab.hidden = YES;
    [_backImageView addSubview:addProfitLab];
    
    [addProfitLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(activityLab.mas_right).offset(8);
        make.centerY.equalTo(titleLab.mas_centerY);
        make.width.equalTo(@45);
        make.height.equalTo(@(18));
    }];
    
    //backView将rateLab、addLab和showLab包裹起来
    UIView *backView = [[UIView alloc] initWithFrame:CGRectZero];
    backView.backgroundColor = COLOR_COMMON_CLEAR;
    backView.userInteractionEnabled = NO;
    [_backImageView addSubview:backView];
    
    [backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_backImageView).offset(19);
        make.top.equalTo(titleLab.mas_bottom).offset(Margin_Length);
        make.width.equalTo(@(MainScreenWidth / 2));
        make.bottom.equalTo(_backImageView.mas_bottom).offset(-52);
    }];
    
    rateLab = [[UILabel alloc] initWithFrame:CGRectZero];
    NSMutableAttributedString *mutAttStr = [Utility rateAttributedStr:0 size:40 sizeSymble:18 color:COLOR_MAIN_GREY];
    rateLab.attributedText = mutAttStr;
    [backView addSubview:rateLab];
    
    [rateLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(backView.mas_left).offset(0);
        make.top.equalTo(@(0));
        make.height.equalTo(@(40));
    }];
    
    addLab = [[UILabel alloc] initWithFrame:CGRectZero];
    addLab.backgroundColor = COLOR_BG;
    addLab.font = TEXT_FONT_12;
    addLab.textColor = COLOR_MAIN_GREY;
    addLab.layer.borderColor = COLOR_LINE.CGColor;
    addLab.layer.borderWidth = Border_Width;
    addLab.layer.borderWidth = Border_Width;
    addLab.layer.cornerRadius = Corner_Radius_9;
    addLab.clipsToBounds = YES;
    addLab.textAlignment = NSTextAlignmentCenter;
    addLab.text = XYBString(@"str_financing_addZeroPercent", @"+0%");
    addLab.hidden = YES;
    [backView addSubview:addLab];
    
    [addLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(rateLab.mas_right).offset(8);
        make.bottom.equalTo(rateLab.mas_bottom).offset(-5);
        make.height.equalTo(@(19));
        make.width.equalTo(@(36));
    }];
    
    UILabel *showLab = [[UILabel alloc] initWithFrame:CGRectZero];
    showLab.font = TEXT_FONT_12;
    showLab.textColor = COLOR_LIGHT_GREY;
    showLab.text = XYBString(@"str_financing_zhydexpectedAnnualizedProfit", @"综合约定年化利率");
    [backView addSubview:showLab];
    
    [showLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(rateLab.mas_left).offset(0);
        make.top.equalTo(rateLab.mas_bottom).offset(4);
        make.bottom.equalTo(backView.mas_bottom);
        make.right.equalTo(backView.mas_right);
    }];
    
    //出借按钮
    _investButton = [[ColorButton alloc] initWithFrame:CGRectMake(0, 0, 90.f, 40.f) Title:XYBString(@"str_common_yjcj", @"一键出借") ByGradientType:leftToRight];
    [_investButton addTarget:self action:@selector(clickinvestButton:) forControlEvents:UIControlEventTouchUpInside];
    [_backImageView addSubview:_investButton];
    
    [_investButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_backImageView.mas_right).offset(-19);
        make.top.equalTo(_backImageView.mas_top).offset(57);
        make.width.equalTo(@(90));
        make.height.equalTo(@(40));
    }];
    
    //画线
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectZero];
    lineView.backgroundColor = COLOR_LINE;
    [_backImageView addSubview:lineView];
    
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(showLab.mas_bottom).offset(7);
        make.left.equalTo(_backImageView.mas_left).offset(19);
        make.height.equalTo(@(Line_Height));
        make.right.equalTo(_backImageView.mas_right).offset(-19);
    }];
    
    //出借期限
    durationLab = [[UILabel alloc] initWithFrame:CGRectZero];
    durationLab.font = TEXT_FONT_14;
    durationLab.textColor = COLOR_MAIN_GREY;
    durationLab.text = XYBString(@"str_financing_12Months", @"12个月");
    [_backImageView addSubview:durationLab];
    
    [durationLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_backImageView.mas_left).offset(19);
        make.top.equalTo(lineView.mas_bottom).offset(12);
        make.bottom.equalTo(_backImageView.mas_bottom).offset(-19);
    }];
    
    //竖线
    UIView *verticalLine = [[UIView alloc] initWithFrame:CGRectZero];
    verticalLine.backgroundColor = COLOR_LINE;
    [_backImageView addSubview:verticalLine];
    
    [verticalLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(durationLab.mas_right).offset(8);
        make.width.equalTo(@(Line_Height));
        make.centerY.equalTo(durationLab.mas_centerY);
        make.height.equalTo(@(14));
    }];
    
    //还款方式
    repaymentLab = [[UILabel alloc] initWithFrame:CGRectZero];
    repaymentLab.font = TEXT_FONT_14;
    repaymentLab.textColor = COLOR_AUXILIARY_GREY;
    repaymentLab.text = XYBString(@"str_financing_deexpireBackProfitAndInvestMoney", @"等额本息");
    [_backImageView addSubview:repaymentLab];
    
    [repaymentLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(verticalLine.mas_right).offset(8);
        make.centerY.equalTo(durationLab);
    }];
    
    remainLab = [[UILabel alloc] initWithFrame:CGRectZero];
    remainLab.font = TEXT_FONT_14;
    remainLab.textColor = COLOR_AUXILIARY_GREY;
    remainLab.text = XYBString(@"str_financing_remainZeroYuan", @"剩余0.00元");
    [_backImageView addSubview:remainLab];
    
    [remainLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_backImageView.mas_right).offset(-19);
        make.centerY.equalTo(durationLab);
    }];
}

- (void)clickinvestButton:(id)sender {
    if (self.block) {
        self.block();
    }
}

- (void)setInfo:(NProductModel *)info {
    
    _info = info;
    
    //产品名称
    titleLab.text = _info.name;
    
    NSString *loanTime;
    if ([_info.loanMonths intValue] > 0 && [_info.loanDays intValue] > 0) {
        loanTime = [NSString stringWithFormat:@"%@个月%@天",_info.loanMonths,_info.loanDays];
    }else{
        
        if ([_info.loanMonths intValue] > 0 && [_info.loanDays intValue] <= 0) {
            loanTime = [NSString stringWithFormat:@"%@个月", _info.loanMonths];
        }else if ([_info.loanDays intValue] > 0 && [_info.loanMonths intValue] <= 0) {
            loanTime = [NSString stringWithFormat:@"%@天", _info.loanDays];
        }else{
            loanTime = [NSString stringWithFormat:@"%@天", _info.loanDays];
        }
    }
    
    //出借期限
    investCountLab.text = loanTime;
    
    //利率
    NSMutableAttributedString *mutStr = [Utility rateAttributedStr:[_info.rate doubleValue] size:40 sizeSymble:18 color:COLOR_MAIN_GREY];
    rateLab.attributedText = mutStr;
    
    //锁定期
    NSString *lockTime;//锁定期字符串
    if ([_info.lockMonths intValue] > 0) {
        lockTime = [NSString stringWithFormat:@"锁定期%@个月", _info.lockMonths];
    } else {
        lockTime = [NSString stringWithFormat:@"锁定期%@天", _info.lockMonths];
    }
    durationLab.text = lockTime;
    
    //还款方式
    repaymentLab.text = [NSString stringWithFormat:@"%@", _info.repayTypeStr];
    
    //剩余金额
    if ([_info.restAmount doubleValue] <= 0) {
        remainLab.text = XYBString(@"str_financing_remainZeroYuan", @"剩余0.00元");
        _investButton.isColorEnabled = NO;
        [_investButton setTitle:XYBString(@"str_financing_soldOut", @"售罄") forState:UIControlStateNormal];
        
    } else {
        remainLab.text = [NSString stringWithFormat:XYBString(@"str_financing_bidRemain", @"剩余%@元"), [Utility replaceTheNumberForNSNumberFormatter:_info.restAmount]];
        _investButton.isColorEnabled = YES;
        [_investButton setTitle:XYBString(@"str_common_yjcj", @"一键出借") forState:UIControlStateNormal];
    }
}

- (void)setIsFirstCell:(BOOL)isFirstCell {
    if (!isFirstCell) {
        [_backImageView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView.mas_top).offset(1);
        }];
    }
}

//计算文字的宽度
- (CGFloat)calculateWidthWithString:(NSString *)str MaxSize:(CGSize)maxSize AndFont:(CGFloat)font LineSpace:(CGFloat)lineSpace{
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = lineSpace; // 字体的行间距
    
    CGSize size = [str boundingRectWithSize:maxSize options:NSStringDrawingTruncatesLastVisibleLine |
                   NSStringDrawingUsesLineFragmentOrigin |
                   NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:font],NSParagraphStyleAttributeName:paragraphStyle} context:nil].size;
    
    return size.width;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
