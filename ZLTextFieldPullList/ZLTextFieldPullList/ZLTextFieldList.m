//
//  ZLTextFieldList.m
//  ZLTextPull
//
//  Created by zhul on 2018/10/29.
//  Copyright © 2018 cn.com.csii.chengshanglian. All rights reserved.
//

#import "ZLTextFieldList.h"
#import "UIView+Extension.h"
@interface ZLTextFieldList()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>
{
    CGFloat _x;
    CGFloat _y;
    CGFloat _width;
    
}
@property(nonatomic,strong) UITableView *mainTableView;
@end

@implementation ZLTextFieldList

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        _x = frame.origin.x;
        _y = frame.origin.y;
        
        _width = frame.size.width;
        
        [self loadAll];
    }
    return self;
}
-(void)loadAll
{
//    self.borderStyle = UITextBorderStyleLine;
    self.clearButtonMode = UITextFieldViewModeUnlessEditing;
    self.delegate = self;
    
    
}

#pragma mark - UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return self.allData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * pullCell = @"pullCell";
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:pullCell];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:pullCell];
    }
    
    cell.textLabel.text = self.allData[indexPath.row];
    
    return cell;  
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return self.height;
}

#pragma mark - UITableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.text = self.allData[indexPath.row];
    [self hiddenView];
    [self endEditing:YES];
}

-(UITableView *)mainTableView
{
    if (_mainTableView == nil) {
        _mainTableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _mainTableView.frame = CGRectMake(_x, self.bottom-10, _width, 0);
        _mainTableView.delegate = self;
        _mainTableView.dataSource = self;
        _mainTableView.layer.borderColor = [UIColor lightGrayColor].CGColor;
        _mainTableView.layer.borderWidth = 1.0f;
//        _mainTableView.layer.cornerRadius = 6;
//        _mainTableView.layer.masksToBounds = YES;
        _mainTableView.separatorColor = [UIColor lightGrayColor];
    }
    return _mainTableView;
}
//显示列表
-(void)showView:(UIView *)view
{
    [view addSubview:self.mainTableView];
    
    __weak typeof(self) weakSelf = self;
    [UIView animateWithDuration:0.5 animations:^{
        weakSelf.mainTableView.frame = CGRectMake(weakSelf.x, weakSelf.bottom-10, weakSelf.width, self.height * self.allData.count);
    }];
 
}
//隐藏列表
-(void)hiddenView
{
    __weak typeof(self) weakSelf = self;
    [UIView animateWithDuration:0.5 animations:^{
        weakSelf.mainTableView.frame = CGRectMake(weakSelf.x, weakSelf.bottom-10, weakSelf.width, 0);
    }];
}


#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    
    if (self.listDelegate && [self.listDelegate respondsToSelector:@selector(textFieldList:selectInfo:)]) {
        [self.listDelegate textFieldList:self selectInfo:self.text];
    }
    return NO;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string;
{
    NSLog(@"load all elements");
    
    if (self.listDelegate && [self.listDelegate respondsToSelector:@selector(textFieldList:selectInfo:)]) {
        [self.listDelegate textFieldList:self selectInfo:self.text];
    }
    return NO;
}

@end
