//
//  TableViewController.m
//  testUITableView
//
//  Created by andy.yao on 12/15/15.
//  Copyright © 2015 andy.yao. All rights reserved.
//

#import "TableViewController.h"


@interface TableViewController ()<UITableViewDataSource,UITableViewDataSource>

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

//定义一个tableView中有多少个section
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 5;
}

//定义每一个section中有多少row，可以通过对参数section的判定返回不同的值
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 50;
}

//定义每个row中cell的内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UILabel *cellTitle = nil;
    //用于资源reuse的标示符，必须要有，具体自行google
    NSString *cellIdentifier = [NSString stringWithFormat:@"cellIdentifier%ld_%ld",(long)indexPath.section, (long)indexPath.row];
//    NSString *cellIdentifier = [NSString stringWithFormat:@"cellIdentifier%ld",(long)indexPath.section];
    //初始化cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        switch (indexPath.section) {
            case 0:
                //默认style，没有子标题
                cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
                cell.textLabel.text = @"标题";
                cell.detailTextLabel.text = @"子标题";
                //右侧的附加类别显示为：箭头
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            
                break;
            case 1:
                //有子标题的style
                cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
                cell.textLabel.text =@"标题";
                cell.detailTextLabel.text = @"子标题";
                //右侧的附加类别显示为：显示细节的按钮
                cell.accessoryType = UITableViewCellAccessoryDetailButton;
                break;
            case 2:
                //styleValue1 子标题在右侧
                cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
                cell.textLabel.text =@"标题";
                cell.detailTextLabel.text = @"子标题";
                //右侧的附加类别显示为：细节按钮+箭头
                cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
                break;
            case 3:
                //styleValue2 没有图片,子标题靠在标题右侧
                cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:cellIdentifier];
                cell.textLabel.text =@"标题";
                cell.detailTextLabel.text = @"子标题";
                //右侧的附加类别显示为：勾选
                cell.accessoryType = UITableViewCellAccessoryCheckmark;
                break;
            case 4:
                NSLog(@"%@",cellIdentifier);
//                如果这样实例化cell的话，将不会放入cell的重用队列
//                cell = [[UITableViewCell alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 35)];
                cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
                cellTitle = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 35)];
                [cellTitle setTextAlignment:NSTextAlignmentCenter];
                cellTitle.text = [NSString stringWithFormat:@"标题%ld_%ld",(long)indexPath.section, (long)indexPath.row];
                [cell addSubview:cellTitle];
                //右侧的附加类别也可以是一个自定义的view
                cell.accessoryView = [[UISwitch alloc]init];
                break;
            default:
                break;
        }
    } else {
        NSLog(@"I'm not nil!!!!\n\n");
    }
    //对所有的cell添加图片
    cell.imageView.image = [UIImage imageNamed:@"tableViewCellImage.png"];
//    //对所有的cell的边框宽度设为1，方便看到边框的形状
//    cell.layer.borderWidth = 1;
//    //对边框的颜色进行设定
//    [cell.layer setBorderColor:[UIColor lightGrayColor].CGColor];
    
    //ios7之后，UITabelView内容使用margin layout，所以设置分割线位置会失败，这里把这个这个设定关了
//    [cell setPreservesSuperviewLayoutMargins:NO];
//    [cell setSeparatorInset:UIEdgeInsetsMake(0, 10, 0, 10)];
//    [cell setLayoutMargins:UIEdgeInsetsZero];
    
    return cell;
}

//定义每个row的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 45;
}
//定义每个section上方空白区域的高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 40;
}
//定义每个section上方空白区域的内容
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 375, 40)];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 20, 375, 20)];
    [label setTextColor:[UIColor redColor]];
    [label setTextAlignment:NSTextAlignmentCenter];
    switch (section) {
        case 0:
            label.text = @"UITableViewCellStyleDefault";
            break;
        case 1:
            label.text = @"UITableViewCellStyleSubtitle";
            break;
        case 2:
            label.text = @"UITableViewCellStyleValue1";
            break;
        case 3:
            label.text = @"UITableViewCellStyleValue2";
            break;
        case 4:
            label.text = @"自定义的view";
            break;
        default:
            break;
    }
    [view addSubview:label];
    return view;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.1;
}
@end
