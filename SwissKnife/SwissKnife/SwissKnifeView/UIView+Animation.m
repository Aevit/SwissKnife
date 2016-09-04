//
//  UIView+Animation.m
//  SwissKnife
//
//  Created by Aevit on 16/9/4.
//  Copyright © 2016年 Aevit. All rights reserved.
//

#import "UIView+Animation.h"

@implementation UIView (Animation)

- (void)rotateWithDegree:(CGFloat)degree completeBlock:(CompleteBlock)block {
    CGAffineTransform endAngle = CGAffineTransformMakeRotation(degree * (M_PI / 180.0f));
    [UIView animateWithDuration:0.4 delay:0 usingSpringWithDamping:0.7 initialSpringVelocity:0.5 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.transform = endAngle;
    } completion:^(BOOL finished) {
        if (block) {
            block(finished);
        }
    }];
}

- (void)expandWidth:(CGFloat)width completeBlock:(CompleteBlock)block {
    CGRect frame = self.frame;
    frame.size.width = width;
    frame.origin.x = (self.superview.frame.size.width - width) / 2;
    frame.origin.y = (self.superview.frame.size.height - frame.size.height) / 2;
    [UIView animateWithDuration:0.4 delay:0 usingSpringWithDamping:0.7 initialSpringVelocity:1.2 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.frame = frame;
    } completion:^(BOOL finished) {
        if (block) {
            block(finished);
        }
    }];
}

@end
