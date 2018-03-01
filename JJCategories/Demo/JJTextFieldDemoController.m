//
//  JJTextFieldDemoController.m
//  JJCategories
//
//  Created by JMZiXun on 2018/2/27.
//  Copyright © 2018年 JMZiXun. All rights reserved.
//

#import "JJTextFieldDemoController.h"
#import "UITextField+JJAdd.h"
@interface JJTextFieldDemoController ()
@property (weak, nonatomic) IBOutlet UITextField *textField1;
@property (weak, nonatomic) IBOutlet UITextField *textField2;

@end

@implementation JJTextFieldDemoController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    //修改placeholder属性
    [self.textField1 jj_placeholder:@"textField1" color:[UIColor orangeColor] font:[UIFont systemFontOfSize:20] alignment:1                                                                                                               ];
    
    self.textField1.textAlignment = NSTextAlignmentCenter;
    self.textField1.textColor = [UIColor redColor];
    //限制文本长度
    [self.textField1 jj_length:5];
    
    
    [self.textField2 jj_lengthLimit:^{
        if (self.textField2.text.length>10) {
            self.textField2.text = [self.textField2.text substringToIndex:10];
        }
    }];
    
    
    [self.textField2 jj_placeholder:@"textField2" color:self.textField2.placeholderColor font:nil alignment:0                                                                                                               ];
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
