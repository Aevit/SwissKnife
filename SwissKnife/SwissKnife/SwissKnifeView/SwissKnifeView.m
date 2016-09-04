//
//  SwissKnifeView.m
//  SwissKnife
//
//  Created by Aevit on 16/9/4.
//  Copyright © 2016年 Aevit. All rights reserved.
//

#import "SwissKnifeView.h"
#import "UIView+Animation.h"

#define kOriginWidth 80
#define kExpandHandViewWidth 360

#define kUpFirstAngle (112 * M_PI / 180.0)
#define kUpSecondAngle (63 * M_PI / 180.0)
#define kUpThirdAngle (-60 * M_PI / 180.0)
#define kDownFirstAngle (55 * M_PI / 180.0)
#define kDownSecondAngle (90 * M_PI / 180.0)

typedef NS_ENUM(NSInteger, SwissKnifeStatus) {
    SwissKnifeStatusClose = 1,
    SwissKnifeStatusOpen = 2
};

@interface SwissKnifeView()

@property (nonatomic, strong) UIView *handBgView;
@property (nonatomic, strong) UIButton *addBtn;

@property (nonatomic, strong) UIImageView *upFirstKnife;
@property (nonatomic, strong) UIImageView *upSecondKnife;
@property (nonatomic, strong) UIImageView *upThirdKnife;

@property (nonatomic, strong) UIImageView *downFirstKnife;
@property (nonatomic, strong) UIImageView *downSecondKnife;

@end

@implementation SwissKnifeView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self commonInit];
    }
    return self;
}

- (void)commonInit {
    [self addSubview:self.upFirstKnife];
    [self addSubview:self.upSecondKnife];
    [self addSubview:self.upThirdKnife];
    
    [self addSubview:self.downFirstKnife];
    [self addSubview:self.downSecondKnife];
    
    [self addSubview:self.handBgView];
    [self addSubview:self.addBtn];
    
}

#pragma mark - views
- (UIView *)handBgView {
    if (!_handBgView) {
        _handBgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kOriginWidth, kOriginWidth)];
        _handBgView.center = self.center;
        _handBgView.backgroundColor = rgba(247, 65, 45, 1);
        _handBgView.layer.cornerRadius = kOriginWidth / 2;
        _handBgView.layer.borderColor = rgba(213, 44, 39, 1).CGColor;
        _handBgView.layer.borderWidth = 1;
    }
    return _handBgView;
}

- (UIButton *)addBtn {
    if (!_addBtn) {
        _addBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _addBtn.frame = CGRectMake(0, 0, kOriginWidth, kOriginWidth);
        _addBtn.center = self.center;
        [_addBtn setImage:[UIImage imageNamed:@"add"] forState:UIControlStateNormal];
        [_addBtn addTarget:self action:@selector(openKnife:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _addBtn;
}

- (UIImageView *)upFirstKnife {
    if (!_upFirstKnife) {
        _upFirstKnife = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"left-knife"]];
        CGRect frame = _upFirstKnife.frame;
        frame.origin.y = self.handBgView.frame.origin.y - _upFirstKnife.frame.size.height + 88;
        frame.origin.x = 17;
        _upFirstKnife.frame = frame;
        
        _upFirstKnife.hidden = YES;
        _upFirstKnife.layer.anchorPoint = CGPointMake(0.5, 1);
        _upFirstKnife.transform = CGAffineTransformMakeRotation(kUpFirstAngle);
    }
    return _upFirstKnife;
}

- (UIImageView *)upSecondKnife {
    if (!_upSecondKnife) {
        _upSecondKnife = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"top-middle-knife"]];
        CGRect frame = _upSecondKnife.frame;
        frame.origin.y = self.handBgView.frame.origin.y - _upSecondKnife.frame.size.height + 80;
        frame.origin.x = 60;
        _upSecondKnife.frame = frame;
        
        _upSecondKnife.hidden = YES;
        _upSecondKnife.layer.anchorPoint = CGPointMake(0, 1);
        _upSecondKnife.transform = CGAffineTransformMakeRotation(kUpSecondAngle);
    }
    return _upSecondKnife;
}

- (UIImageView *)upThirdKnife {
    if (!_upThirdKnife) {
        _upThirdKnife = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"top_knife"]];
        CGRect frame = _upThirdKnife.frame;
        frame.origin.y = self.handBgView.frame.origin.y - _upThirdKnife.frame.size.height + 135;
        frame.origin.x = self.frame.origin.x + self.frame.size.width - 122;
        _upThirdKnife.frame = frame;
        
        _upThirdKnife.hidden = YES;
        _upThirdKnife.layer.anchorPoint = CGPointMake(1, 1);
        _upThirdKnife.transform = CGAffineTransformMakeRotation(kUpThirdAngle);
    }
    return _upThirdKnife;
}

- (UIImageView *)downFirstKnife {
    if (!_downFirstKnife) {
        _downFirstKnife = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bottom-opener"]];
        CGRect frame = _downFirstKnife.frame;
        frame.origin.y = self.handBgView.frame.origin.y + self.handBgView.frame.size.height - 80;
        frame.origin.x = self.handBgView.center.x - 40;
        _downFirstKnife.frame = frame;
        
        _downFirstKnife.hidden = YES;
        _downFirstKnife.layer.anchorPoint = CGPointMake(1, 0);
        _downFirstKnife.transform = CGAffineTransformMakeRotation(kDownFirstAngle);
    }
    return _downFirstKnife;
}

- (UIImageView *)downSecondKnife {
    if (!_downSecondKnife) {
        _downSecondKnife = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bottom-knife"]];
        CGRect frame = _downSecondKnife.frame;
        frame.origin.y = self.handBgView.frame.origin.y + self.handBgView.frame.size.height - 80;
        frame.origin.x = self.handBgView.center.x + 20;
        _downSecondKnife.frame = frame;
        
        _downSecondKnife.hidden = YES;
        _downSecondKnife.layer.anchorPoint = CGPointMake(1, 0);
        _downSecondKnife.transform = CGAffineTransformMakeRotation(kDownSecondAngle);
    }
    return _downSecondKnife;
}


#pragma mark - actions
- (void)openKnife:(UIButton*)sender {
    
    sender.selected = !sender.selected;
    
    if (sender.selected) {
        // open
        [self.addBtn rotateWithDegree:225 completeBlock:^(BOOL finished) {
            [self.handBgView expandWidth:kExpandHandViewWidth completeBlock:^(BOOL finished) {
                [self showKnives];
            }];
        }];
    } else {
        // close
        [self hideKnives];
    }
}

#pragma mark - animations
- (void)showKnives {
    [UIView animateKeyframesWithDuration:0.5 delay:0 options:UIViewKeyframeAnimationOptionBeginFromCurrentState animations:^{
        
        self.upThirdKnife.hidden = NO;
        [UIView addKeyframeWithRelativeStartTime:0.0 relativeDuration:0.2 animations:^{
            self.upThirdKnife.transform = CGAffineTransformMakeRotation(0);
        }];
        
        self.upFirstKnife.hidden = NO;
        [UIView addKeyframeWithRelativeStartTime:0.2 relativeDuration:0.4 animations:^{
            self.upFirstKnife.transform = CGAffineTransformMakeRotation(0);
        }];
        
        self.upSecondKnife.hidden = NO;
        [UIView addKeyframeWithRelativeStartTime:0.4 relativeDuration:0.6 animations:^{
            self.upSecondKnife.transform = CGAffineTransformMakeRotation(0);
        }];
        
        self.downFirstKnife.hidden = NO;
        [UIView addKeyframeWithRelativeStartTime:0.6 relativeDuration:0.8 animations:^{
            self.downFirstKnife.transform = CGAffineTransformMakeRotation(0);
        }];
        
        self.downSecondKnife.hidden = NO;
        [UIView addKeyframeWithRelativeStartTime:0.8 relativeDuration:1.0 animations:^{
            self.downSecondKnife.transform = CGAffineTransformMakeRotation(0);
        }];
    } completion:^(BOOL finished) {
    }];
}

- (void)hideKnives {
    [UIView animateKeyframesWithDuration:0.5 delay:0 options:UIViewKeyframeAnimationOptionBeginFromCurrentState animations:^{
        
        [UIView addKeyframeWithRelativeStartTime:0.0 relativeDuration:0.2 animations:^{
            self.downSecondKnife.transform = CGAffineTransformMakeRotation(kDownSecondAngle);
        }];
        [UIView addKeyframeWithRelativeStartTime:0.2 relativeDuration:0.4 animations:^{
            self.downFirstKnife.transform = CGAffineTransformMakeRotation(kDownFirstAngle);
        }];
        [UIView addKeyframeWithRelativeStartTime:0.4 relativeDuration:0.6 animations:^{
            self.upSecondKnife.transform = CGAffineTransformMakeRotation(kUpSecondAngle);
        }];
        [UIView addKeyframeWithRelativeStartTime:0.6 relativeDuration:0.8 animations:^{
            self.upFirstKnife.transform = CGAffineTransformMakeRotation(kUpFirstAngle);
        }];
        [UIView addKeyframeWithRelativeStartTime:0.8 relativeDuration:1.0 animations:^{
            self.upThirdKnife.transform = CGAffineTransformMakeRotation(kUpThirdAngle);
        }];
        
    } completion:^(BOOL finished) {
        [self.handBgView expandWidth:kOriginWidth completeBlock:^(BOOL finished) {
            [self.addBtn rotateWithDegree:0 completeBlock:^(BOOL finished) {}];
        }];
        self.upThirdKnife.hidden = YES;
        self.upFirstKnife.hidden = YES;
        self.upSecondKnife.hidden = YES;
        self.downFirstKnife.hidden = YES;
        self.downSecondKnife.hidden = YES;
    }];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
