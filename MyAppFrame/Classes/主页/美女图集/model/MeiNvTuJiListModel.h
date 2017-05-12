//
//  MeiNvTuJiListModel.h
//  MyAppFrame
//
//  Created by 陈自奎 on 17/4/24.
//  Copyright © 2017年 Chen, ZiKui. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MeiNvTuJiListModel : NSObject

@property(nonatomic,strong)NSString *title;
@property(nonatomic,strong)NSString *images_id;
@property(nonatomic,strong)NSString *time;
@property(nonatomic,strong)NSString *imgurl;
@property(nonatomic,strong)NSArray *image_arr;

-(instancetype)initWithDictionary:(NSDictionary *)dic;

@end
