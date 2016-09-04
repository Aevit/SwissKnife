//
//  UIView+Animation.h
//  SwissKnife
//
//  Created by Aevit on 16/9/4.
//  Copyright © 2016年 Aevit. All rights reserved.
//

#import <UIKit/UIKit.h>

#define degree(angle) (angle * M_PI / 180.0)

typedef void(^CompleteBlock)(BOOL finished);

@interface UIView (Animation)

- (void)rotateWithDegree:(CGFloat)degree completeBlock:(CompleteBlock)block;

- (void)expandWidth:(CGFloat)width completeBlock:(CompleteBlock)block;

@end
