//
//  ViewController.m
//  ZLTextFieldPullList
//
//  Created by zhul on 2018/10/29.
//  Copyright © 2018 cn.com.csii. All rights reserved.
//

#import "ViewController.h"
#import "ZLTextFieldList.h"
@interface ViewController ()<ZLTextFielListDelegate>
@property(nonatomic,strong) ZLTextFieldList * textFieldList;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _textFieldList = [[ZLTextFieldList alloc]initWithFrame:CGRectMake(100, 100, 150, 40)];
    _textFieldList.placeholder = @"请选择数据";
    _textFieldList.borderStyle = UITextBorderStyleLine;
    _textFieldList.listDelegate = self;
    _textFieldList.allData = @[@"测试1",@"测试2",@"测试3"];
    [self.view addSubview:_textFieldList];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)textFieldList:(ZLTextFieldList *)textFieldList selectInfo:(id)data
{
    [_textFieldList showView:self.view];
}


@end
