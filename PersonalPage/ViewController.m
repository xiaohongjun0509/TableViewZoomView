//
//  ViewController.m
//  PersonalPage
//
//  Created by hongjunxiao on 16/2/22.
//  Copyright © 2016年 ihj. All rights reserved.
//

#import "ViewController.h"
#import "Header.h"

@interface ViewController ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *bgHeader;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, assign) BOOL isBGAtTop;
@property (weak, nonatomic) IBOutlet UIImageView *maskView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"%@----%zd",[self class], indexPath.row];
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 10;
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
        return [[[NSBundle mainBundle] loadNibNamed:@"Header" owner:nil options:nil] firstObject];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 200;
}


#pragma mark scrollView delegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    if (scrollView.contentOffset.y < 0) {//向下滑
        self.bgHeader.frame = CGRectMake(0, 0, 320, 200 - scrollView.contentOffset.y);
//        [self.view bringSubviewToFront:self.tableView];
    }else{//向上滑
        self.bgHeader.frame = CGRectMake(0, 0 - scrollView.contentOffset.y, 320, 200);
        if (scrollView.contentOffset.y > 140) {
            self.maskView.hidden = NO;
            self.titleLabel.hidden = NO;
            NSLog(@"%@---%@",NSStringFromCGRect(self.bgHeader.frame),NSStringFromCGRect(self.maskView.frame));
        }else{
            self.maskView.hidden = YES;
            self.titleLabel.hidden = YES;
        }
//        if(scrollView.contentOffset.y > 140){//
//            self.bgHeader.frame = CGRectMake(0, -140, 320, 200);
////            [self.view bringSubviewToFront:self.bgHeader];
//        }else {
////            [self.view insertSubview:self.bgHeader belowSubview:self.tableView];
//            self.bgHeader.frame = CGRectMake(0, 0 - scrollView.contentOffset.y, 320, 200);
//            
////            [self.view bringSubviewToFront:self.tableView];
//        }
    }
    
}

@end
