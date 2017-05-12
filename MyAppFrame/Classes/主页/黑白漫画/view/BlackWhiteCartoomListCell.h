//
//  BlackWhiteCartoomListCell.h
//  MyAppFrame
//
//  Created by 陈自奎 on 17/4/10.
//  Copyright © 2017年 Chen, ZiKui. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BlackWhiteCartoonHomeCellModel.h"
#import "BlackWhiteCellIamgesView.h"

@interface BlackWhiteCartoomListCell : UITableViewCell

@property(nonatomic,strong)CustomLabel *title_lb;
@property(nonatomic,strong)CustomLabel *time_lb;
@property(nonatomic,strong)UILabel *line;
@property(nonatomic,strong)BlackWhiteCellIamgesView *images_vi;

-(void)setupCellDataWtihModel:(BlackWhiteCartoonHomeCellModel *)model;

@end
