//
//  BaseUseMasonryViewController.m
//  RLMasonryDemo
//
//  Created by LiuMingchuan on 2016/12/3.
//  Copyright © 2016年 LiuMingchuan. All rights reserved.
//

#import "BaseUseMasonryViewController.h"
#import <Masonry.h>

@interface BaseUseMasonryViewController ()

@end

@implementation BaseUseMasonryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setTitle:@"基本使用"];
    
    UIButton *avatarBtn = ({UIButton *btn = [[UIButton alloc]init];
        [btn setImage:[UIImage imageNamed:@"camera"] forState:UIControlStateNormal];
        btn;});
    [self.view addSubview:avatarBtn];
    [avatarBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(100, 100));
        make.centerX.mas_equalTo(self.view);
        make.top.mas_equalTo(self.view).offset(10);
    }];
    
    UILabel *separateLineLbl = ({UILabel *lbl = [[UILabel alloc]init];
        [lbl setBackgroundColor:[UIColor colorWithRed:.4 green:.4 blue:.4 alpha:1]];
        lbl;});
    [self.view addSubview:separateLineLbl];
    [separateLineLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(@2);
        make.top.mas_equalTo(avatarBtn.mas_bottom).offset(10);
        make.left.mas_equalTo(self.view).offset(10);
        make.right.mas_equalTo(self.view).offset(-10);
    }];
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
