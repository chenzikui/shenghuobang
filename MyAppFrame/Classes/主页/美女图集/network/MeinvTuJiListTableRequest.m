//
//  MeinvTuJiListTableRequest.m
//  MyAppFrame
//
//  Created by 陈自奎 on 17/4/24.
//  Copyright © 2017年 Chen, ZiKui. All rights reserved.
//

#import "MeinvTuJiListTableRequest.h"
#import "MeiNvTuJiListModel.h"

@implementation MeinvTuJiListTableRequest

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
            NSArray *songlist=showapi_res_body[@"data"];
            NSMutableArray *dataArr=[NSMutableArray new];
            for (NSDictionary *dict in songlist) {
                MeiNvTuJiListModel *model=[[MeiNvTuJiListModel alloc]initWithDictionary:dict];
                [dataArr addObject:model];
            }
            self.datas=dataArr;
            
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
    if (!self.kindid) {
        NSLog(@"kindid不对");
        return @"";
    }
    return self.kindid;
}

-(id)value{
    
    return @{@"type":self.type,@"page":self.page,@"rows":self.rows};
}


@end
