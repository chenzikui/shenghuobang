//
//  MeiNvTuJiTableViewController.h
//  MyAppFrame
//
//  Created by 陈自奎 on 17/4/24.
//  Copyright © 2017年 Chen, ZiKui. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeViewCellModel.h"

@interface MeiNvTuJiTableViewController : UITableViewController

@property(nonatomic,strong)HomeViewCellModel *model;

-(void)setupModel:(HomeViewCellModel *)model;

@end
