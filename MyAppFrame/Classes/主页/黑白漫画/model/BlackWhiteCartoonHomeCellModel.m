//
//  BlackWhiteCartoonHomeCellModel.m
//  MyAppFrame
//
//  Created by 陈自奎 on 17/4/10.
//  Copyright © 2017年 Chen, ZiKui. All rights reserved.
//

#import "BlackWhiteCartoonHomeCellModel.h"

@implementation BlackWhiteCartoonHomeCellModel


-(instancetype)initWithDictionary:(NSDictionary *)dic{
    
    self=[super init];
    if (self) {
        [self setupModelWithDic:dic];
    }
    return self;
}

-(void)setupModelWithDic:(NSDictionary *)dic{
    
    self.images=[dic EncodeArrayFromDicWithKey:@"thumbnailList"];
    self.title=[dic EncodeStringFromDicWithKey:@"title"];
    self.kindid=[dic EncodeStringFromDicWithKey:@"id"];
    self.time=[dic EncodeStringFromDicWithKey:@"time"];
    self.link=[dic EncodeStringFromDicWithKey:@"link"];
}

@end
