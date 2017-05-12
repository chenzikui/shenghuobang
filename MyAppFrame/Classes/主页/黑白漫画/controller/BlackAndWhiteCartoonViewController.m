//
//  BlackAndWhiteCartoonViewController.m
//  MyAppFrame
//
//  Created by 陈自奎 on 17/4/10.
//  Copyright © 2017年 Chen, ZiKui. All rights reserved.
//

#import "BlackAndWhiteCartoonViewController.h"
#import "HomeTableViewCell.h"
#import "BlackWhiteListTableViewController.h"

static NSString * const reuseIdentifier = @"cartoonCell";

@interface BlackAndWhiteCartoonViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)NSMutableArray *datas;
@property(nonatomic,strong)UITableView *tableView;

@end

@implementation BlackAndWhiteCartoonViewController
-(NSMutableArray *)datas{
    
    if (!_datas) {
        _datas=[NSMutableArray new];
    }
    return _datas;
}

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView=[[UITableView alloc]init];
        _tableView.delegate=self;
        _tableView.dataSource=self;
        _tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
        _tableView.showsVerticalScrollIndicator=NO;
        
    }
    return _tableView;
}

-(void)setupModel:(HomeViewCellModel *)model{
    self.model=model;
    self.title=model.title;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout=UIRectEdgeNone;
    
    NSMutableArray *dataArr=@[
                              @{@"image":@"恐怖漫画",@"title":@"恐怖漫画",@"kindid":@"958-1",@"describe":@"恐怖漫画describe",@"kindid":@"958-1",@"type":@"/category/weimanhua/kbmh"},
                              @{@"image":@"故事漫画",@"title":@"故事title",@"kindid":@"958-1",@"describe":@"故事漫画describe",@"kindid":@"958-1",@"type":@"/category/weimanhua/gushimanhua"},
                              @{@"image":@"段子手",@"title":@"段子手title",@"kindid":@"958-1",@"describe":@"段子手describe",@"kindid":@"958-1",@"type":@"/category/duanzishou"},
                              @{@"image":@"冷知识",@"title":@"冷知识title",@"kindid":@"958-1",@"describe":@"冷知识describe",@"kindid":@"958-1",@"type":@"/category/lengzhishi"},
                              @{@"image":@"奇趣",@"title":@"奇趣title",@"kindid":@"958-1",@"describe":@"奇趣describe",@"kindid":@"958-1",@"type":@"/category/qiqu"},
                              @{@"image":@"电影",@"title":@"电影title",@"kindid":@"958-1",@"describe":@"电影describe",@"kindid":@"958-1",@"type":@"/category/dianying"},
                              @{@"image":@"搞笑",@"title":@"搞笑title",@"kindid":@"958-1",@"describe":@"搞笑",@"kindid":@"958-1",@"type":@"/category/gaoxiao"},
                              @{@"image":@"萌宠",@"title":@"萌宠title",@"kindid":@"958-1",@"describe":@"萌宠describe",@"kindid":@"958-1",@"type":@"/category/mengchong"},
                              @{@"image":@"新奇",@"title":@"新奇title",@"kindid":@"958-1",@"describe":@"新奇describe",@"kindid":@"958-1",@"type":@"/category/xinqi"},
                              @{@"image":@"环球",@"title":@"环球title",@"kindid":@"958-1",@"describe":@"环球describe",@"kindid":@"958-1",@"type":@"/category/huanqiu"},
                              @{@"image":@"摄影",@"title":@"摄影title",@"kindid":@"958-1",@"describe":@"摄影describe",@"kindid":@"958-1",@"type":@"/category/sheying"},
                              @{@"image":@"玩艺",@"title":@"玩艺title",@"kindid":@"958-1",@"describe":@"玩艺describe",@"kindid":@"958-1",@"type":@"/category/wanyi"},
                              @{@"image":@"插画",@"title":@"插画title",@"kindid":@"958-1",@"describe":@"插画describe",@"kindid":@"958-1",@"type":@"/category/chahua"}
                              ].mutableCopy;
    for (NSDictionary *dic in dataArr) {
        HomeViewCellModel *model=[[HomeViewCellModel alloc]initWithDictionary:dic];
        [self.datas addObject:model];
    }
    
    [self.view addSubview:self.tableView];
    self.tableView.sd_layout.leftEqualToView(self.view).rightEqualToView(self.view).topEqualToView(self.view).bottomEqualToView(self.view);
    [self.tableView reloadData];
    
    
}

#pragma mark - delegate

#pragma mark - UITableViewDelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.datas.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    HomeTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    if (cell==nil) {
        cell=[[HomeTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    }
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    HomeViewCellModel *model=self.datas[indexPath.row];
    [cell setupCellDataWithModel:model];
    
    
    ////// 此步设置用于实现cell的frame缓存，可以让tableview滑动更加流畅 //////
    
    [cell useCellFrameCacheWithIndexPath:indexPath tableView:tableView];
    
    ///////////////////////////////////////////////////////////////////////
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return [self cellHeightForIndexPath: indexPath cellContentViewWidth: [self cellContentViewWith] tableView:self.tableView];
}
- (CGFloat)cellContentViewWith
{
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    
    // 适配ios7横屏
    if ([UIApplication sharedApplication].statusBarOrientation != UIInterfaceOrientationPortrait && [[UIDevice currentDevice].systemVersion floatValue] < 8) {
        width = [UIScreen mainScreen].bounds.size.height;
    }
    return width;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    HomeViewCellModel *model=self.datas[indexPath.row];
    BlackWhiteListTableViewController *vc=[[BlackWhiteListTableViewController alloc]init];
    vc.title=model.title;
    vc.model=model;
    [self.navigationController pushViewController:vc animated:YES];
}

@end
