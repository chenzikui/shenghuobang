//
//  MeiNvTuJiImageArrayRequest.h
//  MyAppFrame
//
//  Created by 陈自奎 on 17/5/8.
//  Copyright © 2017年 Chen, ZiKui. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MeiNvTuJiImageArrayRequest : MainBaseNetworkRequest

@property(nonatomic,strong)NSString *kindid;
@property(nonatomic,strong)NSString *mid;
@property(nonatomic,strong)NSMutableArray *datas;

-(void)requestData:(void(^)(BOOL isSucess))block;

@end
