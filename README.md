PulsingHalo
===========

**PulsingHalo has been discontinued, and is no longer being maintained.** Please check out **[Pulsator](https://github.com/shu223/Pulsator)** which is the new version of this written with Swift.

[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Badge w/ Version](http://cocoapod-badges.herokuapp.com/v/PulsingHalo/badge.png)](http://cocoadocs.org/docsets/PulsingHalo)
[![License](http://img.shields.io/badge/license-MIT-lightgrey.svg?style=flat
)](http://mit-license.org)

iOS component for creating a pulsing animation. It allows you to create halos.

![](demo_.gif)
                    
Great For:

- **Pulses of beacons (iBeacon)**
- Map Annotations


## Installation

### CocoaPods

Add into your Podfile.

```
pod "PulsingHalo"
```

Then `$ pod install`


### Carthage

Add into your Cartfile.

```
github "shu223/PulsingHalo"
```

Then `$ carthage update`


### Manual

Add PulsingHaloLayer.h,m into your project.

## How to use

Just **initiate and add** to your view layer.

### Swift

```swift
let halo = PulsingHaloLayer()
halo.position = view.center
view.layer.addSublayer(halo)
halo.start()
```

### Objective-C

```objc
PulsingHaloLayer *halo = [PulsingHaloLayer layer];
halo.position = self.view.center;
[self.view.layer addSublayer:halo];
[halo start];
```




## Customizations

### Number of Halos

Use `haloLayerNumber` property.

```objc
halo.haloLayerNumber = 3;
```

### radius

Use `radius` property.

```objc
self.halo.radius = 240.0;
```

### color

Use `backgroundColor` property.

```objc
UIColor *color = [UIColor colorWithRed:0.7
                                 green:0.9
                                  blue:0.3
                                 alpha:1.0];

self.halo.backgroundColor = color.CGColor;
```

### animation duration

Use `animationDuration` or `pulseInterval` property.


### animation repeat count

Initialize using `initWithRepeatCount:` method, or set `repeatCount` property. The default value is `INFINITY`.


### animation key values and times

Use properties `fromValueForRadius` or `keyTimeForHalfOpacity`.

### enable/disable timing function for animation

Use property `useTimingFunction`

## Demo

You can try to change the radius and color properties with demo app.


## Special Thanks

Inspired by [SVPulsingAnnotationView](https://github.com/samvermette/SVPulsingAnnotationView).

## Author

**Shuichi Tsutsumi**

iOS freelancer in Japan. Welcome works from abroad!

- PAST WORKS:  [My Profile Summary](https://medium.com/@shu223/my-profile-summary-f14bfc1e7099#.vdh0i7clr)
- PROFILES: [LinkedIn](https://www.linkedin.com/profile/view?id=214896557)
- BLOG: [English](https://medium.com/@shu223/) / [Japanese](http://d.hatena.ne.jp/shu223/)
- CONTACTS:
  - [Twitter](https://twitter.com/shu223)
  - [Facebook](https://www.facebook.com/shuichi.tsutsumi)
