//
//  UIHeaderView.h
//  TestTabBar
//
//  Created by caochuang on 15/4/1.
//  Copyright (c) 2015年 caochuang. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol UIHeaderDelegate <NSObject>
@required
-(void)selectedIndex:(NSInteger)index;
@end
@interface UIHeaderView : UIView
@property (nonatomic, strong) UIView *selectedLine;
@property (nonatomic, strong) UIColor *selectedColor;
@property (nonatomic, weak) id<UIHeaderDelegate>delegate;
@property (nonatomic) NSInteger selectIndex;
-(id)initWithFrame:(CGRect)frame TitleArray:(NSArray *)titleArr;
-(void)setOffsetX:(float)x;

@end
