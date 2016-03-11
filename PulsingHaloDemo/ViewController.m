//
//  ViewController.m
//  PulsingHaloDemo
//
//  Created by shuichi on 12/5/13.
//  Modified by ShannonChou on 14-7-8
//  Copyright (c) 2013 Shuichi Tsutsumi. All rights reserved.
//

#import "ViewController.h"
#import "PulsingHaloLayer.h"

#define kMaxRadius 200
#define kMaxDuration 10


@interface ViewController ()
@property (nonatomic, weak) PulsingHaloLayer *halo;
@property (nonatomic, weak) IBOutlet UIImageView *beaconView;
@property (nonatomic, weak) IBOutlet UISlider *countSlider;
@property (nonatomic, weak) IBOutlet UISlider *radiusSlider;
@property (nonatomic, weak) IBOutlet UISlider *durationSlider;
@property (nonatomic, weak) IBOutlet UISlider *rSlider;
@property (nonatomic, weak) IBOutlet UISlider *gSlider;
@property (nonatomic, weak) IBOutlet UISlider *bSlider;
@property (nonatomic, weak) IBOutlet UILabel *countLabel;
@property (nonatomic, weak) IBOutlet UILabel *radiusLabel;
@property (nonatomic, weak) IBOutlet UILabel *durationLabel;
@property (nonatomic, weak) IBOutlet UILabel *rLabel;
@property (nonatomic, weak) IBOutlet UILabel *gLabel;
@property (nonatomic, weak) IBOutlet UILabel *bLabel;
@end


@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    // basic setup
    PulsingHaloLayer *layer = [PulsingHaloLayer layer];
    self.halo = layer;
    [self.beaconView.superview.layer insertSublayer:self.halo below:self.beaconView.layer];
    
    [self setupInitialValues];
    
    [self.halo start];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];

    self.halo.position = self.beaconView.center;
}


// =============================================================================
#pragma mark - Private

- (void)setupInitialValues {
    
    self.countSlider.value = 5;
    [self countChanged:nil];

    self.radiusSlider.value = 0.7;
    [self radiusChanged:nil];
    
    self.durationSlider.value = 0.5;
    [self durationChanged:nil];
    
    self.rSlider.value = 0.;
    self.gSlider.value = 0.455;
    self.bSlider.value = 0.756;
    [self colorChanged:nil];
}


// =============================================================================
#pragma mark - IBAction

- (IBAction)countChanged:(UISlider *)sender {
    
    //you can specify the number of halos by initial method or by instance property "haloLayerNumber"
    float value = floor(self.countSlider.value);
    self.halo.haloLayerNumber = value;
    self.countLabel.text = [@(value) stringValue];
}

- (IBAction)radiusChanged:(UISlider *)sender {
    
    self.halo.radius = self.radiusSlider.value * kMaxRadius;
    
    self.radiusLabel.text = [NSString stringWithFormat:@"%.0f", self.radiusSlider.value * kMaxRadius];
}

- (IBAction)durationChanged:(UISlider *)sender {
    
    self.halo.animationDuration = self.durationSlider.value * kMaxDuration;
    
    self.durationLabel.text = [NSString stringWithFormat:@"%.1f", self.durationSlider.value * kMaxDuration];
}

- (IBAction)colorChanged:(UISlider *)sender {
    
    UIColor *color = [UIColor colorWithRed:self.rSlider.value
                                     green:self.gSlider.value
                                      blue:self.bSlider.value
                                     alpha:1.0];
    
    [self.halo setBackgroundColor:color.CGColor];
    
    self.rLabel.text = [NSString stringWithFormat:@"%.2f", self.rSlider.value];
    self.gLabel.text = [NSString stringWithFormat:@"%.2f", self.gSlider.value];
    self.bLabel.text = [NSString stringWithFormat:@"%.2f", self.bSlider.value];
}

@end
