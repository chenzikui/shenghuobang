//
//  BlackWhiteCartoonHomeCellModel.h
//  MyAppFrame
//
//  Created by 陈自奎 on 17/4/10.
//  Copyright © 2017年 Chen, ZiKui. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BlackWhiteCartoonHomeCellModel : NSObject

@property(nonatomic,strong)NSArray *images;
@property(nonatomic,strong)NSString *title;
@property(nonatomic,strong)NSString *kindid;
@property(nonatomic,strong)NSString *time;
@property(nonatomic,strong)NSString *link;

-(instancetype)initWithDictionary:(NSDictionary *)dic;

@end
