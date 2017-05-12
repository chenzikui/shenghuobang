//
//  HomeViewController.m
//  MyAppFrame
//
//  Created by 陈自奎 on 17/4/7.
//  Copyright © 2017年 Chen, ZiKui. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeViewCellModel.h"
#import "HomeTableViewCell.h"
#import "BlackAndWhiteCartoonViewController.h"

static NSString * const reuseIdentifier = @"homeCell";

@interface HomeViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)NSMutableArray *datas;
@property(nonatomic,strong)UITableView *tableView;


@end

@implementation HomeViewController
#pragma mark - setting
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


#pragma mark - public
- (void)viewDidLoad {
    [super viewDidLoad];
    
//    NSMutableArray *dataArr=@[@{@"image":@"黑白漫画",@"title":@"黑白漫画",@"kindid":@"958-1",@"describe":@"包括恐怖漫画、段子、冷知识、奇趣、电影、搞笑、萌宠、新奇、环球、摄影、一玩艺类别"}].mutableCopy;
    
    NSString *plist=[[NSBundle mainBundle] pathForResource:@"首页data数据.plist" ofType:nil];
    NSArray *plist_arr=[NSArray arrayWithContentsOfFile:plist];
    
    for (NSDictionary *dic in plist_arr) {
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
    
    id vc_obj = [[NSClassFromString(model.controller_str) alloc] init];
    SEL sel=NSSelectorFromString(@"setupModel:");//注意这个冒号,说明方法带有参数
    if([vc_obj respondsToSelector:sel]) {
        [vc_obj performSelector:sel withObject:model]; //注意如果有两个参数,使用两个withObject:参数;
    }
    [self.navigationController pushViewController:vc_obj animated:YES];

}















@end
