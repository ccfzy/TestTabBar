//
//  SecondViewController.m
//  TestTabBar
//
//  Created by caochuang on 15/4/1.
//  Copyright (c) 2015年 caochuang. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@property (nonatomic,strong) UIScrollView *scrollView;
@property (nonatomic,strong) UIHeaderView *headerView;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *titleArray = @[@"图片",@"文字",@"音频",@"视频"];
    self.headerView = [[UIHeaderView alloc]initWithFrame:CGRectMake(60, 10, 200, 44) TitleArray:titleArray];
    self.navigationItem.titleView = self.headerView ;
    
    [self.view addSubview:self.scrollView];
    
    self.scrollView.contentSize = CGSizeMake(self.view.bounds.size.width*titleArray.count, self.view.bounds.size.height);
    
    // Do any additional setup after loading the view.
}

-(UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc]initWithFrame:self.view.bounds];
        _scrollView.delegate = self;
        _scrollView.pagingEnabled = YES;
        _scrollView.showsHorizontalScrollIndicator = NO;
    }
    return _scrollView;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSLog(@"%f",scrollView.contentOffset.x);
    [self.headerView setOffsetX:scrollView.contentOffset.x];
}

-(void)selectedIndex:(NSInteger)index {
    NSLog(@"选择的按钮tag %ld",(long)index);
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
