//
//  PublishView.m
//  TestTabBar
//
//  Created by caochuang on 15/4/23.
//  Copyright (c) 2015年 caochuang. All rights reserved.
//

#import "PublishView.h"

@interface PublishView ()<UIGestureRecognizerDelegate> {
    
}
@end

@implementation PublishView

#define RGBCOLOR_ALPHA(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]

-(id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    self.backgroundColor = RGBCOLOR_ALPHA(255, 255, 255, 0.88);
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismiss)];
    tap.delegate = self;
    [tap setNumberOfTouchesRequired:1];
    [tap setNumberOfTapsRequired:1];
    [self addGestureRecognizer:tap];
    
    return self;
}

-(void)show {
    [[UIApplication sharedApplication].keyWindow addSubview:self];
}
-(void)dismiss {
    if (self.publishBlock) {
        self.publishBlock();
    }
    [self removeFromSuperview];
}

@end
