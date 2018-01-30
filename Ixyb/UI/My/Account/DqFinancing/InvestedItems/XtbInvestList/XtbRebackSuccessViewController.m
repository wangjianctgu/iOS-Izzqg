//
//  XtbRebackSuccessViewController.m
//  Ixyb
//
//  Created by wang on 2017/9/18.
//  Copyright © 2017年 xyb. All rights reserved.
//

#import "XtbRebackSuccessViewController.h"
#import "Utility.h"

@interface XtbRebackSuccessViewController ()

@end

@implementation XtbRebackSuccessViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
}

- (void)initUI {
  
    
    self.navItem.title = XYBString(@"str_Xtb_ApplyZr", @"申请转让");
    self.navItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"back"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(clickBackBtn:)];
    
    self.view.backgroundColor = COLOR_BG;
    
    UIView * contentView = [[UIView alloc] init];
    contentView.backgroundColor = COLOR_COMMON_WHITE;
    [self.view addSubview:contentView];
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.right.equalTo(self.view);
        make.height.equalTo(@(160));
        make.top.equalTo(self.navBar.mas_bottom).offset(10);
        
    }];
    
    UIImageView * iconImageView = [[UIImageView alloc] init];
    iconImageView.image = [UIImage imageNamed:@"redeemsuccess"];
    [contentView addSubview:iconImageView];
    [iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(contentView.mas_centerX);
        make.top.equalTo(contentView.mas_top).offset(29);
    }];
    
    UILabel * titleLab = [[UILabel alloc] init];
    titleLab.font = FONT_TEXT_20;
    titleLab.textColor = COLOR_CHU_ORANGE;
    
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:XYBString(@"str_Xtb_ApplyZrMoney", @"申请转让%@元"),self.moneyStr]];
    [attributedStr addAttribute:NSForegroundColorAttributeName value:COLOR_TITLE_GREY range:NSMakeRange(0, 4)];
    titleLab.attributedText = attributedStr;
    [contentView addSubview:titleLab];
    [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(iconImageView.mas_bottom).offset(21.f);
        make.centerX.equalTo(contentView.mas_centerX);
    }];
    

    ColorButton * completeButton = [[ColorButton alloc]initWithFrame:CGRectMake(0, 0, MainScreenWidth - 30, Cell_Height) Title:XYBString(@"str_common_complete", @"完成")  ByGradientType:leftToRight];
    [completeButton addTarget:self action:@selector(clickCompleteButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:completeButton];
    
    [completeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(Margin_Left));
        make.right.equalTo(@(-Margin_Right));
        make.height.equalTo(@(Cell_Height));
        make.top.equalTo(contentView.mas_bottom).offset(20);
    }];
}

-(void)clickBackBtn:(id)sender
{
    NSArray *VCArray = self.navigationController.viewControllers;
    [self.navigationController popToViewController:[VCArray objectAtIndex:VCArray.count - 4] animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

-(void)clickCompleteButton:(id)sender
{
    NSArray *VCArray = self.navigationController.viewControllers;
    [self.navigationController popToViewController:[VCArray objectAtIndex:VCArray.count - 4] animated:YES];
}



@end
