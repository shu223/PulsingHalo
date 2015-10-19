PulsingHalo
===========

iOS component for creating a pulsing animation. It allows you to create halos.

![](demo_.gif)
                    
Great For:

- **Pulses of beacons (iBeacon)**
- Map Annotations


##How to use

1. Add PulsingHaloLayer.h,m into your project
2. **Just initiate and add to your view layer**.

````
PulsingHaloLayer *halo = [PulsingHaloLayer layer];
halo.position = self.view.center;
[self.view.layer addSublayer:halo];
````

###Install with CocoaPods

Edit your Podfile.

````
pod "PulsingHalo"
````

And `$ pod install`


##Customization

###Number of Halos

Use `haloLayerNumber` property.

```
halo.haloLayerNumber = 3;
```

Or you can use `initWithLayerNumber:`.

````
PulsingHaloLayer *halo = [[PulsingHaloLayer alloc] initWithLayerNumber:3];
halo.position = self.view.center;
[self.view.layer addSublayer:halo];
````

###radius

Use `radius` property.

````
self.halo.radius = 240.0;
````

###color

Use `backgroundColor` property.

````
UIColor *color = [UIColor colorWithRed:0.7
                                 green:0.9
                                  blue:0.3
                                 alpha:1.0];

self.halo.backgroundColor = color.CGColor;
````

###animation duration

Use `animationDuration` or `pulseInterval` property.


###animation repeat count

Initialize using `initWithRepeatCount:` method, or set `repeatCount` property. The default value is `INFINITY`.


###animation key values and times

Use properties `fromValueForRadius`, `fromValueForAlpha` and `keyTimeForHalfOpacity`.

###enable/disable timing function for animation
Use property `useTimingFunction`

##Demo

You can try to change the radius and color properties with demo app.


##Special Thanks

Inspired by [SVPulsingAnnotationView](https://github.com/samvermette/SVPulsingAnnotationView).

