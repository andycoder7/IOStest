//
//  ViewController.m
//  testUITableView
//
//  Created by andy.yao on 12/15/15.
//  Copyright © 2015 andy.yao. All rights reserved.
//

#import "ViewController.h"
#import "TableViewController.h"

@interface ViewController ()
@property (nonatomic,strong)TableViewController *tvc;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tvc = [[TableViewController alloc]init];
    self.tvc.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    self.tvc.tableView.delegate = self.tvc;
    self.tvc.tableView.dataSource = self.tvc;
    [self.view addSubview:self.tvc.tableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
