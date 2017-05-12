//
//  MeiNvTuJiImageArrayRequest.m
//  MyAppFrame
//
//  Created by 陈自奎 on 17/5/8.
//  Copyright © 2017年 Chen, ZiKui. All rights reserved.
//

#import "MeiNvTuJiImageArrayRequest.h"

@implementation MeiNvTuJiImageArrayRequest


-(NSMutableArray *)datas{
    
    if (!_datas) {
        _datas=[NSMutableArray new];
    }
    return _datas;
}

-(void)requestData:(void (^)(BOOL))block{
    [self postDataSuccess:^(MainBaseNetworkRequest *DAO, id data) {
        
        NSDictionary *dic=data;
        NSLog(@"%@",dic);
        
        if ([dic[@"showapi_res_code"] integerValue]==0) {
            //
            NSDictionary *showapi_res_body=dic[@"showapi_res_body"];
            NSArray *pic_list=showapi_res_body[@"data"];
            if (pic_list) {
                [self.datas removeAllObjects];
                [self.datas addObjectsFromArray:pic_list];
            }
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

    return @"1208-3";
}

-(id)value{
    
    return @{@"id":self.mid};
}

@end
