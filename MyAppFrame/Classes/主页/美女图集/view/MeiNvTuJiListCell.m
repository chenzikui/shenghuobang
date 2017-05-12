//
//  MeiNvTuJiListCell.m
//  MyAppFrame
//
//  Created by 陈自奎 on 17/4/24.
//  Copyright © 2017年 Chen, ZiKui. All rights reserved.
//

#import "MeiNvTuJiListCell.h"


@interface MeiNvTuJiListCell ()

@property(nonatomic,strong)UIImageView *img_vi;
@property(nonatomic,strong)UILabel *title_lb;
@property(nonatomic,strong)UILabel *time_lb;
@property(nonatomic,strong)UIView *image_vis;


@end


@implementation MeiNvTuJiListCell

-(UIImageView *)img_vi{

    if (!_img_vi) {
        _img_vi=[UIImageView new];
//        _img_vi.contentMode=UIViewContentModeScaleToFill;
    }
    return _img_vi;
}
-(UILabel *)title_lb{

    if (!_title_lb) {
        _title_lb=[UILabel new];
    }
    return _title_lb;
}
-(UILabel *)time_lb{

    if (!_time_lb) {
        _time_lb=[UILabel new];
    }
    return _time_lb;
}
-(UIView *)image_vis{

    if (!_image_vis) {
        _image_vis=[[UIView alloc]init];
    }
    return _image_vis;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupMySubviews];
    }
    return self;
}
-(void)setupMySubviews{

    [self.contentView addSubview:self.img_vi];
    
    [self.contentView addSubview:self.title_lb];
    
    [self.contentView addSubview:self.time_lb];
    
    [self.contentView addSubview:self.image_vis];
    
    self.img_vi.sd_layout.leftSpaceToView(self.contentView,15).topSpaceToView(self.contentView,10).heightIs(50).widthIs(50);
    
    self.title_lb.sd_layout.leftSpaceToView(self.img_vi,10).topSpaceToView(self.contentView,10).rightSpaceToView(self.contentView,10).heightIs(25);
    
    self.time_lb.sd_layout.leftSpaceToView(self.img_vi,10).topSpaceToView(self.title_lb,0).rightSpaceToView(self.contentView,10).heightIs(25);
    
    self.image_vis.sd_layout.leftSpaceToView(self.contentView,15).topSpaceToView(self.time_lb,10).rightSpaceToView(self.contentView,15).heightIs(1);
    
}


-(void)setupCellWithData:(MeiNvTuJiListModel *)model{
    
    NSString *url_str=model.imgurl?[model.imgurl componentsSeparatedByString:@"?image"][0]:@"";
    [self.img_vi sd_setImageWithURL:[NSURL URLWithString:url_str] placeholderImage:PlaceholderImage];
    self.title_lb.text=model.title;
    self.time_lb.text=model.time;
    for(UIView *view in [self.image_vis subviews])
    {
        [view removeFromSuperview];
    }
    if (model.image_arr) {

        HZImagesGroupView *hz_imge=[[HZImagesGroupView alloc]init];
        NSMutableArray *image_models=[NSMutableArray new];
        for (NSString *image_str in model.image_arr) {
            HZPhotoItemModel *item=[[HZPhotoItemModel alloc]init];
            item.thumbnail_pic=image_str;
            [image_models addObject:item];
        }
        hz_imge.photoItemArray=image_models;
        [self.image_vis addSubview:hz_imge];
        
        [self.image_vis sd_resetLayout];
         self.image_vis.sd_layout.leftSpaceToView(self.contentView,15).topSpaceToView(self.time_lb,10).rightSpaceToView(self.contentView,15).heightIs(hz_imge.height);
    }else{
        [self.image_vis sd_resetLayout];
        self.image_vis.sd_layout.leftSpaceToView(self.contentView,15).topSpaceToView(self.time_lb,10).rightSpaceToView(self.contentView,15).heightIs(1);
    }
    
    [self setupAutoHeightWithBottomView:self.image_vis bottomMargin:0];

}


@end
