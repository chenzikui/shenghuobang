//
//  BlackWhiteCartoomListCell.m
//  MyAppFrame
//
//  Created by 陈自奎 on 17/4/10.
//  Copyright © 2017年 Chen, ZiKui. All rights reserved.
//

#import "BlackWhiteCartoomListCell.h"

@implementation BlackWhiteCartoomListCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupSubviews];
        self.selectionStyle=UITableViewCellSelectionStyleNone;
    }
    return self;
}

-(void)setupSubviews{
    
    
    self.title_lb=[[CustomLabel alloc]initLabelWithStyle:CustomLabel_StyleValue1];
    self.title_lb.numberOfLines=0;
    [self.contentView addSubview:self.title_lb];
    
    self.time_lb=[[CustomLabel alloc]initLabelWithStyle:CustomLabel_StyleValue2];
    [self.contentView addSubview:self.time_lb];
    
    self.images_vi=[[BlackWhiteCellIamgesView alloc]init];
    [self.contentView addSubview:self.images_vi];
    
    self.line=[UILabel new];
    self.line.backgroundColor=[UIColor groupTableViewBackgroundColor];
    [self.contentView addSubview:self.line];
}

-(void)setupCellDataWtihModel:(BlackWhiteCartoonHomeCellModel *)model{

    self.title_lb.text=model.title;
    self.time_lb.text=model.time;
    [self.images_vi setupViewWithImages:model.images];
    
    self.title_lb.sd_layout.leftSpaceToView(self.contentView,10).topSpaceToView(self.contentView,10).rightSpaceToView(self.contentView,10).autoHeightRatio(0);
    
    self.images_vi.sd_layout.leftSpaceToView(self.contentView,10).topSpaceToView(self.title_lb,10).rightSpaceToView(self.contentView,10).heightIs(80);
    
    self.time_lb.sd_layout.topSpaceToView(self.images_vi,10).leftSpaceToView(self.contentView,10).heightIs(20);
    [self.time_lb setSingleLineAutoResizeWithMaxWidth:300];
    
    self.line.sd_layout.leftSpaceToView(self.contentView,0).rightSpaceToView(self.contentView,0).topSpaceToView(self.time_lb,10).heightIs(0.5);
    
    [self setupAutoHeightWithBottomView:self.line bottomMargin:0];
    
    
}

@end
