//
//  PublishView.h
//  TestTabBar
//
//  Created by caochuang on 15/4/23.
//  Copyright (c) 2015年 caochuang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^PublishBlock)(void);
@interface PublishView : UIView

-(id)initWithFrame:(CGRect)frame;
-(void)show;
-(void)dismiss;
@property (nonatomic, copy) PublishBlock publishBlock;//回调

@end
