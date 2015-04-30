//
//  UIHeaderView.m
//  TestTabBar
//
//  Created by caochuang on 15/4/1.
//  Copyright (c) 2015年 caochuang. All rights reserved.
//

#import "UIHeaderView.h"

@implementation UIHeaderView

-(id)initWithFrame:(CGRect)frame TitleArray:(NSArray *)titleArr {
    if ((self = [super initWithFrame:frame])) {
        int i = 0;
        for (NSString *title in titleArr) {
            UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(i*50, 20, 50, 12)];
            [btn setTitle:title forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
            btn.tag = i;
            btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
            btn.titleLabel.font = [UIFont systemFontOfSize:12];
            [self addSubview:btn];
            
            i++;
        }
        self.selectedColor = [UIColor orangeColor];
        self.userInteractionEnabled = YES;
        //底部line
        self.selectedLine = [[UIView alloc]initWithFrame:CGRectMake(0, frame.size.height-2, 50, 2)];
        self.selectedLine.backgroundColor = [UIColor clearColor];
        UIView *v = [[UIView alloc]initWithFrame:CGRectMake(10, 0, 30, 2)];
        v.backgroundColor = [UIColor orangeColor];
        [self.selectedLine addSubview:v];
        [self addSubview:self.selectedLine];
    }
    return self;
}

-(void)setOffsetX:(float)x {
    //总共200
    [UIView animateWithDuration:0.1 animations:^{
        self.selectedLine.frame = CGRectMake(x/6.4, self.bounds.size.height-2, 50, 2);
    } completion:^(BOOL finished) {
        
    }];
    int yu = (int) x%320;
    if (yu==0) {
        int tag = x/320;
        [self changeSelected:tag];
        [self selectedIndex:tag];
    }
}

-(void)setSelectIndex:(NSInteger)selectIndex {
    [UIView animateWithDuration:0.3 animations:^{
        self.selectedLine.frame = CGRectMake(selectIndex*50, self.bounds.size.height-2, 50, 2);
    } completion:^(BOOL finished) {
        
    }];
    [self changeSelected:selectIndex];
}

-(void)selectedIndex:(NSInteger)index {
    if ([self.delegate respondsToSelector:@selector(selectedIndex:)]) {
        [self.delegate selectedIndex:index];
    }
}

-(void)changeSelected:(NSInteger)index {
    NSArray *array = self.subviews;
    for (id obj in array) {
        if ([obj isKindOfClass:[UIButton class]]) {
            UIButton *btn = (UIButton *)obj;
            if (btn.tag == index) {
                [btn setTitleColor:self.selectedColor forState:UIControlStateNormal];
            } else {
                [btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
            }
        }
    }
}

@end
