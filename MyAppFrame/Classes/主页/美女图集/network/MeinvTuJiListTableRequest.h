//
//  MeinvTuJiListTableRequest.h
//  MyAppFrame
//
//  Created by 陈自奎 on 17/4/24.
//  Copyright © 2017年 Chen, ZiKui. All rights reserved.
//

#import "MainBaseNetworkRequest.h"

@interface MeinvTuJiListTableRequest : MainBaseNetworkRequest

@property(nonatomic,strong)NSString *kindid;
@property(nonatomic,strong)NSString *type;
@property(nonatomic,strong)NSString *page;
@property(nonatomic,strong)NSString *rows;
@property(nonatomic,strong)NSMutableArray *datas;

-(void)requestData:(void(^)(BOOL isSucess))block;

@end
