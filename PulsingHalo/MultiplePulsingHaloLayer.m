//
//  MultiplePulsingHaloLayer.m
//  PulsingHaloDemo
//
//  Created by ShannonChou on 14-7-7.
//  Copyright (c) 2014年 jiecao.fm. All rights reserved.
//

#import "MultiplePulsingHaloLayer.h"
#import "PulsingHaloLayer.h"

@implementation MultiplePulsingHaloLayer

- (id)init {
    return [self initWithHaloLayerNum:3 andStartInterval:1];
}

- (id)initWithHaloLayerNum:(int)num andStartInterval:(NSTimeInterval)interval {
    if (self = [super init]) {
        self.haloLayerNumber = num;
        self.startInterval = interval;
        // default
        _fromValueForRadius = 0.0;
        _fromValueForAlpha = 0.45;
        _keyTimeForHalfOpacity = 0.2;
        _animationDuration = 3;
        _pulseInterval = 0;
        _animationRepeatCount = INFINITY;
        _radius = 60;
        _useTimingFunction = YES;
        self.backgroundColor = [[UIColor clearColor] CGColor];
    }
    return self;
}

- (void)setHaloLayerColor:(CGColorRef)backgroundColor {
    _haloLayerColor = CGColorRetain(backgroundColor);
    for (PulsingHaloLayer *layer in self.sublayers) {
        layer.backgroundColor = backgroundColor;
    }
}

- (void)setRadius:(CGFloat)radius {
    _radius = radius;
    
    CGPoint tempPos = self.position;
    
    CGFloat diameter = self.radius * 2;
    
    self.bounds = CGRectMake(0, 0, diameter, diameter);
    self.cornerRadius = self.radius;
    self.position = tempPos;
    
    //ajust sublayer
    for (PulsingHaloLayer *layer in self.sublayers) {
        layer.radius = radius;
        layer.position = CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2);
    }
}

- (void)buildSublayers {
    for (int i = 0; i < self.haloLayerNumber; i++) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(self.startInterval* i * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            PulsingHaloLayer *layer = [PulsingHaloLayer layer];
            layer.animationDuration = self.animationDuration;
            layer.repeatCount = self.animationRepeatCount;
            layer.position = CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2);
            layer.radius = self.radius;
            layer.fromValueForAlpha = self.fromValueForAlpha;
            layer.fromValueForRadius = self.fromValueForRadius;
            layer.keyTimeForHalfOpacity = self.keyTimeForHalfOpacity;
            layer.pulseInterval = self.pulseInterval;
            layer.backgroundColor = self.haloLayerColor;
            layer.useTimingFunction = self.useTimingFunction;
            [self addSublayer:layer];
        });
    }
    NSLog(@"sub count:%i", self.sublayers.count);
}

- (void)dealloc {
    CGColorRelease(_haloLayerColor);
}

@end
