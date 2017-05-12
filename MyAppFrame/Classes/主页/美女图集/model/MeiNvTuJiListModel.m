//
//  MeiNvTuJiListModel.m
//  MyAppFrame
//
//  Created by 陈自奎 on 17/4/24.
//  Copyright © 2017年 Chen, ZiKui. All rights reserved.
//

#import "MeiNvTuJiListModel.h"

@implementation MeiNvTuJiListModel

-(instancetype)initWithDictionary:(NSDictionary *)dic{
    
    self=[super init];
    if (self) {
        [self setupModelWithDic:dic];
    }
    return self;
}

-(void)setupModelWithDic:(NSDictionary *)dic{
    
    self.title=[dic EncodeStringFromDicWithKey:@"title"];
    self.images_id=[dic EncodeStringFromDicWithKey:@"id"];
    self.time=[dic EncodeStringFromDicWithKey:@"ctime"];
    self.imgurl=[dic EncodeStringFromDicWithKey:@"imgurl"];
}

@end
