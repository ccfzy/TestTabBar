//
//  CCTabbarView.m
//  TestTabBar
//
//  Created by caochuang on 15/4/23.
//  Copyright (c) 2015年 caochuang. All rights reserved.
//

#import "CCTabbarView.h"
#import "CCBarItem.h"

#define SCREEN_WIDTH        [[UIScreen mainScreen] bounds].size.width    //当前设备的屏幕宽度
#define kBaseViewTag 1000
@interface CCTabbarView ()<CCBarItemDelegate> {
    
}

@end

@implementation CCTabbarView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    self.userInteractionEnabled = YES;
    
    return self;
}


-(void)setTitleArray:(NSArray *)titleArray {
    
    _items = [[NSMutableArray alloc]init];
    
    for (int i=0; i<titleArray.count; i++) {
        NSString *title = titleArray[i];
        
        float width = SCREEN_WIDTH/titleArray.count;
        CCBarItem *item = [[CCBarItem alloc]initWithFrame:CGRectMake(i*width, 0, width, 49)];
        item.delegate = self;
        item.title = title;
        item.image = [UIImage imageNamed:@"index_un_selected"];
        item.selectedImage = [UIImage imageNamed:@"index_selected"];
        item.viewTag = i;
        if (i==2) {
            item.isBigImage = YES;
        }
        
        [_items addObject:item];
        [self addSubview:item];
    }
}

-(void)doSelectedIndex:(NSInteger)index {
    NSLog(@"doSelectedIndex tag is %ld",index);
    for (int i=0; i<_items.count; i++) {
        CCBarItem *item = _items[i];
        if (index == i && index == 2) {//旋转90°
            item.isSelected = !item.isSelected;
            break;
        }
        if (i != 2 && index != 2) {
            if (i == index) {
                item.isSelected = YES;
            } else {
                item.isSelected = NO;
            }
        }
    }
    if ([self.delegate respondsToSelector:@selector(selectedImageIndex:)]) {
        [self.delegate selectedImageIndex:index];
    }
}

-(void)setSelectedIndex:(NSInteger)selectedIndex {
    [self doSelectedIndex:selectedIndex];
}

@end
