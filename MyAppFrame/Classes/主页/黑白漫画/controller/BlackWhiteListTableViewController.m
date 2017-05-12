//
//  BlackWhiteListTableViewController.m
//  MyAppFrame
//
//  Created by 陈自奎 on 17/4/10.
//  Copyright © 2017年 Chen, ZiKui. All rights reserved.
//

#import "BlackWhiteListTableViewController.h"
#import "BlackWhiteCartoomListCell.h"
#import "BlackWhiteCartoomListRequest.h"
#import "HomeWebViewController.h"

@interface BlackWhiteListTableViewController ()

@property(nonatomic,strong)NSMutableArray *datas;
@property(nonatomic,strong)BlackWhiteCartoomListRequest *request;

@end

@implementation BlackWhiteListTableViewController

-(NSMutableArray *)datas{

    if (!_datas) {
        _datas=[[NSMutableArray alloc]init];
    }
    return _datas;
}

-(BlackWhiteCartoomListRequest *)request{

    if (!_request) {
        _request=[[BlackWhiteCartoomListRequest alloc]init];
        _request.page=@"1";
        _request.type=self.model.type;
        _request.kindid=self.model.kindid;
    }
    return _request;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    
    WS(weakSelf);
    [self.request requestData:^(BOOL isSucess) {
        weakSelf.datas=weakSelf.request.datas;
        [weakSelf.tableView reloadData];
    }];
}




#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.datas.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BlackWhiteCartoomListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cartoomCell"];
    if (cell==nil) {
        cell=[[BlackWhiteCartoomListCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cartoomCell"];
    }
    
    BlackWhiteCartoonHomeCellModel *model=self.datas[indexPath.row];
    [cell setupCellDataWtihModel:model];
    
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

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    BlackWhiteCartoonHomeCellModel *model=self.datas[indexPath.row];
    
    HomeWebViewController *vc=[[HomeWebViewController alloc]init];
    vc.model=model;
    vc.title=model.title;
    [self.navigationController pushViewController:vc animated:YES];
    
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
