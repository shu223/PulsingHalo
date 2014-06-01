//
//  PulsingHaloLayer.h
//  https://github.com/shu223/PulsingHalo
//
//  Created by shuichi on 12/5/13.
//  Copyright (c) 2013 Shuichi Tsutsumi. All rights reserved.
//
//  Inspired by https://github.com/samvermette/SVPulsingAnnotationView


#import <QuartzCore/QuartzCore.h>


@interface PulsingHaloLayer : CALayer

@property (nonatomic, assign) CGFloat radius;                   // default: 60pt
@property (nonatomic, assign) NSTimeInterval animationDuration; // default: 3s
@property (nonatomic, assign) NSTimeInterval pulseInterval;     // default: 0s
@property (nonatomic, assign) float repeatCount;                // default: INFINITY

- (id)initWithRepeatCount:(float)repeatCount;

@end
