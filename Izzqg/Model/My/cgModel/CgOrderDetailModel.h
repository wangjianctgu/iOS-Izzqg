//
//  CgOrderDetailModel.h
//  Ixyb
//
//  Created by wang on 2018/1/3.
//  Copyright © 2018年 xyb. All rights reserved.
//

#import "ResponseModel.h"

@protocol CGDepOrderDetailListModel

@end

@interface CGDepOrderDetailListModel : JSONModel

@property(nonatomic,copy)NSString<Optional> *gatherId;     //集合ID
@property(nonatomic,copy)NSString<Optional> *orderAmount;  //投资金额
@property(nonatomic,copy)NSString<Optional> *lockMonths;   //锁定期限-月
@property(nonatomic,copy)NSString<Optional> *lockDays;     //锁定期限-天
@property(nonatomic,copy)NSString<Optional> *loanMonths;   //集合期限-月
@property(nonatomic,copy)NSString<Optional> *loanDays;     //集合期限-天
@property(nonatomic,copy)NSString<Optional> *orderDate;    //投资时间
@property(nonatomic,copy)NSString<Optional> *orderId;      //订单id
@property(nonatomic,copy)NSString<Optional> *orderState;   //订单状态，0 匹配中，2 已匹配，4 转让中
@property(nonatomic,copy)NSString<Optional> *restDay;      //剩余天数
@property(nonatomic,copy)NSString<Optional> *gatherName;   //集合名称
@property(nonatomic,copy)NSString<Optional> *rate;         //集合年化
@property(nonatomic,copy)NSString<Optional> *pendingInterest; //待计息
@property(nonatomic,copy)NSString<Optional> *payInterest;     //已计息
@property(nonatomic,copy)NSString<Optional> *refundedAmount;  //已回款金额
@property(nonatomic,copy)NSString<Optional> *refundingAmount; //待回款金额
@property(nonatomic,copy)NSString<Optional> *progress;        //回款进度
@property(nonatomic,copy)NSString<Optional> *unAssignAmount;  //待转让
@property(nonatomic,copy)NSString<Optional> *assignedAmount;  //已转让
@property(nonatomic,copy)NSString<Optional> *applyAssignDate;  //申请转让时间
@property(nonatomic,copy)NSString<Optional> *assignAmount;     //申请转让金额
@property(nonatomic,copy)NSString<Optional> *refundedNum;      //已回期数
@property(nonatomic,copy)NSString<Optional> *totalRefundNum;   //总期数
@property(nonatomic,copy)NSString<Optional> *assignId;        //转让ID
@property(nonatomic,copy)NSString<Optional> *currDate;        //当前时间
@property(nonatomic,copy)NSString<Optional> *startAssignDate; //开始转让时间

@property(nonatomic,copy)NSString<Optional> *orderNo;           //理财订单id

@end

@interface CgOrderDetailModel : ResponseModel

@property(nonatomic,strong)CGDepOrderDetailListModel * orderDetail;

@end
