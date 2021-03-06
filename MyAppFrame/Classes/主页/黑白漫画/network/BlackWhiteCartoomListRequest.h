//
//  BlackWhiteCartoomListRequest.h
//  MyAppFrame
//
//  Created by 陈自奎 on 17/4/10.
//  Copyright © 2017年 Chen, ZiKui. All rights reserved.
//

#import "MainBaseNetworkRequest.h"
#import "BlackWhiteCartoonHomeCellModel.h"

@interface BlackWhiteCartoomListRequest : MainBaseNetworkRequest

@property(nonatomic,strong)NSString *kindid;
@property(nonatomic,strong)NSString *type;
@property(nonatomic,strong)NSString *page;
@property(nonatomic,strong)NSMutableArray *datas;

-(void)requestData:(void(^)(BOOL isSucess))block;

@end
