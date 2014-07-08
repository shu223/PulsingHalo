//
//  MultiplePulsingHaloLayer.h
//  PulsingHaloDemo
//
//  Created by ShannonChou on 14-7-7.
//  Copyright (c) 2014年 jiecao.fm. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface MultiplePulsingHaloLayer : CALayer

@property (nonatomic, assign) CGFloat radius;                   // default: 60pt
@property (nonatomic, assign) CGColorRef haloLayerColor;        // color of halo layers

/* properties below should be set before calling "buildSublayers" */
@property (nonatomic, assign) CGFloat fromValueForRadius;       // default: 0.0
@property (nonatomic, assign) CGFloat fromValueForAlpha;        // default: 0.45
@property (nonatomic, assign) CGFloat keyTimeForHalfOpacity;    // default: 0.2 (range: 0 < keyTime < 1)
@property (nonatomic, assign) NSTimeInterval animationDuration; // default: 3s
@property (nonatomic, assign) NSTimeInterval pulseInterval;     // default: 0s
@property (nonatomic, assign) NSTimeInterval startInterval;     // if there are two more halo layer, this value presents the interval between their first start time, default: 1s
@property (nonatomic, assign) CGFloat animationRepeatCount;     // default: INFINITY
@property (nonatomic, assign) int haloLayerNumber;              // default: 3
@property (nonatomic, assign) BOOL useTimingFunction;           // default: YES should use timingFunction for animation



- (id)initWithHaloLayerNum:(int)num andStartInterval:(NSTimeInterval)interval;

/**
 Some properties must be set before calling this method. Like "haloLayerNumber" "startInterval" "animationDuration" and so on
 except "radius" "haloLayerColor" "backgroundColor". If you want to change some properties like "haloLayerNumber" when the
 animation is running, you have to create a new instance.
 */
- (void)buildSublayers;

@end
