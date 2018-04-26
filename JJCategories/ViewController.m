//
//  ViewController.m
//  JJCategories
//
//  Created by JMZiXun on 2018/2/27.
//  Copyright © 2018年 JMZiXun. All rights reserved.
//

#import "ViewController.h"
#import "JJTextFieldDemoController.h"
static NSString *const JJTextField = @"JJTextFieldDemo";

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic ,strong) NSMutableArray *dataArray;

@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self initData];
    [self setupUI];
    
}

- (void)setupUI {
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.tableFooterView = [UIView new];
}

- (void)initData{
    self.dataArray = [NSMutableArray array];
    [self.dataArray addObject:JJTextField];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellID];
    }
    cell.textLabel.text = self.dataArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *title = self.dataArray [indexPath.row];
    if ([title isEqualToString:JJTextField]) {
        [self jj_pushViewController:[JJTextFieldDemoController new]];
    }
}



- (void)jj_pushViewController:(UIViewController *)viewController{
    
    Class class = [viewController class];
    UIViewController *textFieldCon = [[class alloc] initWithNibName:NSStringFromClass(class) bundle:nil];
    [self.navigationController pushViewController:textFieldCon animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
