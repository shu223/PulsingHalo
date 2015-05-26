//
//  MultiplePulsingHaloLayer.h
//  PulsingHaloDemo
//
//  Created by ShannonChou on 14-7-7.
//  Copyright (c) 2014年 jiecao.fm. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface MultiplePulsingHaloLayer : CALayer

/**
 *	The default value of this property is @c 60pt.
 */
@property (nonatomic, assign) CGFloat radius;
@property (nonatomic, assign) CGColorRef haloLayerColor;        // color of halo layers

/* properties below should be set before calling "buildSublayers" */

/**
 *	The default value of this property is @c 0.0.
 */
@property (nonatomic, assign) CGFloat fromValueForRadius;

/**
 *	The default value of this property is @c 0.45.
 */
@property (nonatomic, assign) CGFloat fromValueForAlpha;

/**
 *	The value of this property should be ranging from @c 0 to @c 1 (exclusive).
 *
 *	The default value of this property is @c 0.2.
 */
@property (nonatomic, assign) CGFloat keyTimeForHalfOpacity;

/**
 *	The animation duration in seconds.
 *
 *	The default value of this property is @c 3.
 */
@property (nonatomic, assign) NSTimeInterval animationDuration;

/**
 *	The animation interval in seconds.
 *
 *	The default value of this property is @c 0.
 */
@property (nonatomic, assign) NSTimeInterval pulseInterval;

/**
 *	The animation delay in seconds.
 *
 *	The default value of this property is @c 1.
 */
@property (nonatomic, assign) NSTimeInterval startInterval;

/**
 *	The default value of this property is @c INFINITY.
 */
@property (nonatomic, assign) CGFloat animationRepeatCount;

/**
 *	The default value of this property is @c 3.
 */
@property (nonatomic, assign) int haloLayerNumber;

/**
 *	The default value of this property is @c YES.
 */
@property (nonatomic, assign) BOOL useTimingFunction;



- (id)initWithHaloLayerNum:(int)num andStartInterval:(NSTimeInterval)interval;

/**
 *	@remarks Some properties must be set before calling this method (@c haloLayerNumber, @c startInterval, @c animationDuration, etc.).
 *	Properties @c radius, @c haloLayerColor, @c backgroundColor can be set after calling this method. Also, if you want to change some
 *	properties like @c haloLayerNumber when the animation is running, you have to create a new instance.
 */
- (void)buildSublayers;

@end
