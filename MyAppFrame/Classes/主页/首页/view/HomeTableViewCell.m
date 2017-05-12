//
//  HomeTableViewCell.m
//  MyAppFrame
//
//  Created by 陈自奎 on 17/4/7.
//  Copyright © 2017年 Chen, ZiKui. All rights reserved.
//

#import "HomeTableViewCell.h"

@implementation HomeTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupSubviews];
    }
    return self;
}
-(void)setupSubviews{

    self.kindImage=[[UIImageView alloc]init];
    [self.contentView addSubview:self.kindImage];
    
    self.title_lb=[[CustomLabel alloc]initLabelWithStyle:CustomLabel_StyleValue1];
    [self.contentView addSubview:self.title_lb];
    
    self.describe_lb=[[CustomLabel alloc]initLabelWithStyle:CustomLabel_StyleValue2];
    self.describe_lb.numberOfLines=0;
    [self.contentView addSubview:self.describe_lb];
    
    self.line=[UILabel new];
    self.line.backgroundColor=[UIColor groupTableViewBackgroundColor];
    [self.contentView addSubview:self.line];
}

-(void)setupCellDataWithModel:(HomeViewCellModel *)model{

    [self.kindImage setImage:[UIImage imageNamed:model.image]];
    self.title_lb.text=model.title;
    self.describe_lb.text=model.describe;
    
    self.kindImage.sd_layout.leftSpaceToView(self.contentView,10).topSpaceToView(self.contentView,10).heightIs(80).widthIs(80);
    
    self.title_lb.sd_layout.leftSpaceToView(self.kindImage,10).topEqualToView(self.kindImage).rightSpaceToView(self.contentView,10).heightIs(30);
    
    self.describe_lb.sd_layout.leftSpaceToView(self.kindImage,10).topSpaceToView(self.title_lb,5).rightSpaceToView(self.contentView,10).autoHeightRatio(0);
    
    self.line.sd_layout.leftSpaceToView(self.contentView,0).rightSpaceToView(self.contentView,0).topSpaceToView(self.describe_lb,10).heightIs(0.5);
    
    [self setupAutoHeightWithBottomView:self.line bottomMargin:0];
}




@end
