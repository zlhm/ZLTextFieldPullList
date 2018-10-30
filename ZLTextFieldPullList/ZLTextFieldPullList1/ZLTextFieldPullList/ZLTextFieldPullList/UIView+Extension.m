//
//  UIView+Extension.m
//  ZLTextFieldPullList
//
//  Created by zhul on 2018/10/29.
//  Copyright © 2018 cn.com.csii. All rights reserved.
//

#import "UIView+Extension.h"

@implementation UIView (Extension)
-(CGFloat)x
{
    return self.frame.origin.x;
}
-(CGFloat)y
{
    return self.frame.origin.y;
}
-(CGFloat)width
{
    return self.frame.size.width;
}
-(CGFloat)height
{
    return self.frame.size.height;
}
-(CGFloat)tail
{
    return self.x+self.width;
}
-(CGFloat)bottom
{
    return self.y+self.height;
}
@end
