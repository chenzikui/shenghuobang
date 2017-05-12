//
//  MeiNvTuJiTableViewController.m
//  MyAppFrame
//
//  Created by 陈自奎 on 17/4/24.
//  Copyright © 2017年 Chen, ZiKui. All rights reserved.
//

#import "MeiNvTuJiTableViewController.h"
#import "PW_RollingScrollView.h"
#import "MeinvTuJiListTableRequest.h"
#import "MeiNvTuJiImageArrayRequest.h"
#import "MeiNvTuJiListCell.h"

@interface MeiNvTuJiTableViewController ()<PW_RollingScrollViewDelegate>

//header滑动选择页
@property (nonatomic,strong) PW_RollingScrollView *topScrollView;

@property (nonatomic,strong) MeinvTuJiListTableRequest *requeset;

@property (nonatomic,strong) MeiNvTuJiImageArrayRequest *imgs_request;

@end

@implementation MeiNvTuJiTableViewController
-(MeinvTuJiListTableRequest *)requeset{

    if (!_requeset) {
        _requeset=[[MeinvTuJiListTableRequest alloc]init];
        _requeset.kindid=self.model.kindid;
    }
    return _requeset;
}
-(MeiNvTuJiImageArrayRequest *)imgs_request{

    if (!_imgs_request) {
        _imgs_request=[[MeiNvTuJiImageArrayRequest alloc]init];
    }
    return _imgs_request;
}

-(PW_RollingScrollView *)topScrollView{

    if (!_topScrollView) {
        NSArray *title_arr=@[@"清纯",@"性感",@"气质",@"唯美"];
        _topScrollView=[PW_RollingScrollView segmentedControlWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 44) delegate:self childVcTitle:title_arr isScaleText:NO];
        _topScrollView.backgroundColor=[UIColor whiteColor];
        [_topScrollView buttonAction:_topScrollView.storageAlltitleBtn_mArr[0]];

    }
    return _topScrollView;
}

-(void)setupModel:(HomeViewCellModel *)model{
    self.model=model;
    self.title=model.title;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setEdgesForExtendedLayout:UIRectEdgeNone];
    self.tableView.tableFooterView=[UIView new];
    

    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.requeset.datas.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MeiNvTuJiListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell==nil) {
        cell=[[MeiNvTuJiListCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    MeiNvTuJiListModel *model=self.requeset.datas[indexPath.row];
    [cell setupCellWithData:model];
    
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

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{

    return 44.0f;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{

    return self.topScrollView;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    MeiNvTuJiListModel *model=self.requeset.datas[indexPath.row];
    self.imgs_request.mid=model.images_id;
    WS(weakSelf);
    [self.imgs_request requestData:^(BOOL isSucess) {
        if (isSucess) {
            MeiNvTuJiListCell *cell=(MeiNvTuJiListCell *)[tableView cellForRowAtIndexPath:indexPath];
            model.image_arr=[NSArray arrayWithArray:weakSelf.imgs_request.datas];
            [cell setupCellWithData:model];
            [weakSelf.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
        }
    }];
    
}



#pragma mark - PW_RollingScrollViewDelegate
- (void)SGSegmentedControlDefault:(PW_RollingScrollView *)segmentedControlDefault didSelectTitleAtIndex:(NSInteger)index{
    WS(weakSelf);
    self.requeset.type=[NSString stringWithFormat:@"%ld",index+1];
    self.requeset.rows=@"20";
    self.requeset.page=@"1";
    [self.requeset requestData:^(BOOL isSucess) {
        if (isSucess) {
            [weakSelf.tableView reloadData];
        }
    }];
    NSLog(@"%ld",index);
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
