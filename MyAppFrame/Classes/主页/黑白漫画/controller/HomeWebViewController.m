//
//  HomeWebViewController.m
//  MyAppFrame
//
//  Created by 陈自奎 on 17/4/10.
//  Copyright © 2017年 Chen, ZiKui. All rights reserved.
//

#import "HomeWebViewController.h"
#import "HomeWebViewExtractRequest.h"

@interface HomeWebViewController ()<UIWebViewDelegate,UIScrollViewDelegate>
{

    CGFloat currentOffsetY;
}

@property(nonatomic,strong)HomeWebViewExtractRequest *request;

@end

@implementation HomeWebViewController


-(HomeWebViewExtractRequest *)request{

    if (!_request) {
        _request=[[HomeWebViewExtractRequest alloc]init];
        _request.url_link=self.model.link;
    }
    return _request;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor yellowColor]];
    
    WS(weakself);
    [self.request requestData:^(BOOL isSucess) {
        NSString *requestStr=weakself.request.html_str;
        NSString *componentStr = [self deleteSomeStr:requestStr];
        [weakself.webView loadHTMLString:componentStr baseURL:nil];
    }];

//    NSURLRequest *request=[NSURLRequest requestWithURL:[NSURL URLWithString:self.model.link]];
//    [self.webView loadRequest:request];
    [self.progressLayer startLoad];
    
//    self.webView.scrollView.delegate=self;
    
}
-(NSString *)deleteSomeStr:(NSString *)str{
    
    NSString *componentStr = [str componentsSeparatedByString:@"<p>当前位置"][0];
    return componentStr;
}

#pragma mark - UIWebViewDelegate
-(void)webViewDidFinishLoad:(UIWebView *)webView{

    [super webViewDidFinishLoad:webView];

}
-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{


}

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{

    CGFloat contentOffsety = scrollView.contentOffset.y;
    CGFloat currentNav_h=self.customNavigationView.height;
    WS(weakSelf);
    if (contentOffsety>currentOffsetY+64) {
        [UIView animateWithDuration:0.5 animations:^{

        weakSelf.customNavigationView.frame=CGRectMake(0, 0, ScreenW, 0);
        weakSelf.webView.frame=CGRectMake(0, 0, ScreenW, ScreenH);
        weakSelf.webView.scrollView.contentOffset=CGPointMake(0, contentOffsety-currentNav_h);
        }];
    }
    
    CGFloat offset_y=currentNav_h==0?64:0;
    if (contentOffsety<currentOffsetY-64||contentOffsety<64) {
        [UIView animateWithDuration:0.5 animations:^{
            weakSelf.customNavigationView.frame=CGRectMake(0, 0, ScreenW, 64);
            weakSelf.webView.frame=CGRectMake(0, 64, ScreenW, ScreenH-64);
            weakSelf.webView.scrollView.contentOffset=CGPointMake(0, contentOffsety+offset_y);
        }];

    }
    currentOffsetY=contentOffsety;
    NSLog(@"%f",contentOffsety);
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
