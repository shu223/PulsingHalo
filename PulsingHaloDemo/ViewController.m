//
//  ViewController.m
//  PulsingHaloDemo
//
//  Created by shuichi on 12/5/13.
//  Copyright (c) 2013 Shuichi Tsutsumi. All rights reserved.
//

#import "ViewController.h"
#import "PulsingHaloLayer.h"

#define kMaxRadius 160


@interface ViewController ()
@property (nonatomic, strong) PulsingHaloLayer *halo;
@property (nonatomic, weak) IBOutlet UIImageView *beaconView;
@property (nonatomic, weak) IBOutlet UISlider *radiusSlider;
@property (nonatomic, weak) IBOutlet UISlider *rSlider;
@property (nonatomic, weak) IBOutlet UISlider *gSlider;
@property (nonatomic, weak) IBOutlet UISlider *bSlider;
@property (nonatomic, weak) IBOutlet UILabel *radiusLabel;
@property (nonatomic, weak) IBOutlet UILabel *rLabel;
@property (nonatomic, weak) IBOutlet UILabel *gLabel;
@property (nonatomic, weak) IBOutlet UILabel *bLabel;
@end


@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.halo = [PulsingHaloLayer layer];
    self.halo.position = self.beaconView.center;
    [self.view.layer insertSublayer:self.halo below:self.beaconView.layer];
    
    [self setupInitialValues];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


// =============================================================================
#pragma mark - Private

- (void)setupInitialValues {

    self.radiusSlider.value = 0.5;
    [self radiusChanged:nil];
    
    self.rSlider.value = 0;
    self.gSlider.value = 0.487;
    self.bSlider.value = 1.0;
    [self colorChanged:nil];
}


// =============================================================================
#pragma mark - IBAction

- (IBAction)radiusChanged:(UISlider *)sender {
    
    self.halo.radius = self.radiusSlider.value * kMaxRadius;
    self.radiusLabel.text = [@(self.radiusSlider.value) stringValue];
}

- (IBAction)colorChanged:(UISlider *)sender {
    
    UIColor *color = [UIColor colorWithRed:self.rSlider.value
                                     green:self.gSlider.value
                                      blue:self.bSlider.value
                                     alpha:1.0];
    
    self.halo.backgroundColor = color.CGColor;
    
    self.rLabel.text = [@(self.rSlider.value) stringValue];
    self.gLabel.text = [@(self.gSlider.value) stringValue];
    self.bLabel.text = [@(self.bSlider.value) stringValue];
}

@end
