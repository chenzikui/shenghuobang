//
//  BlackWhiteCellIamgesView.m
//  MyAppFrame
//
//  Created by 陈自奎 on 17/4/10.
//  Copyright © 2017年 Chen, ZiKui. All rights reserved.
//

#import "BlackWhiteCellIamgesView.h"

@implementation BlackWhiteCellIamgesView

-(void)setupViewWithImages:(NSArray *)images{

    for (int i=0;i<images.count;i++) {
        
        UIImageView *image_vi=[[UIImageView alloc]init];
        [image_vi sd_setImageWithURL:[NSURL URLWithString:images[i]] placeholderImage:PlaceholderImage];
        [self addSubview:image_vi];
        CGFloat v_x=i*(10+80);
        image_vi.sd_layout.leftSpaceToView(self,v_x).topSpaceToView(self,0).heightIs(80).widthIs(80);
    }
}

@end
