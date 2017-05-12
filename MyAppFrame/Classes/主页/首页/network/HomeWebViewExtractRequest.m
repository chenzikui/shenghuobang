//
//  HomeWebViewExtractRequest.m
//  MyAppFrame
//
//  Created by 陈自奎 on 17/4/10.
//  Copyright © 2017年 Chen, ZiKui. All rights reserved.
//

#import "HomeWebViewExtractRequest.h"

@implementation HomeWebViewExtractRequest


-(void)requestData:(void (^)(BOOL))block{
    [self postDataSuccess:^(MainBaseNetworkRequest *DAO, id data) {
        
        NSDictionary *dic=data;
        NSLog(@"%@",dic);
        
        if ([dic[@"showapi_res_code"] integerValue]==0) {
            //
            NSDictionary *showapi_res_body=dic[@"showapi_res_body"];
            self.html_str=[showapi_res_body EncodeStringFromDicWithKey:@"html"];
            
            block(YES);
        }else{
            
            block(NO);
        }
        
    } failure:^(MainBaseNetworkRequest *DAO, NSError *error) {
        
        NSLog(@"%@",error);
        block(NO);
    }];
    
}



-(NSString *)interfaceName{

    return @"883-1";
}

-(id)value{
    
    return @{@"url":self.url_link};
}
@end
