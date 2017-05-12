//
//  HomeViewCellModel.h
//  MyAppFrame
//
//  Created by 陈自奎 on 17/4/7.
//  Copyright © 2017年 Chen, ZiKui. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HomeViewCellModel : NSObject

@property(nonatomic,strong)NSString *image;
@property(nonatomic,strong)NSString *title;
@property(nonatomic,strong)NSString *kindid;
@property(nonatomic,strong)NSString *describe;
@property(nonatomic,strong)NSString *type;
@property(nonatomic,strong)NSString *controller_str;

-(instancetype)initWithDictionary:(NSDictionary *)dic;

@end
