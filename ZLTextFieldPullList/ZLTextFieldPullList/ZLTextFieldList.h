//
//  ZLTextFieldList.h
//  ZLTextPull
//
//  Created by zhul on 2018/10/29.
//  Copyright © 2018 cn.com.csii.chengshanglian. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZLTextFieldList;
@protocol ZLTextFielListDelegate<NSObject>
-(void)textFieldList:(ZLTextFieldList *)textFieldList selectInfo:(id)data;
@end

@interface ZLTextFieldList : UITextField
@property(nonatomic,strong) NSArray * allData;

@property(nonatomic,assign) id<ZLTextFielListDelegate> listDelegate;

-(void)showView:(UIView *)view;
-(void)hiddenView;
@end
