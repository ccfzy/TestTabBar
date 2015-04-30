//
//  CCBarItem.h
//  TestTabBar
//
//  Created by caochuang on 15/4/23.
//  Copyright (c) 2015年 caochuang. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CCBarItemDelegate <NSObject>
@optional
-(void)doSelectedIndex:(NSInteger)index;
@end
@interface CCBarItem : UIView


- (instancetype)initWithFrame:(CGRect)frame;
@property (nonatomic,weak) id<CCBarItemDelegate>delegate;
@property (nonatomic, strong) UIView *backgroundView;
@property (nonatomic, strong) UIImage *image;
@property (nonatomic, strong) UIImage *selectedImage;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, assign) NSInteger viewTag;
@property (nonatomic) BOOL isSelected;
@property (nonatomic) BOOL isBigImage;
@end
