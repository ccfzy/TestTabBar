//
//  CCBarItem.m
//  TestTabBar
//
//  Created by caochuang on 15/4/23.
//  Copyright (c) 2015年 caochuang. All rights reserved.
//

#import "CCBarItem.h"

@interface CCBarItem () {
    
}
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIButton *imageBtn;
@property (nonatomic, strong) UIButton *titleBtn;

@end

#define imageWidth 25
#define SCREEN_WIDTH        [[UIScreen mainScreen] bounds].size.width    //当前设备的屏幕宽度
#define kDegreesToRadian(x) (M_PI * (x) / 180.0)
#define kRadianToDegrees(radian) (radian*180.0)/(M_PI)

@implementation CCBarItem

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    self.userInteractionEnabled = YES;
    self.backgroundColor = [UIColor clearColor];
    
    UITapGestureRecognizer *tapGestureRemark = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tabbarEvent:)];
    [self addGestureRecognizer:tapGestureRemark];
    
    float width = frame.size.width;
    self.imageBtn = [[UIButton alloc]initWithFrame:CGRectMake((width-imageWidth)/2, 5, imageWidth, imageWidth)];
    self.imageBtn.backgroundColor = [UIColor clearColor];
    [self.imageBtn addTarget:self action:@selector(imageBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    self.titleBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.imageBtn.frame)+5, width, 14)];
    self.titleBtn.titleLabel.font = [UIFont systemFontOfSize:11];
    self.titleBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    self.titleBtn.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [self.titleBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.titleBtn setTitleColor:[UIColor blueColor] forState:UIControlStateSelected];
    [self.titleBtn addTarget:self action:@selector(imageBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:self.imageBtn];
    [self addSubview:self.titleBtn];
    
    return self;
}

-(void)setImage:(UIImage *)image {
    [self.imageBtn setBackgroundImage:image forState:UIControlStateNormal];
}

-(void)setSelectedImage:(UIImage *)selectedImage {
    [self.imageBtn setBackgroundImage:selectedImage forState:UIControlStateSelected];
}

-(void)setTitle:(NSString *)title {
    [self.titleBtn setTitle:title forState:UIControlStateNormal];
}

-(void)setViewTag:(NSInteger)viewTag {
    _viewTag = viewTag;
    self.imageBtn.tag = viewTag;
    self.titleBtn.tag = viewTag;
}

-(void)setIsSelected:(BOOL)isSelected {
    if (self.viewTag == 2) {
        self.imageBtn.selected = !self.imageBtn.selected;
        [UIView animateWithDuration:0.5 animations:^{
            if (self.imageBtn.selected) {
                //旋转动画。
                CGAffineTransform transform = CGAffineTransformMakeRotation(M_PI_2);
                self.imageBtn.transform = transform;
            } else {
                self.imageBtn.transform = CGAffineTransformIdentity;
            }
        }];
    } else {
        self.imageBtn.selected = isSelected;
        self.titleBtn.selected = isSelected;
    }
}

-(void)setIsBigImage:(BOOL)isBigImage {
    float width = self.bounds.size.width;
    float imgWidth = 35;
    self.imageBtn.frame = CGRectMake((width-imgWidth)/2, 7, imgWidth, imgWidth);
}

-(void)imageBtnAction:(UIButton *)btn {
    if ([self.delegate respondsToSelector:@selector(doSelectedIndex:) ]) {
        [self.delegate doSelectedIndex:btn.tag];
    }
}

-(void) tabbarEvent:(UIGestureRecognizer *)gesture {
    if ([self.delegate respondsToSelector:@selector(doSelectedIndex:) ]) {
        [self.delegate doSelectedIndex:self.viewTag];
    }
}

@end
