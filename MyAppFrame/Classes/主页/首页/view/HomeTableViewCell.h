//
//  HomeTableViewCell.h
//  MyAppFrame
//
//  Created by 陈自奎 on 17/4/7.
//  Copyright © 2017年 Chen, ZiKui. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeViewCellModel.h"
#import "BlackWhiteCartoonHomeCellModel.h"

@interface HomeTableViewCell : UITableViewCell
@property(nonatomic,strong)UIImageView *kindImage;
@property(nonatomic,strong)CustomLabel *title_lb;
@property(nonatomic,strong)CustomLabel *describe_lb;
@property(nonatomic,strong)UILabel *line;

-(void)setupCellDataWithModel:(HomeViewCellModel *)model;

@end
