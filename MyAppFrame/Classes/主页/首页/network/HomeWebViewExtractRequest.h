//
//  HomeWebViewExtractRequest.h
//  MyAppFrame
//
//  Created by 陈自奎 on 17/4/10.
//  Copyright © 2017年 Chen, ZiKui. All rights reserved.
//

#import "MainBaseNetworkRequest.h"

@interface HomeWebViewExtractRequest : MainBaseNetworkRequest

@property(nonatomic,strong)NSString *url_link;
@property(nonatomic,strong)NSString *html_str;

-(void)requestData:(void(^)(BOOL isSucess))block;

@end
