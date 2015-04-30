//
//  CCTabbarView.h
//  TestTabBar
//
//  Created by caochuang on 15/4/23.
//  Copyright (c) 2015年 caochuang. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CCTabbarViewDelegate <NSObject>
@optional
-(void)selectedImageIndex:(NSInteger)index;
@end
@interface CCTabbarView : UIView

- (instancetype)initWithFrame:(CGRect)frame;
@property(nonatomic,weak) id<CCTabbarViewDelegate>delegate;
@property(nonatomic,copy) NSArray *titleArray;
@property(nonatomic,readonly) NSMutableArray *items;
@property(nonatomic)NSInteger selectedIndex;

@end
