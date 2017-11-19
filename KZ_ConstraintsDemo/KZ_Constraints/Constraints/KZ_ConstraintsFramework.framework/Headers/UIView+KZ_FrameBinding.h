//
//  UIView+KZ_FrameBinding.h
//  KZ_Constraints
//
//  Created by Kieron Zhang on 2017/10/13.
//  Copyright © 2017年 Kieron Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+KZ_Constraints.h"

@interface UIView (KZ_FrameBinding)

//只支持 KZ_LayoutAttribute_Left KZ_LayoutAttribute_Right KZ_LayoutAttribute_Top KZ_LayoutAttribute_Bottom KZ_LayoutAttribute_Width KZ_LayoutAttribute_Height KZ_LayoutAttribute_CenterX KZ_LayoutAttribute_CenterY
- (void)addConstraintsUseFrameWithAttribute:(KZ_LayoutAttribute)layoutAttribute;

@end