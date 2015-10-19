//
//  PulsingHaloLayer.m
//  https://github.com/shu223/PulsingHalo
//
//  Created by shuichi on 12/5/13.
//  Copyright (c) 2013 Shuichi Tsutsumi. All rights reserved.
//
//  Inspired by https://github.com/samvermette/SVPulsingAnnotationView


#import "PulsingHaloLayer.h"


@interface PulsingHaloLayer ()
@property (nonatomic, strong) CALayer *effect;
@property (nonatomic, strong) CAAnimationGroup *animationGroup;
@end


@implementation PulsingHaloLayer
@dynamic repeatCount;

- (instancetype)initWithRepeatCount:(float) repeatCount
{
    self = [super init];
    if (self) {
        self.repeatCount = repeatCount;
        
        self.effect = [CALayer new];
        self.effect.contentsScale = [UIScreen mainScreen].scale;
        self.effect.opacity = 0;
        [self addSublayer:self.effect];
        
        [self _setupProperties];
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void) {
            
            [self _setupAnimationGroup];
            
            if(self.pulseInterval != INFINITY) {
                
                dispatch_async(dispatch_get_main_queue(), ^(void) {
                    
                    [self.effect addAnimation:self.animationGroup forKey:@"pulse"];
                });
            }
        });
    }
    return self;
    
}

- (instancetype)initWithLayerNumber:(NSInteger)layerNumber {
    self = [self initWithRepeatCount:INFINITY];
    if (self) {
        self.haloLayerNumber = layerNumber;
    }
    return self;
}

- (instancetype)init {
    return [self initWithRepeatCount:INFINITY];
}


// =============================================================================
#pragma mark - Accessor

- (void)setFrame:(CGRect)frame {
    
    [super setFrame:frame];
    self.effect.frame = frame;
}

- (void)setBackgroundColor:(CGColorRef)backgroundColor {
    
    [super setBackgroundColor:backgroundColor];
    self.effect.backgroundColor = backgroundColor;
}

- (void)setRadius:(CGFloat)radius {
    
    _radius = radius;
    
    CGFloat diameter = self.radius * 2;
    
    self.effect.bounds = CGRectMake(0, 0, diameter, diameter);
    self.effect.cornerRadius = self.radius;
}

- (void)setPulseInterval:(NSTimeInterval)pulseInterval {
    
    _pulseInterval = pulseInterval;
    
    if (_pulseInterval == INFINITY) {
        [self.effect removeAnimationForKey:@"pulse"];
    }
}

- (void)setHaloLayerNumber:(NSInteger)haloLayerNumber {
    
    _haloLayerNumber = haloLayerNumber;
    self.instanceCount = haloLayerNumber;
    self.instanceDelay = (self.animationDuration + self.pulseInterval) / haloLayerNumber;
}

- (void)setStartInterval:(NSTimeInterval)startInterval {
    
    _startInterval = startInterval;
    self.instanceDelay = startInterval;
}

- (void)setAnimationDuration:(NSTimeInterval)animationDuration {
    
    _animationDuration = animationDuration;
    self.animationGroup.duration = animationDuration + self.pulseInterval;
    for (CAAnimation *anAnimation in self.animationGroup.animations) {
        anAnimation.duration = animationDuration;
    }
    [self.effect removeAllAnimations];
    [self.effect addAnimation:self.animationGroup forKey:@"pulse"];
    self.instanceDelay = (self.animationDuration + self.pulseInterval) / self.haloLayerNumber;
}


// =============================================================================
#pragma mark - Private

- (void)_setupProperties {
    _fromValueForRadius = 0.0;
    _fromValueForAlpha = 0.45;
    _keyTimeForHalfOpacity = 0.2;
    _animationDuration = 3;
    _pulseInterval = 0;
    _useTimingFunction = YES;
    
    self.radius = 60;
    self.haloLayerNumber = 1;
    self.startInterval = 1;
    self.backgroundColor = [[UIColor colorWithRed:0.000 green:0.455 blue:0.756 alpha:1] CGColor];
}

- (void)_setupAnimationGroup {
    
    CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
    animationGroup.duration = self.animationDuration + self.pulseInterval;
    animationGroup.repeatCount = self.repeatCount;
    animationGroup.removedOnCompletion = NO;
    if (self.useTimingFunction) {
        CAMediaTimingFunction *defaultCurve = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
        animationGroup.timingFunction = defaultCurve;
    }
    
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale.xy"];
    scaleAnimation.fromValue = @(self.fromValueForRadius);
    scaleAnimation.toValue = @1.0;
    scaleAnimation.duration = self.animationDuration;
    
    CAKeyframeAnimation *opacityAnimation = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
    opacityAnimation.duration = self.animationDuration;
    opacityAnimation.values = @[@(self.fromValueForAlpha), @0.45, @0];
    opacityAnimation.keyTimes = @[@0, @(self.keyTimeForHalfOpacity), @1];
    opacityAnimation.removedOnCompletion = NO;
    
    NSArray *animations = @[scaleAnimation, opacityAnimation];
    
    animationGroup.animations = animations;
    
    self.animationGroup = animationGroup;
}

@end
