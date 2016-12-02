//
//  MainViewController.m
//  RLMasonryDemo
//
//  Created by LiuMingchuan on 2016/12/3.
//  Copyright © 2016年 LiuMingchuan. All rights reserved.
//

#import "MainViewController.h"
#import <Masonry.h>

@interface MainViewController ()<UITableViewDelegate,UITableViewDataSource>  {
    UITableView *demoItemsTV;
    NSArray *demoItems;
    NSArray *demoItemsVCNames;
}

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setTitle:@"MasonryDemo"];
    
    demoItems = [[[NSBundle mainBundle]infoDictionary] objectForKey:@"DemoItems"];
    demoItemsVCNames = [[[NSBundle mainBundle]infoDictionary] objectForKey:@"DemoItemVCNames"];
    
    demoItemsTV = [[UITableView alloc]init];
    [self.view addSubview:demoItemsTV];
    [demoItemsTV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(0);
        make.right.offset(0);
        make.bottom.offset(0);
        make.left.offset(0);
    }];
    demoItemsTV.delegate = self;
    demoItemsTV.dataSource = self;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [demoItems count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *identifer = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifer];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifer];
    }
    cell.textLabel.text = [demoItems objectAtIndex:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    BaseViewController *baseVC = [(BaseViewController *)[NSClassFromString([demoItemsVCNames objectAtIndex:indexPath.row])alloc]init];
    [self.navigationController pushViewController:baseVC animated:YES];
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
