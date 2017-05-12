//
//  HomeViewCellModel.m
//  MyAppFrame
//
//  Created by 陈自奎 on 17/4/7.
//  Copyright © 2017年 Chen, ZiKui. All rights reserved.
//

#import "HomeViewCellModel.h"

@implementation HomeViewCellModel

-(instancetype)initWithDictionary:(NSDictionary *)dic{

    self=[super init];
    if (self) {
        [self setupModelWithDic:dic];
    }
    return self;
}

-(void)setupModelWithDic:(NSDictionary *)dic{

    self.image=[dic EncodeStringFromDicWithKey:@"image"];
    self.title=[dic EncodeStringFromDicWithKey:@"title"];
    self.kindid=[dic EncodeStringFromDicWithKey:@"kindid"];
    self.describe=[dic EncodeStringFromDicWithKey:@"describe"];
    self.type=[dic EncodeStringFromDicWithKey:@"type"];
    self.controller_str=[dic EncodeStringFromDicWithKey:@"controller_str"];
}


@end
